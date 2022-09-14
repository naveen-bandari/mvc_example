# frozen_string_literal: true

namespace :after_party do
  desc 'Deployment task: updating_every_article_with_default_first_blog'
  task update_articles_with_default_blog: :environment do
    puts "Running deploy task 'update_articles_with_default_blog'"

    Article.update_all(blog_id: Blog.first.id)

    AfterParty::TaskRecord.create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
