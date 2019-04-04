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
quest_file_url = (6..20).cover?(21) ? DAY_QUEST_URL : NIGHT_QUEST_URL
quest_data = JSON.parse(File.read(quest_file_url))

broken_door = false
first_floor_discovered = false
second_floor_discovered = false
basement_discovered = false
users_choice = 0

puts quest_data['daytime_description']
puts '================================================'
puts quest_data['arrival']['main_text']
puts ''
puts quest_data['arrival']['go_to_front_door']
puts quest_data['arrival']['go_to_backyard']

if quest_data['title'] == 'night'
  puts quest_data['arrival']['leave_game']
end

users_choice = STDIN.gets.strip

# Условия для ночного времени
if (1..2).cover?(users_choice.to_i)
  puts ''
  puts quest_data['arrival']['bad_decision']
  exit
elsif users_choice == 'включить фонарик'
  puts ''
  puts quest_data['flashlight_on']['main_text']
  puts ''
  puts quest_data['flashlight_on']['go_front_door']
  puts quest_data['flashlight_on']['go_backside']

  users_choice = STDIN.gets.strip

  if users_choice == 1
    puts ''
    puts quest_data['front_door']['main_text']
    puts ''
    puts quest_data['front_door']['pull_door']
    puts quest_data['front_door']['go_backside']

    users_choice = STDIN.gets.strip

    if users_choice == 1
      puts ''
      puts quest_data['front_door_broken']['main_text']
      puts ''
      puts quest_data['front_door_broken']['go_first_floor']
      puts quest_data['front_door_broken']['leave_game']

      users_choice = STDIN.gets.strip

      if users_choice == 1
        puts ''
        puts quest_data['first_floor']['main_text']
        puts ''
        puts quest_data['first_floor']['discover_first_floor']
        puts quest_data['first_floor']['discover_second_floor']

        users_choice = STDIN.gets.strip

        if users_choice == 1
          puts ''
          puts quest_data['first_floor_police']['main_text']
          puts ''
          puts quest_data['first_floor_police']['surrender']
          puts quest_data['first_floor_police']['escape']

          users_choice = STDIN.gets.strip

        elsif users_choice == 2

        end
      elsif users_choice == 2

      end

    elsif users_choice == 2
    end

  elsif users_choice == 2
  end
else
  puts 'Вы ввели неправильное значение'
end