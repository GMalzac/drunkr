class EventDrink < ApplicationRecord
  belongs_to :event
  belongs_to :drink
  validates :event, presence: true
  validates :drink, presence: true
end
