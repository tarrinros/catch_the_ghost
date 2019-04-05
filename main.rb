# Считывать из него уровни
# Возвращать массив хэшей уровней
# Когда игрок выбирает одно из значений - переходит на следующий уровень

require 'json'
require './lib/nights_level'
require './lib/days_level'

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
quest_file_url = (6..20).cover?(22) ? DAY_QUEST_URL : NIGHT_QUEST_URL
quest_data = JSON.parse(File.read(quest_file_url))

if quest_data['title'] == 'night'
  # Ночной уровень
  night_level = NightsLevel.new(quest_data)

  puts night_level.daytime
  puts night_level.arrive

  users_choice = STDIN.gets.downcase

  if (1..2).cover?(users_choice.to_i)
    puts ''
    puts night_level.die_in_the_dark
    exit
  elsif users_choice == night_level.secret_word
    puts ''
    puts night_level.flashlight_on

    users_choice = STDIN.gets.to_i

    if users_choice == 1
      puts ''
      puts night_level.go_to_front_door

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        puts night_level.brake_front_door

        users_choice = STDIN.gets.to_i

        if users_choice == 1
          puts ''
          puts night_level.discover_first_floor

          users_choice = STDIN.gets.to_i

          if users_choice == 1
            puts ''
            puts night_level.police_arrived_first_floor

            users_choice = STDIN.gets.to_i

            if users_choice == 1
              puts ''
              puts night_level.be_arrested
              exit
            elsif users_choice == 2
              puts ''
              puts night_level.escape_successfully
              exit
            else
              puts wrong_answer
            end
          elsif users_choice == 2
            puts ''
            puts night_level.police_arrived_second_floor

            users_choice = STDIN.gets.to_i

            if users_choice == 1
              puts ''
              puts night_level.be_arrested
              exit
            elsif users_choice == 2
              puts ''
              puts night_level.escape_unsuccessfully
              exit
            else
              puts wrong_answer
            end
          else
            puts wrong_answer
          end
        elsif users_choice == 2
          puts ''
          puts night_level.leave_game_message
        else
          puts wrong_answer
        end

      elsif users_choice == 2
        puts ''
        puts night_level.go_to_backyard

        users_choice = STDIN.gets.to_i

        if users_choice == 1
          puts ''
          puts night_level.surrender_on_backyard
          exit
        elsif users_choice == 2
          puts ''
          puts night_level.escape_from_backyard
          exit
        else
          puts wrong_answer
        end
      else
        puts wrong_answer
      end

    elsif users_choice == 2
      puts ''
      puts night_level.go_to_backyard

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        puts night_level.surrender_on_backyard
        exit
      elsif users_choice == 2
        puts ''
        puts night_level.escape_from_backyard
        exit
      else
        puts wrong_answer
      end
    else
      puts wrong_answer
    end
  elsif users_choice.to_i == 3
    puts night_level.leave_game_message
  else
    puts wrong_answer
  end

elsif quest_data['title'] == 'day'
  # Дневной уровень
  day_level = DaysLevel.new(quest_data)

  puts day_level.daytime
  puts day_level.arrive

  users_choice = STDIN.gets.to_i

  # Обыскиваем дом с главного входа
  def search_frontyard(day_level)
    puts ''
    puts day_level.go_to_front_door

    users_choice = STDIN.gets.to_i

    if users_choice == 1
      puts ''
      puts day_level.brake_front_door

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        puts day_level.first_floor_start

        users_choice = STDIN.gets.to_i

        if users_choice == 1
          puts ''
          puts day_level.police_arrived

          users_choice = STDIN.gets.to_i

          if users_choice == 3
            puts ''
            puts day_level.escape_successfully
          else
            puts ''
            puts day_level.be_arrested
          end
        elsif users_choice == 2
          puts ''
          puts day_level.police_arrived

          users_choice = STDIN.gets.to_i

          if users_choice == 3
            puts ''
            puts day_level.escape_successfully
          else
            puts ''
            puts day_level.be_arrested
          end
        else
          puts wrong_answer
        end
      elsif users_choice == 2
        puts ''
        puts day_level.leave_game_message
      else
        puts wrong_answer
      end
    elsif users_choice == 2
      puts ''
      puts day_level.leave_game_message
    else
      puts wrong_answer
    end
  end

  # Обыскиваем задний двор
  def search_backyard(day_level)
    puts ''
    puts day_level.go_to_backyard

    users_choice = STDIN.gets.to_i

    if users_choice == 1
      puts ''
      puts day_level.discover_basement

      users_choice = STDIN.gets.to_i

      if users_choice == 1
        puts ''
        search_frontyard(day_level)
      elsif users_choice == 2
        puts ''
        puts day_level.leave_game_message
      else
        puts wrong_answer
      end
    elsif users_choice == 2
      puts ''
      puts day_level.look_up

      users_choice = STDIN.gets.strip.downcase

      if users_choice == day_level.secret_word
        puts ''
        puts day_level.safe_from_accident

        users_choice = STDIN.gets.to_i

        if users_choice == 1
          puts ''
          search_frontyard(day_level)
        elsif users_choice == 2
          puts ''
          puts day_level.leave_game_message
        else
          puts wrong_answer
        end

      else
        puts ''
        puts day_level.die
      end
    end
  end

  if users_choice == 1
    search_frontyard(day_level)
  elsif users_choice == 2
    search_backyard(day_level)
  else
    puts wrong_answer
  end
else
  puts 'Чо-то не то!'
end


