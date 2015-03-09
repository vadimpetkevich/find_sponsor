class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_column :users, :profile_id, :integer
    add_column :users, :profile_type, :string
  end
end
