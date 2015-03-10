class Idea < ActiveRecord::Base
  nilify_blanks

  belongs_to :businessman

  validates :title, presence: true, length: { in: 2..100 }
  validates :branch, :location,  length: { maximum: 40 }
end
