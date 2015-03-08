class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.string :branch
      t.string :location
      t.text :team
      t.text :plans
      t.text :demands
      t.integer :businessman_id

      t.timestamps null: false
    end
  end
end
