# U2.W5: Virus Predictor

# I worked on this challenge [by myself].

# EXPLANATION OF require_relative
# require_relative loads the file 'state_data' that is relative to this file 
#
require_relative 'state_data'

class VirusPredictor

  #Initializes the class VirusPredictor class with indicated properties 
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  #Runs private predicted_deaths and speed_of_spread methods to illustrate the the virus effects
  #The instance variables examined have a scope of the instance object 
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths
    speed_of_spread
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method
            #moving the private label would make the virus_effects method private, so it couldn't be called 
            #by a user

  #A private method that can only be used in the VirusPredictor class. 
  #predicted_death methods predict death based on density. Higher density translates to more relative deaths
  def predicted_deaths
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  #speed_of_spread method predicts spread of virus based on density. Higher density translates to a quicker spread
  def speed_of_spread #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end



#RELEASE 4: Report for all 50 States 

STATE_DATA.map{|state, info_hash| 
  VirusPredictor.new(state, 
                           STATE_DATA[state][:population_density],
                           STATE_DATA[state][:population],
                           STATE_DATA[state][:region],
                           STATE_DATA[state][:regional_spread]).virus_effects}
#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects




#REFLECTION 

=begin
  I enjoyed working on this challenge because I think it reflects the problem one may face when dealing 
  with set code or legacy code. It is obviously very bulky, but it is set up to handle a specific object. 

  This problem was about private/public methods and refactoring. The private/public distinction was one that I easily 
  picked up on. The refactoring was harder. 

  Mapping to al 50 states took a lot of code. I thought about refactoring the original class initializer because it took in 
  5 parameters, but that would depend on the source format never changing, which I thought I couldn't guarantee. 
  Also I thought about refactoring the private methods, but a case statement wouldn't work. I think the entire code needs an 
  overhaul. 

  While not dry, I don't think the code is terrible for running through 50 states. In a real situation, I think you would develop
  an national virus predictor and keep the state one separate. I know ruby is about keeping things dry, but you also don't want to lump
  important analysis features in one whole class. 

  I'm looking forward to more challenges like this one in the future. 
  
=end