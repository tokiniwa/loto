class ThreeInSixAnticipation < ApplicationRecord
  belongs_to :event
  belongs_to :theoretical_winning, optional: true

  validates :event_id, uniqueness: true
end
