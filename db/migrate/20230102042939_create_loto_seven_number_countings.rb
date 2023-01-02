class CreateLotoSevenNumberCountings < ActiveRecord::Migration[7.0]
  def change
    create_table :loto_seven_number_countings do |t|
      t.integer :number, null: false
      t.integer :lottery_number1, null: false, default: 0
      t.integer :lottery_number2, null: false, default: 0
      t.integer :lottery_number3, null: false, default: 0
      t.integer :lottery_number4, null: false, default: 0
      t.integer :lottery_number5, null: false, default: 0
      t.integer :lottery_number6, null: false, default: 0
      t.integer :lottery_number7, null: false, default: 0
      t.float :lottery_number_rate1, null: false, default: 0
      t.float :lottery_number_rate2, null: false, default: 0
      t.float :lottery_number_rate3, null: false, default: 0
      t.float :lottery_number_rate4, null: false, default: 0
      t.float :lottery_number_rate5, null: false, default: 0
      t.float :lottery_number_rate6, null: false, default: 0
      t.float :lottery_number_rate7, null: false, default: 0
      t.timestamps
      t.index [:number], unique: true, name: "uidx_loto_seven_number_countings_01"
    end
  end
end
