class LotoEvent < ApplicationRecord
  has_many :loto_six_numbers, -> { priority_order }
  has_many :loto_seven_numbers, -> { priority_order }

  validates :lottery_id, presence: true,
             numericality: { only_integer: true, greater_than: 0 },
             uniqueness: { scope: [:lottery_type] }
  validates :lottery_date, presence: true
  validates :lottery_type, presence: true

  enum lottery_type: { loto_six: 1, loto_seven: 2 }

  scope :lottery_date_order, -> { order(lottery_date: :desc) }
end
