
#put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "What cohort?"
  cohort = gets.chomp.to_sym
  if cohort == nil
    cohort = :november
  end 
  puts "Please enter hobby"
  hobbies = gets.chomp
  puts "Please enter country"
  country = gets.chomp
  puts "Please enter height"
  height = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # return the array of input_student
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  i = 0
  while i < students.length
    student = students[i]
    puts "#{student[:name]} (#{student[:cohort]} cohort), Hobby: #{student[:hobbies]}, Country: #{student[:country]}, Height: #{student[:height]}".center(75)
    i += 1
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
