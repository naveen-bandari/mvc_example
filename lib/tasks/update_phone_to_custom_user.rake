# frozen_string_literal: true

namespace :users do
  desc 'updating a specific user using find by'

  task update_phone_to_user: :environment do
    User.find_by(email: 'user40000@abc.com')&.update(phone: '98765432310')
  end
end
