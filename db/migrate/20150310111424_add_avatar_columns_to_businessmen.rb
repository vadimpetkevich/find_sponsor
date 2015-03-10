class AddAvatarColumnsToBusinessmen < ActiveRecord::Migration
  def self.up
    change_table :businessmen do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :businessmen, :avatar
  end
end
