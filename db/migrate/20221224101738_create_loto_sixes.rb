class CreateLotoSixes < ActiveRecord::Migration[7.0]
  def change
    create_table :loto_sixes do |t|
      t.integer :lottery_id, null: false
      t.date :lottery_date, null: false
      t.integer :lottery_number, null: false
      t.integer :priority, null: false
      t.boolean :is_bonus, null: false, defalut: false
      t.timestamps
      t.index [:lottery_id, :lottery_number], unique: true, name: "uidx_loto_sixes_01"
      t.index [:lottery_id, :priority], unique: true, name: "uidx_loto_sixes_02"
    end
  end
end
