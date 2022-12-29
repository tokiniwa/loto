class CreateThreeInSixAnticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :three_in_six_anticipations do |t|
      t.belongs_to :event, index: false, null: false
      t.belongs_to :theoretical_winning, index: false, null: true
      t.json :past_data_numbers
      t.json :previous_numbers
      t.json :previous_before_and_behind_numbers
      t.json :previous_last_digit_numbers
      t.timestamps
      t.index [:event_id], unique: true, name: "uidx_three_in_six_anticipations_01"
    end
  end
end
