require 'csv'

target_files = Dir.glob('db/data/**')

ActiveRecord::Base.connection.execute("TRUNCATE TABLE loto_sixes;")

target_files.each do |file|
  CSV.foreach(file, headers: true) do |row|
    1.upto(6) do |i|
      loto_six = LotoSix.find_or_initialize_by(lottery_id: row['lottery_id'].to_i)
      loto_six.lottery_date = row['lottery_date'].to_date
      loto_six.lottery_number = row["number#{i}"].to_i
      loto_six.priority = i
      loto_six.is_bonus = false
      loto_six.save!
    end

    loto_six = LotoSix.find_or_initialize_by(lottery_id: row['lottery_id'].to_i)
    loto_six.lottery_date = row['lottery_date'].to_date
    loto_six.lottery_number = row["bonus"].to_i
    loto_six.priority = 7
    loto_six.is_bonus = true
    loto_six.save!
  end
end
