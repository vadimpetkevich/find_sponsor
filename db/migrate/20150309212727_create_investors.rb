class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :login
      t.string :first_name
      t.string :last_name
      t.string :skype
      t.string :branch
      t.string :location
      t.string :provide
      t.string :team_role

      t.timestamps null: false
    end

    add_index :investors, :login,                unique: true
  end
end
