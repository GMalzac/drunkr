class UserDrink < ApplicationRecord
  belongs_to :user
  belongs_to :drink
  validates :user, presence: true
  validates :drink, presence: true
end
