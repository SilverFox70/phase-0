require_relative 'state_data'

class VirusPredictor
  
  # Sets all instance variables to equal the values passed into
  # the constructor
  def initialize(state_of_origin)
    @state = state_of_origin
    @population = STATE_DATA[@state][:population]
    @population_density = STATE_DATA[@state][:population_density]
  end

  # This method calls both the predicted_deaths and speed_of_spread
  # methods. 
  def virus_effects
    predicted_deaths
    speed_of_spread
    print "#{@state} will lose #{@number_of_deaths} people in this outbreak and will spread across the state in #{@speed} months.\n\n"
  end

  private
  
  # Using population density only predicts the number of deaths
  # for a given state and outputs a this information as a string
  # to the console.
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      modifier = 0.4 
    elsif @population_density >= 150
      modifier = 0.3
    elsif @population_density >= 100
      modifier = 0.2
    elsif @population_density >= 50
      modifier = 0.1
    else
      modifier = 0.05
    end
    @number_of_deaths = (@population * modifier).floor
  end

  # This method return a speed of spread in months based on 
  # population density and outputs this to the console
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      @speed = 0.5
    elsif @population_density >= 150
      @speed = 1
    elsif @population_density >= 100
      @speed = 1.5
    elsif @population_density >= 50
      @speed = 2
    else
      @speed = 2.5
    end   
  end

end

#=======================================================================

# DRIVER CODE
# initialize VirusPredictor for each state

def display_all_state_info()
  STATE_DATA.each do |state, data_hash|
    VirusPredictor.new(state).virus_effects
  end
end

display_all_state_info
# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section