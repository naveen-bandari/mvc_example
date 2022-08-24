# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to   :user
  belongs_to   :blog, optional: true
  belongs_to   :category, optional: true
end
