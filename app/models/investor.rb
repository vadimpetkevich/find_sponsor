class Investor < ActiveRecord::Base
  nilify_blanks

  has_one :user, :as => :profile, :dependent => :destroy

  has_attached_file :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :size => { :less_than => 1.megabytes }
end
