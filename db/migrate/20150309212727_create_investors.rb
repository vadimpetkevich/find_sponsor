class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :first_name
      t.string :last_name
      t.string :skype
      t.string :branch
      t.string :location
      t.string :provide
      t.string :team_role
      t.date :birth_date

      t.timestamps null: false
    end
  end
end
