class Businessman < ActiveRecord::Base
  has_one :user, :as => :profile, :dependent => :destroy
  has_many :ideas, :dependent => :destroy
end
