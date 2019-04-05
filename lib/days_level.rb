# Level class, when user choose the daytime
class DaysLevel
  attr_reader :title, :daytime, :returning_message,
              :broken_door, :first_floor_discovered,
              :second_floor_discovered, :basement_discovered,
              :secret_word

  def initialize(quest_data)
    @quest_data = quest_data
    @title = quest_data['title']
    @daytime = quest_data['daytime_description']
    @returning_message = quest_data['go_home']
    @broken_door = false
    @first_floor_discovered = false
    @second_floor_discovered = false
    @basement_discovered = false
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

  # Frontyard
  def go_to_front_door
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['front_door']['main_text']}
  
      #{@quest_data['front_yard_level']['front_door']['pull_door']}
      #{@quest_data['front_yard_level']['front_door']['go_backyard']}
    HEREDOC
  end

  def brake_front_door
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['front_door_broken']['main_text']}
  
      #{@quest_data['front_yard_level']['front_door_broken']['go_first_floor']}
      #{@quest_data['front_yard_level']['front_door_broken']['go_backyard']}
      #{@quest_data['front_yard_level']['front_door_broken']['leave_game']}
    HEREDOC
  end

  def return_from_back_yard
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['front_door_broken']['main_text']}
  
      #{@quest_data['front_yard_level']['front_door_broken']['go_first_floor']}
      #{@quest_data['front_yard_level']['front_door_broken']['leave_game']}
    HEREDOC
  end

  def first_floor_start
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['first_floor_start']['main_text']}
  
      #{@quest_data['front_yard_level']['first_floor_start']['discover_first_floor']}
      #{@quest_data['front_yard_level']['first_floor_start']['discover_second_floor']}
    HEREDOC
  end

  def dicover_first_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['first_floor_dicover']['main_text']}
  
      #{@quest_data['front_yard_level']['first_floor_dicover']['leave_game']}
      #{@quest_data['front_yard_level']['first_floor_dicover']['discover_second_floor']}
    HEREDOC
  end

  def dicover_second_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['second_floor_dicover']['main_text']}
  
      #{@quest_data['front_yard_level']['second_floor_dicover']['leave_game']}
      #{@quest_data['front_yard_level']['second_floor_dicover']['go_first_floor']}
    HEREDOC
  end

  def precycle_first_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['first_floor_precycle']['main_text']}
  
      #{@quest_data['front_yard_level']['first_floor_precycle']['leave_game']}
      #{@quest_data['front_yard_level']['first_floor_precycle']['go_second_floor']}
    HEREDOC
  end

  def cycle_second_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['second_floor_cycle']['main_text']}
  
      #{@quest_data['front_yard_level']['second_floor_cycle']['go_first_floor']}
      #{@quest_data['front_yard_level']['second_floor_cycle']['leave_game']}
    HEREDOC
  end

  def cycle_first_floor
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['first_floor_cycle']['main_text']}
  
      #{@quest_data['front_yard_level']['first_floor_cycle']['go_second_floor']}
      #{@quest_data['front_yard_level']['first_floor_cycle']['leave_game']}
    HEREDOC
  end

  def police_arrived
    <<~HEREDOC
      ================================================
      #{@quest_data['front_yard_level']['police_arrival']['main_text']}
  
      #{@quest_data['front_yard_level']['police_arrival']['answer_1']}
      #{@quest_data['front_yard_level']['police_arrival']['answer_2']}
      #{@quest_data['front_yard_level']['police_arrival']['answer_3']}
    HEREDOC
  end

  def be_arrested
    @quest_data['front_yard_level']['police_arrival']['arrest']
  end

  def escape_successfully
    @quest_data['front_yard_level']['police_arrival']['escape_successfully']
  end

  # Backyard
  def go_to_backyard
    <<~HEREDOC
      ================================================
      #{@quest_data['back_yard_level']['back_yard']['main_text']}
  
      #{@quest_data['back_yard_level']['back_yard']['down_to_basement']}
      #{@quest_data['back_yard_level']['back_yard']['look_up']}
    HEREDOC
  end

  def discover_basement
    <<~HEREDOC
      ================================================
      #{@quest_data['back_yard_level']['discover_basement']['main_text']}
      #{@quest_data['back_yard_level']['discover_basement']['main_text_2']}
  
      #{@quest_data['back_yard_level']['discover_basement']['go_front_side']}
      #{@quest_data['back_yard_level']['discover_basement']['leave_game']}
    HEREDOC
  end

  def be_an_accident
    <<~HEREDOC
      ================================================
      #{@quest_data['back_yard_level']['accident']['main_text']}
  
      #{@quest_data['back_yard_level']['accident']['prey']}
      #{@quest_data['back_yard_level']['accident']['freeze']}
      #{@quest_data['back_yard_level']['accident']['save_yourself']}
    HEREDOC
  end

  def die
    @quest_data['back_yard_level']['accident']['bad_choice']
  end

  def safe_from_accident
    <<~HEREDOC
      ================================================
      #{@quest_data['back_yard_level']['accident_fails']['main_text']}
  
      #{@quest_data['back_yard_level']['accident_fails']['discover_basement']}
      #{@quest_data['back_yard_level']['accident_fails']['go_front_side']}
      #{@quest_data['back_yard_level']['accident_fails']['leave_game']}
    HEREDOC
  end
end