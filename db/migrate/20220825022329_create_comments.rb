# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :article, foreign_key: true
      t.string  :comment
      t.integer :rating

      t.timestamps
    end
  end
end
