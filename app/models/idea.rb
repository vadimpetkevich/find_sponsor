class Idea < ActiveRecord::Base
  belongs_to :businessman, :dependent => :destroy
  validates :title, :description, :branch, :location, :demands, :businessman_id, presence: true
  validates :title, :branch, :location, length: { maximum: 140 }
end
