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
What are the differences between the two different hash syntaxes shown in the state_data file?

  In one case the keys are strings and in the second case the keys are symbols.  Symbols are
  immutable and are not created as objects each time in the hash, so it improves performance
  and saves memory.

What does require_relative do? How is it different from require?

  require_relative looks for a file within the directory, and as such, you don't need to specify
  a file extension.  "Require" on the other needs to have a full directory path and file extension
  in order to find the file in question.

What are some ways to iterate through a hash?

  You can iterate through a hash using each.  You can iterate through just the keys by saying 
  my_hash.keys.each or at just the values with my_hash.values.each.  If you use my_hash.each and only
  provide one variable in the pipes, that variable will hold the key/value pair.  If you declare two
  variables in the pipes, then the first will represent the keys and the second will represent the
  values.

When refactoring virus_effects, what stood out to you about the variables, if anything?

  That speed and number_of_deaths could be made into instance variables!  Also, that the initialize
  method does not actually need all of those discreet elements of data to be passed in since STATE_DATA
  is accessible globally.

What concept did you most solidify in this challenge?

  This challenge really helped me with seeing refactoring possibilities.

