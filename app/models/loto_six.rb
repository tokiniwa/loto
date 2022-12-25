class LotoSix < ApplicationRecord
  validates :lottery_id, presence: true,
                         numericality: { only_integer: true, greater_than: 0 },
                         uniqueness: { scope: [:lottery_number] }
  validates :lottery_date, presence: true
  validates :lottery_number, presence: true,
                             numericality: { only_integer: true, greater_than: 0, less_than: 44 }
  validates :priority, presence: true,
                       numericality: { only_integer: true, greater_than: 0, less_than: 8 },
                       uniqueness: { scope: [:lottery_id] }
  validates :is_bonus, presence: true, inclusion: [true, false]

  scope :priority_order, -> { order(priority: :asc, id: :asc) }
end
