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
    if valid_month?(cohort)
      break
    else
      puts "Not a valid cohort - try a full month"
    end
    #valid_month?(cohort) ? break : puts "Not a valid cohort - try a full month"
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

def print_in_cohorts(students)
  cohorts = []
  students.each do |student|
    cohorts << student[:cohort]
  end
  cohorts.uniq!
  cohorts.each do |cohort|
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def interactive_menu
  students = []
  while true do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end


interactive_menu
# print_in_cohorts(students)
