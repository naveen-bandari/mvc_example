# frozen_string_literal: true

class AddReadToArtcile < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :read, :boolean, default: false
  end
end
