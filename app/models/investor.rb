class Investor < ActiveRecord::Base
  nilify_blanks
  acts_as_voter

  has_one :user, :as => :profile, :dependent => :destroy

  has_attached_file :avatar, :default_url => "/images/missing.png", :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :size => { :less_than => 1.megabytes }
end
