class AddSpecificationsToPlace < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :specification, :text
  end
end
