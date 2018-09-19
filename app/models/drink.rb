class Drink < ApplicationRecord
  # has_many :user_drinks
  # has_many :users, through: :user_drinks

  # has_many :event_drinks
  # has_many :events, through: :event_drinks

  validates :name, presence: true
  validates :volume, presence: true
  validates :alcohol_rate, presence: true
  validates :alcohol_unit, presence: true

  # validates :photo, presence: true
  before_validation :set_alcohol_unit

  private
    def set_alcohol_unit
      self.alcohol_unit = self.volume * self.alcohol_rate / 100
    end


end
