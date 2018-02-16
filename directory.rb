
#put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
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
    students << {name: name, cohort: cohort}
    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    #get another name from the user
    name = gets.chop
  end
  # return the array of input_student
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  cohorts = []
  students.each do |student| cohorts << student[:cohort]
  end
  cohorts.uniq.each { |month|
    puts month
    students.each { |student| puts student[:name] if student[:cohort].eql?(month) }
  }
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
def interactive_menu
  students = []
  while true do
    # 1. print the menu and ask the user for selection
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. save input in variable
    selection = gets.chomp
    # 3. execute user selection
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      break 
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
