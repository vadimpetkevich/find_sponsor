class CreateBusinessmen < ActiveRecord::Migration
  def change
    create_table :businessmen do |t|
      t.string :first_name
      t.string :last_name
      t.string :skype
      t.date :birth_date

      t.timestamps null: false
    end
  end
end
