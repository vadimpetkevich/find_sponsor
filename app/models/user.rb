class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:Investor, :Businessman]
  belongs_to :profile, :polymorphic => true, :dependent => :destroy

  validates :login, presence: true, length: { maximum: 40 }
end
