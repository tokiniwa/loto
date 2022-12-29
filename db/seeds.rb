require 'csv'

target_files = Dir.glob('db/data/**')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE events;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_sixes;")

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    event = Event.find_or_initialize_by(lottery_id: row['lottery_id'].to_i)
    if event.new_record?
      event.lottery_date = row['lottery_date'].to_date
      event.save!
    end

    1.upto(6) do |i|
      loto_six = LotoSix.find_or_initialize_by(event: event, priority: i)
      if loto_six.new_record?
        loto_six.lottery_number = row["number#{i}"].to_i
        loto_six.is_bonus = false
        loto_six.save!
      end
    end

    bonus_number = LotoSix.find_or_initialize_by(event: event, is_bonus: true)
    if bonus_number.new_record?
      bonus_number.lottery_number = row["bonus"].to_i
      bonus_number.priority = 7
      bonus_number.save!
    end
  end
end
