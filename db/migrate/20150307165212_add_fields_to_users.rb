class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string, null: false
    add_column :users, :role, :integer, null: false
    add_column :users, :profile_id, :integer, null: false
    add_column :users, :profile_type, :string, null: false

    add_index :users, :login,               unique: true
  end
end
