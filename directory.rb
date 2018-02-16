
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
    puts "Please enter hobby"
    hobbies = gets.chop
    puts "Please enter country"
    country = gets.chop
    puts "Please enter height"
    height = gets.chop
    #add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
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
students = input_students
if students.count > 1
  print_header
  print(students)
  print_footer(students)
end
