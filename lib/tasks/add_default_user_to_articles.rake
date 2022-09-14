# frozen_string_literal: true

namespace :articles do
  task add_default_user_to_articles: :environment do
    Article.all.each do |article|
      puts "============article.user_id========#{article.user_id}"
      next if article.user_id.present?

      article.update(user_id: User.first.id) #NORMAL UPDATE/SAVE --WILL TRIGGER CALL BACKS
    end
  end
end
