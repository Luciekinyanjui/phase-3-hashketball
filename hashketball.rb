def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def num_points_scored(player_name)
  player = player_stats(player_name)
  player[:points]
end

def shoe_size(player_name)
  player = player_stats(player_name)
  player[:shoe]
end

# helper method to find a team by their team name
def find_team(team_name)
  # #find on with a hash returns an array with the first key and value that match the condition
  team_info = game_hash.find do |location, team_data|
    team_data[:team_name] == team_name
  end

  # return just the value (team_data) from the .find method
  team_info[1]
end

def team_colors(team_name)
  team = find_team(team_name)
  team[:colors]
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  team = find_team(team_name)
  team[:players].map do |player|
    player[:number]
  end
end

def player_stats(player_name)
  all_players.find do |player| 
    player[:player_name] == player_name 
  end
end

# helper method to find the player with the biggest shoe
def big_shoe_player
  # https://ruby-doc.org/core-3.0.1/Enumerable.html#method-i-max_by
  all_players.max_by do |player|
    player[:shoe]
  end
end

def big_shoe_rebounds
  big_shoe_player[:rebounds]
end