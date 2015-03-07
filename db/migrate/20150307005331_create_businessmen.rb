class CreateBusinessmen < ActiveRecord::Migration
  def change
    create_table :businessmen do |t|

      t.timestamps null: false
    end
  end
end
