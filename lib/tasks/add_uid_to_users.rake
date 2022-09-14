# frozen_string_literal: true

namespace :add_uid_to_users do
  desc 'updating all the old users uid values'
  task update_uid: :environment do
    # TODO: code will be in this block
    User.all.each do |user|
      puts "=========user::uid::#{user.uid}"

      uid = nil
      loop do
        uid = SecureRandom.hex(13)
        break if User.where(uid: uid).count.zero?
      end
      puts "=======uid:::: #{uid}========="
      user.update(uid: uid)
    end
  end
end