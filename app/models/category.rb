# frozen_string_literal: true

class Category < ApplicationRecord
  include UserInfoConcern

  has_many :articles
end
