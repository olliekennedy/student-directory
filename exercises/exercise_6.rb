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
  puts "Please enter the names of the students".center(71)
  puts "To finish, just hit return twice".center(71)
  name = gets.chomp

  students = []
  while !name.empty? do
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students".center(71)
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(71)
  puts "-------------".center(71)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(71)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(71)
end

students = input_students
print_header
print(students)
print_footer(students)
