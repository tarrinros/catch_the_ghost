# Считывать из него уровни
# Возвращать массив хэшей уровней
# Когда игрок выбирает одно из значений - переходить на следующий уровень

require 'json'

INTRO_URL = 'data/intro.json'
DAY_QUEST_URL = 'data/day_quest.json'
NIGHT_QUEST_URL = 'data/night_quest.json'

# Программа должна загружать файл вступления формата JSON +
intro_data = JSON.parse(File.read(INTRO_URL))

puts intro_data['title']
puts
puts "#{intro_data['text'] + intro_data['hint']}"

# Во вступлении считывать системное время и загружать соответствующий json файл уровней
quest_file_url = DAY_QUEST_URL if (6..20).cover?(Time.now.hour) | NIGHT_QUEST_URL

quest_data = JSON.parse(File.read(quest_file_url))

puts quest_data['title']