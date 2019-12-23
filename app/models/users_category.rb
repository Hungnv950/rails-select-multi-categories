# frozen_string_literal: true

class UsersCategory < ApplicationRecord
  OTHER_CONTENT = "other_content"

  belongs_to :user, foreign_key: :user_id, optional: true
  belongs_to :category, class_name: Category.name

  attr_accessor :key_name

  delegate :key_name, :content, to: :category, prefix: true

  validate :validate_other_content

  def category_name
    category_key_name == OTHER_CONTENT ? other_content : category_content
  end

  private
  def validate_other_content
    errors.add(:other_content, :blank) if(category_key_name == OTHER_CONTENT && other_content.blank?)
  end
end
