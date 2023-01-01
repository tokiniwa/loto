class CreateLotoSixEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :loto_six_events do |t|
      t.integer :lottery_id, null: false
      t.date :lottery_date, null: false
      t.timestamps
      t.index :lottery_id, unique: true, name: "uidx_loto_six_events_01"
    end
  end
end
