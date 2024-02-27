class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :title
      t.string :address
      t.string :description
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
