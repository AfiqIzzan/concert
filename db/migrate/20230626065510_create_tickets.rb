class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
