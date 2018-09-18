class Drink < ApplicationRecord
  # has_many :user_drinks
  # has_many :users, through: :user_drinks

  # has_many :event_drinks
  # has_many :events, through: :event_drinks

  validates :name, presence: true
  validates :volume, presence: true
  validates :alcohol_rate, presence: true
  # validates :alcohol, presence: true
  # validates :photo, presence: true
end
