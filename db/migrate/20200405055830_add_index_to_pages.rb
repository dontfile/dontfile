class AddIndexToPages < ActiveRecord::Migration[6.0]
  def change
    add_index :pages, :url, unique: true
  end
end
