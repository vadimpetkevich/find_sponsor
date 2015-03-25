class User < ActiveRecord::Base
  before_save :set_profile
  acts_as_commontator

  belongs_to :profile, :polymorphic => true, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :async

  validates :role, presence: true
  enum role: [:investor, :businessman, :admin]

  validates :login, presence: true, length: { in: 2..40 }, uniqueness: true

  def role? role
    self.role == role.to_s
  end

  private

    def set_profile
      unless self.profile
        self.profile = case self.role
                            when 'investor'
                              Investor.new
                            when 'businessman'
                              Businessman.new
                            end
      end
    end
end
