class CreateLotoSixes < ActiveRecord::Migration[7.0]
  def change
    create_table :loto_sixes do |t|
      t.belongs_to :event, index: false, null: false
      t.integer :lottery_number, null: false
      t.integer :priority, null: false
      t.boolean :is_bonus, null: false, defalut: false
      t.timestamps
      t.index [:event_id, :lottery_number], unique: true, name: "uidx_loto_sixes_01"
      t.index [:event_id, :priority], unique: true, name: "uidx_loto_sixes_02"
    end
  end
end
