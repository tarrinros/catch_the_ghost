class NightLevel
  attr_reader :title, :daytime

  def initialize(quest_data)
    @quest_data = quest_data
    @title = quest_data['title']
    @daytime = quest_data['daytime_description']
  end

  # Arrival methods
  def arrival
    <<-HEREDOC
    ================================================
    #{@quest_data['arrival']['main_text']}

    #{@quest_data['arrival']['go_to_front_door']}
    #{@quest_data['arrival']['go_to_backyard']}
    HEREDOC
  end

  def arrival_secret_choice
    @quest_data['arrival']['secret_choice']
  end

  def arrival_bad_decision
    @quest_data['arrival']['bad_decision']
  end

  def flashlight_on
    <<-HEREDOC
    ================================================
    #{@quest_data['flashlight_on']['main_text']}

    #{@quest_data['flashlight_on']['go_to_front_door']}
    #{@quest_data['flashlight_on']['go_to_backyard']}
    HEREDOC
  end

  def leave_game

  end
  # Flashligh_on methods
  # Front door methods
  # Backyard basement methods
  # Front door broken
  # First floor
  # Firstfloor police
  # Secondfloor police
end