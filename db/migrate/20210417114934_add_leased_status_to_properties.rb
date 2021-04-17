class AddLeasedStatusToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :leased, :boolean, default: false
  end
end
