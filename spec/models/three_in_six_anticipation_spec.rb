require 'rails_helper'

RSpec.describe ThreeInSixAnticipation, type: :model do
  describe 'リレーション' do
    it { is_expected.to belong_to(:event).required }
    it { is_expected.to belong_to(:theoretical_winning).optional }
  end

  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :three_in_six_anticipation }

      it { is_expected.to validate_uniqueness_of(:event_id) }
    end
  end
end
