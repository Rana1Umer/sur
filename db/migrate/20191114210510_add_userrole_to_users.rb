class AddUserroleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :string
    add_column :users, :visitor, :string
  end
end
