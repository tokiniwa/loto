require 'csv'

target_files = Dir.glob('db/data/**')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE theoretical_winnings;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE events;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_sixes;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE three_in_six_anticipations;")

TheoreticalWinning.create(grade: 1, winning: 200000000)
TheoreticalWinning.create(grade: 2, winning: 10000000)
TheoreticalWinning.create(grade: 3, winning: 300000)
TheoreticalWinning.create(grade: 4, winning: 6800)
TheoreticalWinning.create(grade: 5, winning: 1000)

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    event = Event.create!(lottery_id: row['lottery_id'].to_i, lottery_date: row['lottery_date'].to_date)
    1.upto(6) { |i| LotoSix.create!(event: event, lottery_number: row["number#{i}"].to_i, priority: i, is_bonus: false) }
    LotoSix.create!(event: event, lottery_number: row["bonus"].to_i, priority: 7, is_bonus: true)
  end
end
