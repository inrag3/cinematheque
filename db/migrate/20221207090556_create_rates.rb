class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.decimal :rate_value

      t.timestamps
    end
  end
end
