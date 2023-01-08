class LotoSixNumber < ApplicationRecord
  belongs_to :loto_event

  validates :lottery_number, presence: true,
                             numericality: { only_integer: true, greater_than: 0, less_than: 44 },
                             uniqueness: { scope: [:loto_event_id] }
  validates :priority, presence: true,
                       numericality: { only_integer: true, greater_than: 0, less_than: 7 },
                       uniqueness: { scope: [:loto_event_id] }

  scope :priority_order, -> { order(priority: :asc) }

  def self.fetch_recommended_numbers lottery_id, past_number: 24, occurrences: [3, 4]
    event = LotoEvent.loto_six.find_by(lottery_id: lottery_id)
    events = LotoEvent.loto_six.where(lottery_date: ..event.lottery_date)
                      .lottery_date_order
                      .limit(past_number)

    LotoSixNumber.where(loto_event_id: events.ids)
                 .group(:lottery_number)
                 .count
                 .select { |k, v| occurrences.include?(v) }
  end
end
