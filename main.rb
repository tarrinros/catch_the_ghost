# Считывать из него уровни
# Возвращать массив хэшей уровней
# Когда игрок выбирает одно из значений - переходит на следующий уровень

require 'json'

INTRO_URL = 'data/intro.json'
DAY_QUEST_URL = 'data/day_quest.json'
NIGHT_QUEST_URL = 'data/night_quest.json'

# Программа должна загружать файл вступления формата JSON +
intro_data = JSON.parse(File.read(INTRO_URL))

puts intro_data['title'].upcase
puts '=============================================='
puts "#{intro_data['text']} #{intro_data['hint']}"
puts '=============================================='
puts 'Для того, чтобы подтвердить выбор, введите "1" и нажмите Enter: '

daytime_choice = 0

while daytime_choice != 1
  daytime_choice = STDIN.gets.to_i
  if daytime_choice != 1
    puts 'Вы ввели неправильное значение'
  end
end

# Во вступлении считывать системное время и загружать соответствующий json файл уровней + Time.now.hour
quest_file_url = (6..20).cover?(18) ? DAY_QUEST_URL : NIGHT_QUEST_URL
quest_data = JSON.parse(File.read(quest_file_url))

broken_door = nil
first_floor_discovered = nil
second_floor_discovered = nil
basement_discovered = nil
users_choice = 0

puts quest_data['daytime_description']
puts '================================================'
puts quest_data['arrival']['main_text']
puts ''
puts quest_data['arrival']['go_to_front_door']
puts quest_data['arrival']['go_to_backside']

users_choice = STDIN.gets.to_i

if users_choice == 1
  puts quest_data['front_yard']['front_door']['main_text']
  puts ''
  puts quest_data['front_yard']['front_door']['pull_door']
  puts quest_data['front_yard']['front_door']['go_to_backside']
elsif users_choice == 2
  puts quest_data['back_side']['back_yard']['main_text']
  puts ''
  puts quest_data['back_side']['back_yard']['down_to_basement']
  puts quest_data['back_side']['back_yard']['look_up']
else
  puts 'Вы ввели неправильное значение'
end