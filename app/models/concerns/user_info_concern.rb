# frozen_string_literal: true

module UserInfoConcern
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    def user_profile(user_id)
      puts "===========user_id"
      # user = User.find(user_id)
      user = User.find_by(id: user_id)

      return {} if user.blank?

      {
        name: user.name,
        email: user.email,
        phone: user.phone,
        uid: user.uid
      }
    end

    def user_name(user_id)
      user = User.find_by(id: user_id)
      return nil if user.blank?

      user.name
    end

    def user_email(user_id)
      #TODO:
    end
  end
end
