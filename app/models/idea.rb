class Idea < ActiveRecord::Base
  nilify_blanks
  acts_as_votable
  after_update :send_email, :if => :published_changed?

  belongs_to :businessman

  scope :published, -> { where(published: true) }

  validates :title, presence: true, length: { in: 2..100 }
  validates :businessman_id, presence: true
  validates :branch, :location,  length: { maximum: 40 }

  private
    def send_email
      puts 'here' * 100
    end
end
