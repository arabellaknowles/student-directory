def input_students
  students = []

  while true
    puts "Please enter student name"
    name = gets.chomp
    break if name.empty?
    hobies = []
    puts "Enter student's hobies"
    while true
      hobie = gets.chomp
      break if hobie.empty?
      hobies << hobie
    end
    puts "Enter student's date of birth"
    birthday = gets.chomp

    students << {name: name, hobies: hobies, birthday: birthday, cohort: :november}
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
    puts "#{student[:name]}, favourite hobies: #{student[:hobies]}, born #{student[:birthday]}, (#{student[:cohort]} cohort)".center(100)
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end
students = input_students
print_header
print(students)
print_footer(students)
