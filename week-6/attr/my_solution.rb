#Attr Methods

# I worked on this challenge [by myself]

# I spent [#] hours on this challenge.

class NameData
  attr_reader :name

  def initialize(name)
  	@name = name
  end

end


class Greetings

  def initialize(name)
  	@namedata = NameData.new(name)
  end

  def hello
  	puts "Hello #{@namedata.name}! How wonderful to see you today."
  end

end

greet = Greetings.new('William')
greet.hello



# Reflection

# Release 1
#    What are these methods doing?
#       All of the change_my_BLANK methods are changing the attribute values 
#       of the instance of Profile, which we call instance_of_profile. All
#       of the other methods are simply returning the attribute value we ask
#       for using full method declarations

#    How are they modifying or returning the values of instance variables?    
#       They are all using fully declared methods to modify or return
#       data to /from the instance variables

# Release 2
#    What has changed between these releases?
#       @age is now delcared with an attr_reader which allows us to access
#       that attribute's value without having to define a whole method for
#       that purpose.

#    What was replaced?
#       The method def what_is_age has been replaced with an attr_reader

#    Is this code simpler than the last?
#       Yes, it is less verbose.

# Release 3
#    What has changed between these releases?
#       age now has an attr_writer

#    What was replaced?
#       The method change_my_age= has been replaced by the attr_writer

#    Is this code simpler than the last?
#       Yes, it is less verbose.
