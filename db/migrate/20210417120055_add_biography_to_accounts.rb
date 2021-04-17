class AddBiographyToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :biography, :text
  end
end
