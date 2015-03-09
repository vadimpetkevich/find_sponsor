class CreateBusinessmen < ActiveRecord::Migration
  def change
    create_table :businessmen do |t|
      t.string :login
      t.string :first_name
      t.string :last_name
      t.string :skype

      t.timestamps null: false
    end

    add_index :businessmen, :login,                unique: true
  end
end
