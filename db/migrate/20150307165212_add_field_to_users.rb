class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :users, :login, :string
    add_column :users, :skype, :string

    add_column :users, :role, :integer
    add_column :users, :profile_id, :integer
    add_column :users, :profile_type, :string
  end
end
