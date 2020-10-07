require 'date'

@students = []

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist - please try again"
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.split(",")
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
  puts "Students saved to file"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << { name: name.capitalize, cohort: get_cohort.to_sym }
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  @students
end

def get_cohort
  cohort = ""
  while true do
    puts "Which cohort are they in?"
    cohort = STDIN.gets.chomp.downcase
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

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_in_cohorts
  cohorts = []
  @students.each do |student|
    cohorts << student[:cohort]
  end
  cohorts.uniq!
  cohorts.each do |cohort|
    @students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_in_cohorts
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  while true do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
# print_in_cohorts(students)
