class LotoSevenNumberCounting < ApplicationRecord
  validates :number, presence: true,
                     numericality: { only_integer: true, greater_than: 0, less_than: 38 },
                     uniqueness: true
  validates :lottery_number1, presence: true
  validates :lottery_number2, presence: true
  validates :lottery_number3, presence: true
  validates :lottery_number4, presence: true
  validates :lottery_number5, presence: true
  validates :lottery_number6, presence: true
  validates :lottery_number7, presence: true

  scope :number_order, -> { order(number: :asc) }
end
