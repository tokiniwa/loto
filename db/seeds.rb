require 'csv'

target_files = Dir.glob('db/data/**')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE theoretical_winnings;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE events;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_sixes;")

TheoreticalWinning.create(grade: 1, winning: 200000000)
TheoreticalWinning.create(grade: 2, winning: 10000000)
TheoreticalWinning.create(grade: 3, winning: 300000)
TheoreticalWinning.create(grade: 4, winning: 6800)
TheoreticalWinning.create(grade: 5, winning: 1000)

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    event = Event.new(lottery_id: row['lottery_id'].to_i)
    event.lottery_date = row['lottery_date'].to_date
    event.save!

    1.upto(6) do |i|
      loto_six = LotoSix.new(event: event, priority: i)
      loto_six.lottery_number = row["number#{i}"].to_i
      loto_six.is_bonus = false
      loto_six.save!
    end

    bonus_number = LotoSix.new(event: event, is_bonus: true)
    bonus_number.new_record?
    bonus_number.lottery_number = row["bonus"].to_i
    bonus_number.priority = 7
    bonus_number.save!
  end
end
