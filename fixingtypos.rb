def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chop
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  puts "What cohort?"
  cohort = gets.chop
  if cohort == ""
    cohort = "November"
  end
  students << {name: name, cohort: cohort}
  if students.count > 1
    puts "Now we have #{students.count} students"
  else
    puts "Now we have #{students.count} student"
  end
  # get another name from the user
  name = gets.chop
  end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
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

students = input_students
print_header
print(students)
print_footer(students)
