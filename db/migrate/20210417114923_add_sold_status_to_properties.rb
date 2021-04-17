class AddSoldStatusToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :sold, :boolean, default: false
  end
end
