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

# In the input_students method the cohort value is hard-coded.
# How can you ask for both the name and the cohort?
# What if one of the values is empty?
# Can you supply a default value?
# The input will be given to you as a string?
# How will you convert it to a symbol?
# What if the user makes a typo?
require 'date'

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  students = []
  while !name.empty? do
    students << { name: name.capitalize, cohort: get_cohort.to_sym }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def get_cohort
  cohort = ""
  while true do
    puts "Which cohort are they in?"
    cohort = gets.chomp.downcase
    valid_month?(cohort) ? break : puts "Not a valid cohort - try a full month"
  end
  cohort
end

def valid_month?(str)
  Date::MONTHNAMES.include?(str.downcase.capitalize) ? true : false
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
