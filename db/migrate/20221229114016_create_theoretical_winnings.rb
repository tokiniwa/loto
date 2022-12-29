class CreateTheoreticalWinnings < ActiveRecord::Migration[7.0]
  def change
    create_table :theoretical_winnings do |t|
      t.integer :grade, null: false
      t.integer :winning, null: false
      t.timestamps
      t.index :grade, unique: true, name: "uidx_theoretical_winnings_01"
    end
  end
end
