class Drink < ApplicationRecord
  has_many :user_drinks
  has_many :users, through: :user_drinks

  has_many :event_drinks
  has_many :events, through: :event_drinks
end
