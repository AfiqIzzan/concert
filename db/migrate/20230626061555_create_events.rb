class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :event_date
      t.integer :category
      t.integer :subcategory
      t.string :location


      t.timestamps
    end
  end
end
