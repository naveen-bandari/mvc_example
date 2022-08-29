# frozen_string_literal: true

class AddColumnToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :comments, :string
  end
end
