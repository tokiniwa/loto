class LotoSixEvent < ApplicationRecord
  has_many :loto_six_numbers, -> { priority_order }

  validates :lottery_id, presence: true,
             numericality: { only_integer: true, greater_than: 0 },
             uniqueness: true
  validates :lottery_date, presence: true

  scope :lottery_date_order, -> { order(lottery_date: :desc) }
end
