# frozen_string_literal: true

class User < ApplicationRecord
  has_many :users_categories, foreign_key: :user_id, dependent: :destroy

  accepts_nested_attributes_for :users_categories, allow_destroy: true, update_only: :true

  validates :name, presence: true
  validates :users_categories, length: {minimum: 1}
end
