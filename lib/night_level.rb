class NightLevel
  attr_reader :title, :daytime, :returning_message

  def initialize(quest_data)
    @quest_data = quest_data
    @title = quest_data['title']
    @daytime = quest_data['daytime_description']
    @returning_message = quest_data['go_home']
  end

  def arrival
    <<~HEREDOC
      ================================================
      #{@quest_data['arrival']['main_text']}
  
      #{@quest_data['arrival']['go_front_door']}
      #{@quest_data['arrival']['go_backyard']}
    HEREDOC
  end

  def arrival_secret_choice
    @quest_data['arrival']['secret_choice']
  end

  def arrival_bad_decision
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

  def front_door
    <<~HEREDOC
      ================================================
      #{@quest_data['front_door']['main_text']}
  
      #{@quest_data['front_door']['pull_door']}
      #{@quest_data['front_door']['go_backyard']}
    HEREDOC
  end

  def back_yard_basement
    <<~HEREDOC
      ================================================
      #{@quest_data['back_yard_basement']['main_text']}
      #{@quest_data['back_yard_basement']['main_text_2']}
  
      #{@quest_data['back_yard_basement']['surrender']}
      #{@quest_data['back_yard_basement']['escape']}
    HEREDOC
  end

  def back_yard_bad_decision
    @quest_data['back_yard_basement']['bad_decision']
  end

  def back_yard_good_decision
    @quest_data['back_yard_basement']['good_decision']
  end

  def front_door_broken
    <<~HEREDOC
      ================================================
      #{@quest_data['front_door_broken']['main_text']}
  
      #{@quest_data['front_door_broken']['go_first_floor']}
      #{@quest_data['front_door_broken']['leave_game']}
    HEREDOC
  end

  def first_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['first_floor']['main_text']}
  
      #{@quest_data['first_floor']['discover_first_floor']}
      #{@quest_data['first_floor']['discover_second_floor']}
    HEREDOC
  end

  def first_floor_police
    <<~HEREDOC
      ================================================
      #{@quest_data['first_floor_police']['main_text']}
  
      #{@quest_data['first_floor_police']['surrender']}
      #{@quest_data['first_floor_police']['escape']}
    HEREDOC
  end

  def second_floor_police
    <<~HEREDOC
      ================================================
      #{@quest_data['second_floor_police']['main_text']}
  
      #{@quest_data['second_floor_police']['surrender']}
      #{@quest_data['second_floor_police']['escape']}
    HEREDOC
  end

  def good_escape
    @quest_data['first_floor_police']['good_escape']
  end

  def bad_escape
    @quest_data['second_floor_police']['bad_escape']
  end

  def arrest
    @quest_data['arrest']
  end
end