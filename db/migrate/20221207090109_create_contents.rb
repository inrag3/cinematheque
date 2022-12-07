class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.decimal :rating

      t.timestamps
    end
  end
end
