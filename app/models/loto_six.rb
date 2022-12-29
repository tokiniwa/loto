class LotoSix < ApplicationRecord
  belongs_to :event

  validates :lottery_number, presence: true,
                             numericality: { only_integer: true, greater_than: 0, less_than: 44 },
                             uniqueness: { scope: [:event_id] }
  validates :priority, presence: true,
                       numericality: { only_integer: true, greater_than: 0, less_than: 8 },
                       uniqueness: { scope: [:event_id] }
  validates :is_bonus, inclusion: [true, false]

  scope :priority_order, -> { order(priority: :asc) }
end
