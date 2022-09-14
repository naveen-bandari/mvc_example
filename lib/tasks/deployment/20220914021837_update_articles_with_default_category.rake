namespace :after_party do
  desc 'Deployment task: update_articles_with_default_category'
  task update_articles_with_default_category: :environment do
    puts "Running deploy task 'update_articles_with_default_category'"

    Article.where(category_id: nil).update_all(category_id: Category.first.id)

    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end