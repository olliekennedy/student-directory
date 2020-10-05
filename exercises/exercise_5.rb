# First, we print the list of students
=begin students = [
  { name: "Dr. Hannibal Lecter", cohort: :november },
  { name: "Darth Vader", cohort: :november },
  { name: "Nurse Ratched", cohort: :november },
  { name: "Michael Corleone", cohort: :november },
  { name: "Alex DeLarge", cohort: :november },
  { name: "The Wicked Witch of the West", cohort: :november },
  { name: "Terminator", cohort: :november },
  { name: "Freddy Kreuger", cohort: :november },
  { name: "The Joker", cohort: :november },
  { name: "Joffrey Baratheon", cohort: :november },
  { name: "Norman Bates", cohort: :november },
]
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  while true do
    new_student = instantiate_student
    break if new_student == nil
    students << new_student
    puts "Now we have #{students.count} students"
  end
  students
end

def instantiate_student
  student = Hash.new
  puts "Please enter a name:"
  name = gets.chomp.capitalize
  return nil if name == ""
  student[:name] = name
  student[:cohort] = :november
  puts "Which hobbies does #{name} have? (separated by spaces)"
  student[:hobbies] = gets.chomp.split(" ")
  puts "What is the country of birth for #{name}?"
  student[:country_of_birth] = gets.chomp.capitalize
  puts "How tall is #{name} in cm?"
  student[:height] = gets.chomp.to_i
  student
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort].to_s} cohort)
          Hobbies are: #{student[:hobbies].join(", ")}
          Country of birth is: #{student[:country_of_birth]}
          Height is: #{student[:height]}cm"
  end
end

def print_footer(students)
  puts students.count > 0 ? "Overall, we have #{students.count} great student#{students.count > 1 ? "s" : ""}" : "We have no students"
end

students = input_students
print_header
print(students)
print_footer(students)
