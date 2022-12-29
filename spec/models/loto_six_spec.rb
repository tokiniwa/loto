require 'rails_helper'

RSpec.describe LotoSix, type: :model do
  describe 'リレーション' do
    it { is_expected.to belong_to(:event).required }
  end

  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :loto_six }

      it { is_expected.to validate_uniqueness_of(:lottery_number).scoped_to(:event_id) }
      it { is_expected.to validate_uniqueness_of(:priority).scoped_to(:event_id) }
    end

    describe 'presence' do
      it { is_expected.to validate_presence_of :lottery_number }
      it { is_expected.to validate_presence_of :priority }
    end

    describe 'numericality' do
      it { is_expected.to validate_numericality_of(:lottery_number).only_integer.is_greater_than(0).is_less_than(44) }
      it { is_expected.to validate_numericality_of(:priority).only_integer.is_greater_than(0).is_less_than(8) }
    end
  end
end
