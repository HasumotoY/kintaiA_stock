class RemoveSupporterToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :supporter, :string
  end
end
