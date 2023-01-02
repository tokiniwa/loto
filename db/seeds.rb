require 'csv'

# 共通処理
ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_events;")

# ロト6のデータ投入
target_files = Dir.glob('db/data/loto_six.csv')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_six_numbers;")

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    event = LotoEvent.create!(lottery_id: row['lottery_id'].to_i, lottery_date: row['lottery_date'].to_date, lottery_type: :loto_six)
    1.upto(6) { |i| LotoSixNumber.create!(loto_event: event, lottery_number: row["number#{i}"].to_i, priority: i) }
  end
end

# ロト7のデータ投入
target_files = Dir.glob('db/data/loto_seven.csv')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_seven_numbers;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_seven_number_countings;")

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    event = LotoEvent.create!(lottery_id: row['lottery_id'].to_i, lottery_date: row['lottery_date'].to_date, lottery_type: :loto_seven)
    1.upto(7) { |i| LotoSevenNumber.create!(loto_event: event, lottery_number: row["number#{i}"].to_i, priority: i) }
  end
end

# ロト7のカウンティングデータ投入

1.upto(37) { |i| LotoSevenNumberCounting.create!(number: i) }
LotoSevenNumberCounting.set_lottery_numbers
