class Event < ApplicationRecord
  has_many :winning_numbers, -> { winnings.priority_order }, class_name: 'LotoSix', foreign_key: :event_id
  has_one :bonus_number, -> { bonuses }, class_name: 'LotoSix', foreign_key: :event_id
  has_one :three_in_six_anticipation

  validates :lottery_id, presence: true,
             numericality: { only_integer: true, greater_than: 0 },
             uniqueness: true
  validates :lottery_date, presence: true

  scope :lottery_date_order, -> { order(lottery_date: :desc) }
end
