class CreateLotoEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :loto_events do |t|
      t.integer :lottery_id, null: false
      t.date :lottery_date, null: false
      t.integer :lottery_type, null: false
      t.timestamps
      t.index [:lottery_id, :lottery_type], unique: true, name: "uidx_loto_events_01"
    end
  end
end
