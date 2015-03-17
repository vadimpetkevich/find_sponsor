class Idea < ActiveRecord::Base
  nilify_blanks
  acts_as_votable
  after_update :send_email, :if => :published_changed?

  belongs_to :businessman

  validates :title, presence: true, length: { in: 2..100 }
  validates :businessman_id, presence: true
  validates :branch, :location,  length: { maximum: 40 }

  scope :published, -> { where(published: true) }

  private
    def send_email
      if self.published
        User.investor.each { |investor| IdeaMailer.published_email(investor).deliver_now }
      end
    end
end
