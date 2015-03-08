class User < ActiveRecord::Base
  before_save :set_profile

  enum role: [:Investor, :Businessman]
  validates :login, presence: true, length: { maximum: 40 }, uniqueness: { case_sensitive: false }
  belongs_to :profile, :polymorphic => true, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role? role
    self.role == role.to_s
  end

  private
    def set_profile
      unless self.profile
        self.profile = self.role == 0 ? Investor.new : Businessman.new
      end
    end
end
