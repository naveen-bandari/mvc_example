# frozen_string_literal: true

class Blog < ApplicationRecord
  has_many :articles
end
