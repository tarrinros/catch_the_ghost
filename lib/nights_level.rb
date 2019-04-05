# Level class, when user choose the night
class NightsLevel
  attr_reader :title, :daytime, :leave_game_message, :secret_word

  def initialize(quest_data)
    @quest_data = quest_data
    @title = quest_data['title']
    @daytime = quest_data['daytime_description']
    @leave_game_message = quest_data['go_home']
    @secret_word = quest_data['secret_choice']
  end

  def arrive
    <<~HEREDOC
      ================================================
      #{@quest_data['arrival']['main_text']}
  
      #{@quest_data['arrival']['go_front_door']}
      #{@quest_data['arrival']['go_backyard']}
    HEREDOC
  end

  def die_in_the_dark
    @quest_data['arrival']['bad_decision']
  end

  def flashlight_on
    <<~HEREDOC
      ================================================
      #{@quest_data['flashlight_on']['main_text']}
  
      #{@quest_data['flashlight_on']['go_front_door']}
      #{@quest_data['flashlight_on']['go_backyard']}
    HEREDOC
  end

  def go_to_front_door
    <<~HEREDOC
      ================================================
      #{@quest_data['front_door']['main_text']}
  
      #{@quest_data['front_door']['pull_door']}
      #{@quest_data['front_door']['go_backyard']}
    HEREDOC
  end

  def go_to_backyard
    <<~HEREDOC
      ================================================
      #{@quest_data['back_yard_basement']['main_text']}
      #{@quest_data['back_yard_basement']['main_text_2']}
  
      #{@quest_data['back_yard_basement']['surrender']}
      #{@quest_data['back_yard_basement']['escape']}
    HEREDOC
  end

  def surrender_on_backyard
    @quest_data['back_yard_basement']['bad_decision']
  end

  def escape_from_backyard
    @quest_data['back_yard_basement']['good_decision']
  end

  def brake_front_door
    <<~HEREDOC
      ================================================
      #{@quest_data['front_door_broken']['main_text']}
  
      #{@quest_data['front_door_broken']['go_first_floor']}
      #{@quest_data['front_door_broken']['leave_game']}
    HEREDOC
  end

  def discover_first_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['first_floor']['main_text']}
  
      #{@quest_data['first_floor']['discover_first_floor']}
      #{@quest_data['first_floor']['discover_second_floor']}
    HEREDOC
  end

  def police_arrived_first_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['first_floor_police']['main_text']}
  
      #{@quest_data['first_floor_police']['surrender']}
      #{@quest_data['first_floor_police']['escape']}
    HEREDOC
  end

  def police_arrived_second_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['second_floor_police']['main_text']}
  
      #{@quest_data['second_floor_police']['surrender']}
      #{@quest_data['second_floor_police']['escape']}
    HEREDOC
  end

  def escape_successfully
    @quest_data['first_floor_police']['good_escape']
  end

  def escape_unsuccessfully
    @quest_data['second_floor_police']['bad_escape']
  end

  def be_arrested
    @quest_data['arrest']
  end
end