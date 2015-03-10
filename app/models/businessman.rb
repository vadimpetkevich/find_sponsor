class Businessman < ActiveRecord::Base
  nilify_blanks

  has_one :user, :as => :profile, :dependent => :destroy
  has_many :ideas, :dependent => :destroy

  has_attached_file :avatar
  has_attached_file :avatar, :default_url => "/images/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :size => { :less_than => 1.megabytes }
end
