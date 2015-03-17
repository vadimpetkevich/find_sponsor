class User < ActiveRecord::Base
  before_save :set_profile

  belongs_to :profile, :polymorphic => true, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, presence: true
  enum role: [:Investor, :Businessman, :Admin]

  validates :login, presence: true, length: { in: 2..40 }, uniqueness: true

  def role? role
    self.role == role.to_s
  end

  private

    def set_profile
      unless self.profile
        self.profile = case self.role
                            when 'Investor'
                              Investor.new
                            when 'Businessman'
                              Businessman.new
                            end
      end
    end
end
