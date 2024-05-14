# frozen_string_literal: true

class Category < ApplicationRecord
  has_manu :articles
end
