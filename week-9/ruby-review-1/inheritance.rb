# Introduction to Inheritance

# I worked on this challenge [with: Sasha Tailor and Bill Brinkert].


# Pseudocode
# GlobalCohort
# 1. student names array of strings
# 2. cohort name - string
# 3. p0_start_date - date_time object
# 4. immersive_satrt_date - date_time_object
# 5. graduation_date - date_time_object
# 6. email list -array of strings
# 7. num_of_students - Fixnum
#  Methods
#  1. add_student - args = str for student name
#  2. remove_student - args = str for student name
#  3. currently_in_phase - args (nothing, just check local D/T)
#  4. graduated - args = nothing returns boolean

# LocalCohort
# 1. city
# 2. 
# 

# Initial Solution
require 'date'

class GlobalCohort
  
  attr_reader :students, :cohort_name, :p0_start_date, :immersive_start_date, :graduation_date, :email_list, :num_of_students

  def initialize(cohort_name, p0_start_date)

    @students = []
    @cohort_name = cohort_name
    @p0_start_date = Date.parse(p0_start_date)
    @immersive_start_date = @p0_start_date + (7*9)
    @graduation_date = @immersive_start_date + (7*9)
    @email_list = []
    @num_of_students = @students.length
  
  end
  
  def add_student(f_name, l_name, email )
    @students.push(f_name.concat(" " + l_name))
    @email_list.push(email)  
  end
  
  def remove_student(f_name, l_name, email)
    name = f_name.concat(" " + l_name)
    @students.delete_if {|x| x == name}
    @email_list.delete_if {|x| x == email}
  end
  
  def currently_in_phase
    today = Date.today
    p2_start_date = @immersive_start_date + 21
    p3_start_date = p2_start_date + 21
    
    case today
      when @p0_start_date..@immersive_start_date
        "Phase 0"
      when @immersive_start_date..p2_start_date
        "Phase 1"
      when p2_start_date..p3_start_date
        "Phase 2"
      when p3_start_date..@graduation_date
        "Phase 3"
      else
      graduated? ? "They have graduated." : "They have not started yet"
    end
  end
  
  def graduated?
    Date.today >= @graduation_date
  end
  

end

class LocalCohort < GlobalCohort
  
  attr_accessor :city
  
  def initialize(cohort_name, p0_start_date, city)
    super(cohort_name, p0_start_date)
    @city = city
  end
  

end

# Driver Code

IslandFoxes = LocalCohort.new("Island Foxes", "2015-09-28", "Chicago")

p IslandFoxes.city 
p IslandFoxes.p0_start_date
p IslandFoxes.immersive_start_date
p IslandFoxes.graduation_date

IslandFoxes.add_student("John","Smith","johnsmith@gmail.com")
p IslandFoxes.students
p IslandFoxes.email_list

IslandFoxes.add_student("Sam","Smith","samsmith@gmail.com")

p IslandFoxes.students
p IslandFoxes.email_list

IslandFoxes.remove_student("Sam","Smith","samsmith@gmail.com")

p IslandFoxes.students
p IslandFoxes.email_list

p IslandFoxes.currently_in_phase
p IslandFoxes.graduated?







# Reflection