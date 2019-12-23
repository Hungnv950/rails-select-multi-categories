# frozen_string_literal: true

class User < ApplicationRecord
  MIN_SIZE = 1

  has_many :users_categories, foreign_key: :user_id, dependent: :destroy

  accepts_nested_attributes_for :users_categories, allow_destroy: true

  validates :name, presence: true
  validate :validate_users_categories

  private
  def validate_users_categories
    errors.add(:users_categories, :minsize) if(users_categories.size < MIN_SIZE)
  end
end
