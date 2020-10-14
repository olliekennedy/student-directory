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

def add_to_students(name, cohort)
  @students << { name: name.capitalize, cohort: cohort.to_sym }
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.split(",")
    add_to_students(name, cohort)
  end
  file.close
  puts "......students loaded"
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  while true do
    name = STDIN.gets.chomp
    break if name == ""
    add_to_students(name, get_cohort)
    puts "Now we have #{@students.count} students"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
  puts "Students saved to file"
end

def get_cohort
  cohort = ""
  while true do
    puts "Which cohort are they in?"
    cohort = STDIN.gets.chomp.downcase
    puts valid_month?(cohort) ? break : "Not a valid cohort - try a full month"
  end
  cohort
end

def valid_month?(str)
  Date::MONTHNAMES.include?(str.downcase.capitalize) ? true : false
end

def print_header
  puts "The students of Villains Academy\n-------------"
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
      puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:cohort] == cohort
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  menu_options = ["1. Input the students",
                  "2. Show the students",
                  "3. Save the list to students.csv",
                  "4. Load the list from students.csv",
                  "9. Exit"]
  menu_options.each do |x|
    puts x
  end
end

def show_students
  print_header
  print_students_in_cohorts
  print_footer
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit
    else puts "I don't know what you meant, try again"
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
