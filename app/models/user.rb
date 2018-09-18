class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_drinks, dependent: :destroy
  has_many :drinks, through :user_drinks

  has_many :user_events
  has_many :events, through :user_events

  validates :email, presence: true, uniqueness: true
end
