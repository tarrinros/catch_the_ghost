# Считывать из него уровни
# Возвращать массив хэшей уровней
# Когда игрок выбирает одно из значений - переходит на следующий уровень

require 'json'
require './lib/night_level'

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

broken_door = false
first_floor_discovered = false
second_floor_discovered = false
basement_discovered = false
users_choice = 0

def wrong_answer
  'Вы ввели неправильное значение'
end

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

# Дневной уровень
if users_choice.to_i == 1
    puts ''
    puts quest_data['front_yard_level']['front_door']['main_text']
    puts ''
    puts quest_data['front_yard_level']['front_door']['pull_door']
    puts quest_data['front_yard_level']['front_door']['go_to_backside']

    users_choice = STDIN.gets.to_i

    if users_choice.to_i == 1
      puts ''
      puts quest_data['front_yard_level']['front_door_broken']['main_text']
      puts ''
      puts quest_data['front_yard_level']['front_door_broken']['go_first_floor']
      puts quest_data['front_yard_level']['front_door_broken']['go_backside']
      puts quest_data['front_yard_level']['front_door_broken']['go_home']

      users_choice = STDIN.gets.to_i

      if users_choice.to_i == 1
        puts ''
        puts quest_data['front_yard_level']['front_door_broken']['main_text']
        puts ''
        puts quest_data['front_yard_level']['front_door_broken']['go_first_floor']
        puts quest_data['front_yard_level']['front_door_broken']['go_backside']
        puts quest_data['front_yard_level']['front_door_broken']['go_home']

        users_choice = STDIN.gets.to_i
      elsif users_choice.to_i == 2
      elsif users_choice.to_i == 3
      else
        puts wrong_answer
      end
    elsif users_choice.to_i == 2
    elsif users_choice.to_i == 3
    else
      puts wrong_answer
    end
elsif users_choice.to_i == 2
else
  puts wrong_answer
end

# Ночной уровень
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

  users_choice = STDIN.gets.to_i

  if users_choice == 1
    puts ''
    puts quest_data['front_door']['main_text']
    puts ''
    puts quest_data['front_door']['pull_door']
    puts quest_data['front_door']['go_backside']

    users_choice = STDIN.gets.to_i

    if users_choice == 1
      puts ''
      puts quest_data['front_door_broken']['main_text']
      puts ''
      puts quest_data['front_door_broken']['go_first_floor']
      puts quest_data['front_door_broken']['leave_game']

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        puts quest_data['first_floor']['main_text']
        puts ''
        puts quest_data['first_floor']['discover_first_floor']
        puts quest_data['first_floor']['discover_second_floor']

        users_choice = STDIN.gets.to_i

        if users_choice == 1
          puts ''
          puts quest_data['first_floor_police']['main_text']
          puts ''
          puts quest_data['first_floor_police']['surrender']
          puts quest_data['first_floor_police']['escape']

          users_choice = STDIN.gets.to_i

          if users_choice == 1
            puts ''
            puts quest_data['first_floor_police']['bad_decision']
            exit
          elsif users_choice == 2
            puts ''
            puts quest_data['first_floor_police']['good_decision']
            exit
          end
        elsif users_choice == 2
          puts ''
          puts quest_data['second_floor_police']['main_text']
          puts ''
          puts quest_data['second_floor_police']['surrender']
          puts quest_data['second_floor_police']['escape']

          users_choice = STDIN.gets.to_i

          if users_choice == 1
            puts ''
            puts quest_data['second_floor_police']['normal_decision']
            exit
          elsif users_choice == 2
            puts ''
            puts quest_data['second_floor_police']['bad_decision']
            exit
          end
        end
      elsif users_choice == 2
        puts ''
        puts quest_data['front_door_broken']['go_home']
      end

    elsif users_choice == 2
      puts ''
      puts quest_data['back_yard_basement']['main_text']
      puts ''
      puts quest_data['back_yard_basement']['main_text_2']
      puts ''
      puts quest_data['back_yard_basement']['surrender']
      puts quest_data['back_yard_basement']['escape']

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        puts quest_data['back_yard_basement']['bad_decision']
        exit
      elsif users_choice == 2
        puts ''
        puts quest_data['back_yard_basement']['good_decision']
        exit
      end
    end

  elsif users_choice == 2
    puts ''
    puts quest_data['back_yard_basement']['main_text']
    puts ''
    puts quest_data['back_yard_basement']['main_text_2']
    puts ''
    puts quest_data['back_yard_basement']['surrender']
    puts quest_data['back_yard_basement']['escape']

    users_choice = STDIN.gets.to_i

    if users_choice == 1
      puts ''
      puts quest_data['back_yard_basement']['bad_decision']
      exit
    elsif users_choice == 2
      puts ''
      puts quest_data['back_yard_basement']['good_decision']
      exit
    end
  end
else
  puts 'Вы ввели неправильное значение'
end