def input_students
  students = []
  total_cohorts = [:january, :february, :march, :april, :may, :june, :july, :august,
  :september, :october, :november, :december]
  current_cohorts = Hash.new

  while true
    puts "Please enter student name"
    puts "To finish, just hit return twice"
    name = gets.gsub("\n", "")
    break if name.empty?

    puts "Which cohort are they in?"
    while true
      cohort = gets.gsub("\n", "").to_sym
      cohort = :november if cohort.empty?
      if total_cohorts.include?(cohort)
        cohort
        break
      else
        puts "Error, please re-enter cohort"
      end
    end

    current_cohorts.key?(cohort) ? current_cohorts[cohort] << name : current_cohorts[cohort] = [name]
    students << {name: name, cohort: cohort}

    students.count == 1 ? (puts "Now we have #{students.count} student") : (puts "Now we have #{students.count} students")
  end
  current_cohorts
end
def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def print(current_cohorts)
  current_cohorts.map{ |key, value| puts "#{key}: #{value}".center(100) }
end
def print_footer(current_cohorts)
  puts "Overall, we have #{current_cohorts.count} great cohorts".center(100)
end
current_cohorts = input_students
print_header
print(current_cohorts)
print_footer(current_cohorts)
