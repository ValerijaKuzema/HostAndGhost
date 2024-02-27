class AddDeathDateToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :death_date, :string
  end
end
