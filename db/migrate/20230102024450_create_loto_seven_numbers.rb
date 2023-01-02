class CreateLotoSevenNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :loto_seven_numbers do |t|
      t.belongs_to :loto_event, index: false, null: false
      t.integer :lottery_number, null: false
      t.integer :priority, null: false
      t.timestamps
      t.index [:loto_event_id, :lottery_number], unique: true, name: "uidx_loto_seven_numbers_01"
      t.index [:loto_event_id, :priority], unique: true, name: "uidx_loto_seven_numbers_02"
    end
  end
end
