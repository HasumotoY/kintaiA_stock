class RemoveNameBasesStatusToBases < ActiveRecord::Migration[5.1]
  def change
    remove_column :bases, :name, :string
    remove_column :bases, :bases_status, :string
  end
end
