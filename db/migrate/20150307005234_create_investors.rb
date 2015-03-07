class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :branch
      t.string :location
      t.string :provide
      t.string :team_role

      t.timestamps null: false
    end
  end
end
