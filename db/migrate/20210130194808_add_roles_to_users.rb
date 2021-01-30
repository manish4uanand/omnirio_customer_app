class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :customer, :boolean
    add_column :users, :branch_manager, :boolean
  end
end
