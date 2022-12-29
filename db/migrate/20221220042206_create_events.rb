class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :lottery_id, null: false
      t.date :lottery_date, null: false
      t.timestamps
      t.index :lottery_id, unique: true, name: "uidx_events_01"
    end
  end
end
