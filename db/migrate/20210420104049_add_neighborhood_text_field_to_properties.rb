class AddNeighborhoodTextFieldToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :neighborhood_text, :string
  end
end
