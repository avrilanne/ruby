# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# require 'csv'

# participants_csv_text = File.read(Rails.root.join('lib', 'seeds', 'participants.csv'))
# csv = CSV.parse(participants_csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   p = Person.find_or_create_by!(name: row[0])
#   e = Event.find_or_create_by!(name: row[1])
#   l = League.find_or_create_by!(name: row[2])
#   p.update_attributes(league_id: l.id)
# end

# weigh_ins_csv_text = File.read(Rails.root.join('lib', 'seeds', 'weighins.csv'))
# csv = CSV.parse(weigh_ins_csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   CreateCheckin.call(Person.find_or_create_by!(name: row[0]), Event.find_or_create_by(name: row[2]), row[1].to_i, nil)
# end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'participants.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  participant_name = row[0]
  participant_event = row[1]
  participant_league = row[2]
  unless Person.pluck(:name).include?(participant_name)
    p = Person.new
    p.name = participant_name
    p.save
  end
  unless Event.pluck(:name).include?(participant_event)
    e = Event.new
    e.name = participant_event
    e.save
  end
  unless League.pluck(:name).include?(participant_league)
    l = League.new
    l.name = participant_league
    l.save
    p.league_id = l.id
    p.save
  end
end

puts "There are now #{Person.count} rows in the people table"
puts "There are now #{Event.count} rows in the event table"
puts "There are now #{League.count} rows in the league table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'weighins.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  checkin_name = row[0]
  checkin_weight = row[1].to_i
  checkin_event = row[2]
  CreateCheckin.call(Person.find_by(name: checkin_name), Event.find_by(name: checkin_event), checkin_weight, nil)
end

puts "There are now #{Checkin.count} rows in the checkin table"
