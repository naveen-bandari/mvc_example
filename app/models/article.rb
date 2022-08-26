# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to   :user
  belongs_to   :blog, optional: true
  belongs_to   :category, optional: true
  has_many  :comments
  has_many  :likes

  before_validation :set_default_user

  # Setting up the default user whenever we are not passing the user_id
  def set_default_user
    return if user_id

    self.user = User.first # backup
  end
end
