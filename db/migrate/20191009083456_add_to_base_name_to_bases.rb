class AddToBaseNameToBases < ActiveRecord::Migration[5.1]
  def change
    add_column :bases, :base_name, :string
  end
end
