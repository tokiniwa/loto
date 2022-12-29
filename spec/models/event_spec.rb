require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'リレーション' do
    it { is_expected.to have_many :loto_sixes }
  end

  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :event }

      it { is_expected.to validate_uniqueness_of(:lottery_id) }
    end

    describe 'presence' do
      it { is_expected.to validate_presence_of :lottery_id }
      it { is_expected.to validate_presence_of :lottery_date }
    end

    describe 'numericality' do
      it { is_expected.to validate_numericality_of(:lottery_id).only_integer.is_greater_than(0) }
    end
  end
end
