class ChangeColumnsStartEndInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :start, :date
    change_column :bookings, :end, :date
  end
end
