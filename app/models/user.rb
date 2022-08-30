# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  has_many :likes

  before_create :generate_uid
  before_validation :add_prefix_to_name

  def generate_uid
    return if uid

    token = nil
    loop do
      token = SecureRandom.hex(13)
      break if User.where(uid: token).count.zero?
    end
    self.uid = token
  end

  def add_prefix_to_name
    return if name.blank?

    return if name.starts_with?('MVC-')

    self.name = 'MVC- ' + name
  end
end
