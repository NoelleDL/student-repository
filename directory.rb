
@students = [] # an empty array accessible to all methods
#put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "What cohort?"
    cohort = STDIN.gets.chomp
    if cohort == ""
      cohort = "November"
    end
    #add the student hash to the array
    add_name_cohort_to_array(name, cohort)
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    #get another name from the user
    name = STDIN.gets.chop
  end
  # return the array of input_student
  @students
end

def add_name_cohort_to_array(name, cohort = "November")
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_students_list
  cohorts = []
  @students.each do |student| cohorts << student[:cohort]
  end
  cohorts.uniq.each { |month|
    puts month
    @students.each { |student| puts student[:name] if student[:cohort].eql?(month) }
  }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end
#nothing happens until we call the methods
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_name_cohort_to_array(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students
    return
  end  # loads students.csv file if no file is given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
      puts "Students saved!"
    when "4"
      load_students
      puts "Students loaded!"
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
