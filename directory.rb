@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Display source code"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    method_selector(STDIN.gets.chomp)
  end
end

def method_selector(user_input)
  case user_input
    when "1"
      option_1
    when "2"
      option_2
    when "3"
      option_3
    when "4"
      option_4
    when "5"
      print_source_code
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def option_1
  input_students
  action_complete
end

def option_2
  display_student_list
  action_complete
end

def option_3
  puts "Which file would you like to save to?"
  file_choice = STDIN.gets.chomp
  save_students(file_choice)
  action_complete
end

def option_4
  puts "Which file would you like to load?"
  file_choice = STDIN.gets.chomp
  load_students(file_choice)
  action_complete
end

def action_complete
  puts "Action completed."
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = "november"
  while !name.empty? do
    add_to_student_array(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def add_to_student_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def display_student_list
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename)
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv")
  @students.clear
  require 'csv'
  CSV.foreach(filename) do |row|
    name, cohort = row
    add_to_student_array(name, cohort)
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students()
    number_of_students("students.csv")
  elsif File.exists?(filename)
    load_students(filename)
    number_of_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def number_of_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
end

def print_source_code
  File.open(__FILE__, "r"){ |file| file.readlines.each{ |line| puts line }}
end

try_load_students
interactive_menu
