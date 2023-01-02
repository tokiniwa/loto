require 'csv'

# ロト6のデータ作成
target_files = Dir.glob('db/data/loto_six.csv')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_six_events;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_six_numbers;")

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    event = LotoSixEvent.create!(lottery_id: row['lottery_id'].to_i, lottery_date: row['lottery_date'].to_date)
    1.upto(6) { |i| LotoSixNumber.create!(loto_six_event: event, lottery_number: row["number#{i}"].to_i, priority: i) }
  end
end

# ロト7のデータ作成
target_files = Dir.glob('db/data/loto_seven.csv')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_six_events;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_six_numbers;")

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    event = LotoSixEvent.create!(lottery_id: row['lottery_id'].to_i, lottery_date: row['lottery_date'].to_date)
    1.upto(6) { |i| LotoSixNumber.create!(loto_six_event: event, lottery_number: row["number#{i}"].to_i, priority: i) }
  end
end

