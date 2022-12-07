class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :contents, foreign_key: true, index: false
    add_reference :contents, :content_types, foreign_key: true, index: false
    add_reference :contents, :genres, foreign_key: true, index: false
    add_reference :rates, :users, foreign_key: true, index: false
    add_reference :rates, :contents, foreign_key: true, index: false
    add_reference :comments, :users, foreign_key: true, index: false
    add_reference :comments, :contents, foreign_key: true, index: false
  end
end
