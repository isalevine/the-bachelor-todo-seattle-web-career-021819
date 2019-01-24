require "pry"

def get_first_name_of_season_winner(data, season)
  contestant_hash = data
  first_name_winner = ""
  contestant_hash.each do |season_key, contestant_array|
    if season == season_key
      contestant_array.each do |person_hash|
        if person_hash["status"] == "Winner"
          full_name_winner = person_hash["name"]
          first_name_winner = full_name_winner.split(" ")[0]
        end
      end
    end
  end
  first_name_winner
end

def get_contestant_name(data, occupation)
  contestant_hash = data
  name_output = ""
  contestant_hash.each_value do |contestant_array|
    contestant_array.each do |person_hash|
      if person_hash["occupation"] == occupation
        name_output = person_hash["name"]
      end
    end
  end
  name_output
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  contestant_hash = data
  contestant_hash.each_value do |contestant_array|
    contestant_array.each do |person_hash|
      if person_hash["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  occupation_output = ""
  contestant_hash = data
  contestant_hash.each_value do |contestant_array|
    contestant_array.each do |person_hash|
      if occupation_output != ""
        break
      elsif person_hash["hometown"] == hometown
        occupation_output = person_hash["occupation"]
      end
    end
  end
  occupation_output
end

def get_average_age_for_season(data, season)
  average_age = 0.0
  age_array = []
  contestant_hash = data
  contestant_hash.each do |season_key, contestant_array|
    if season == season_key
      contestant_array.each do |person_hash|
        age_array << person_hash["age"].to_f
      end
    end
  end
  age_float = age_array.inject { |sum, n| sum + n } / age_array.length
  average_age = age_float.rounds
  average_age
end
