# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
