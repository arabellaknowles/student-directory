def input_students
  students = []

  while true
    puts "Please enter student name"
    name = gets.chomp
    break if name.empty?
    puts "Which cohort are they in?"
    cohort = gets.chomp.to_sym
    cohort = :novemebr if cohort.empty?

    students << {name: name, cohort: cohort}

    puts "Now we have #{students.count} students"
  end
  students
end
def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def print(students)
  students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(100)
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end
students = input_students
print_header
print(students)
print_footer(students)
