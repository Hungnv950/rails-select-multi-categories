# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :users_categories, foreign_key: :category_id, dependent: :destroy
end
