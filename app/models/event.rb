class Event < ApplicationRecord
  has_many :event_drinks
  has_many :drinks, through :event_drinks

  has_many :user_events
  has_many :users, through :user_events
end
