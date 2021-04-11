class RemoveUnusedPhotoField < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :photo
  end
end
