# frozen_string_literal: true

class Like < ApplicationRecord
  include UserInfoConcern

  belongs_to  :user
  belongs_to  :article
end
