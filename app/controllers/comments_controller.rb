# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    comment = @article.comments.new(comments_params)

    if comment.save
      redirect_to(article_path(@article), notice: "Comentário criado com sucesso!")
    else
      redirect_to(article_path(@article), alert: "Erro ao criar comentário! - #{comment.error.full_messages.join(",")}")
    end
  end

  def like
    comment_like_dislike = CommentLikeDislike.find_or_initialize_by(comment_id: params[:id], user: current_user)

    if comment_like_dislike.new_record?
      comment_like_dislike.save!
      Comment.find(params[:id]).increment!(:like)
      redirect_to(article_path(@article), notice: "Like registrado!")
    else
      message = "Não foi possível registrar o like!"
      message = "Você já registrou seu like/dislike!" unless comment_like_dislike.new_record?

      redirect_to(article_path(@article), alert: message)
    end
  end

  def dislike
    comment_like_dislike = CommentLikeDislike.find_or_initialize_by(comment_id: params[:id], user: current_user)

    if comment_like_dislike.new_record?
      comment_like_dislike.save!
      Comment.find(params[:id]).increment!(:dislike)
      redirect_to(article_path(@article), notice: "Like registrado!")
    else
      message = "Não foi possível registrar o dislike!"
      message = "Você já registrou seu like/dislike!" unless comment_like_dislike.new_record?

      redirect_to(article_path(@article), alert: message)
    end
  end

  private

  def set_article
    @article = Article.friendly.find(params[:article_id])
  end

  def comments_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
