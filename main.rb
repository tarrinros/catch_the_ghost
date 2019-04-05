# Считывать из него уровни
# Возвращать массив хэшей уровней
# Когда игрок выбирает одно из значений - переходит на следующий уровень

require 'json'
require './lib/level_night'
require './lib/level_day'

INTRO_URL = 'data/intro.json'
DAY_QUEST_URL = 'data/day_quest.json'
NIGHT_QUEST_URL = 'data/night_quest.json'

def wrong_answer
  'Вы ввели неправильное значение'
end

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
    puts wrong_answer
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

if quest_data['title'] == 'night'

  # Ночной уровень
  night_level = NightLevel.new(quest_data)

  puts night_level.daytime
  puts night_level.arrival

  users_choice = STDIN.gets.strip

  if (1..2).cover?(users_choice.to_i)
    puts ''
    puts night_level.arrival_bad_decision
    exit
  elsif users_choice == night_level.arrival_secret_choice
    puts ''
    puts night_level.flashlight_on

    users_choice = STDIN.gets.to_i

    if users_choice == 1
      puts ''
      puts night_level.front_door

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        puts night_level.front_door_broken

        users_choice = STDIN.gets.to_i

        if users_choice == 1
          puts ''
          puts night_level.first_floor

          users_choice = STDIN.gets.to_i

          if users_choice == 1
            puts ''
            puts night_level.first_floor_police

            users_choice = STDIN.gets.to_i

            if users_choice == 1
              puts ''
              puts night_level.arrest
              exit
            elsif users_choice == 2
              puts ''
              puts night_level.good_escape
              exit
            else
              puts wrong_answer
            end
          elsif users_choice == 2
            puts ''
            puts night_level.second_floor_police

            users_choice = STDIN.gets.to_i

            if users_choice == 1
              puts ''
              puts night_level.arrest
              exit
            elsif users_choice == 2
              puts ''
              puts night_level.bad_escape
              exit
            else
              puts wrong_answer
            end
          else
            puts wrong_answer
          end
        elsif users_choice == 2
          puts ''
          puts night_level.returning_message
        else
          puts wrong_answer
        end

      elsif users_choice == 2
        puts ''
        puts night_level.back_yard_basement

        users_choice = STDIN.gets.to_i

        if users_choice == 1
          puts ''
          puts night_level.back_yard_bad_decision
          exit
        elsif users_choice == 2
          puts ''
          puts night_level.back_yard_good_decision
          exit
        else
          puts wrong_answer
        end
      else
        puts wrong_answer
      end

    elsif users_choice == 2
      puts ''
      puts night_level.back_yard_basement

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        puts night_level.back_yard_bad_decision
        exit
      elsif users_choice == 2
        puts ''
        puts night_level.back_yard_good_decision
        exit
      else
        puts wrong_answer
      end
    else
      puts wrong_answer
    end
  elsif users_choice.to_i == 3
    puts night_level.returning_message
  else
    puts wrong_answer
  end

elsif quest_data['title'] == 'day'
  # Дневной уровень
end


