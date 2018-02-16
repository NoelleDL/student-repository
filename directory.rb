@students = [] # an empty array accessible to all methods
#put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.chop

  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "What cohort?"
    cohort = gets.chop
    if cohort == ""
      cohort = "November"
    end
    #add the student hash to the array
    @students << {name: name, cohort: cohort}
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    #get another name from the user
    name = gets.chop
  end
  # return the array of input_student
  @students
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
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
