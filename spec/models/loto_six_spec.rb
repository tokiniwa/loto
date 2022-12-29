require 'rails_helper'

RSpec.describe LotoSix, type: :model do
  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :loto_six }

      it { is_expected.to validate_uniqueness_of(:lottery_id).scoped_to(:lottery_number) }
      it { is_expected.to validate_uniqueness_of(:priority).scoped_to(:lottery_id) }
    end

    describe 'presence' do
      it { is_expected.to validate_presence_of :lottery_id }
      it { is_expected.to validate_presence_of :lottery_date }
      it { is_expected.to validate_presence_of :lottery_number }
      it { is_expected.to validate_presence_of :priority }
    end

    describe 'numericality' do
      it { is_expected.to validate_numericality_of(:lottery_id).only_integer.is_greater_than(0) }
      it { is_expected.to validate_numericality_of(:lottery_number).only_integer.is_greater_than(0).is_less_than(44) }
      it { is_expected.to validate_numericality_of(:priority).only_integer.is_greater_than(0).is_less_than(8) }
    end
  end
end
