# frozen_string_literal: true

class ChangeUsersUidToNotNull < ActiveRecord::Migration[6.1]
  def change
    User.all.each do |user|
      uid = nil
      loop do
        uid = SecureRandom.hex(13)
        break if User.where(uid: uid).count.zero?
      end
      user.update(uid: uid)
    end

    change_column_null(:users, :uid, false)
  end
end
