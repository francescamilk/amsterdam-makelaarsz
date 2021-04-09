class DropOldAparmentsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :apartments
  end
end
