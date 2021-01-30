class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :role_name, unique: true
      t.string :role_code, unique: true

      t.timestamps
    end
  end
end
