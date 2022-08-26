# frozen_string_literal: true

class RemoveCommentsFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :comments
  end
end
