class LotoSixNumber < ApplicationRecord
  belongs_to :loto_event

  validates :lottery_number, presence: true,
                             numericality: { only_integer: true, greater_than: 0, less_than: 44 },
                             uniqueness: { scope: [:loto_event_id] }
  validates :priority, presence: true,
                       numericality: { only_integer: true, greater_than: 0, less_than: 7 },
                       uniqueness: { scope: [:loto_event_id] }

  scope :priority_order, -> { order(priority: :asc) }
end
