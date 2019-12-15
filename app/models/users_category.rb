# frozen_string_literal: true

class UsersCategory < ApplicationRecord
  OTHER_CONTENT = "other_content"

  belongs_to :user, foreign_key: :user_id, optional: true
  belongs_to :category, class_name: Category.name

  delegate :key_name, :content, to: :category, allow_nil: true

  validates :other_content, presence: true, if: lambda { key_name == OTHER_CONTENT }

  def category_name
    key_name == OTHER_CONTENT ? other_content : content
  end
end
