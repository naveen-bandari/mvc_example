# frozen_string_literal: true

class AddReferencesToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, foreign_key: true
    add_reference :articles, :category, foreign_key: true
    add_reference :articles, :blog, foreign_key: true
  end
end
