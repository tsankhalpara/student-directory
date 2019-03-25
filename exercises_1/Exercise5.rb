#put students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, sport: :swimming, country: :lithuania},
  {name: "Darth Vader", cohort: :november, sport: :football, country: :america},
  {name: "Nurse Ratched", cohort: :november, sport: :tennis, country: :america},
  {name: "Michael Corleone", cohort: :november, sport: :football, country: :italy},
  {name: "Alex DeLarge", cohort: :november, sport: :basketball, country: :england},
  {name: "The Wicked Witch of the West", cohort: :november, sport: :rugby, country: :america},
  {name: "Terminator", cohort: :november, sport: :rugby, country: :america},
  {name: "Freddy Krueger", cohort: :november, sport: :badminton, country: :america},
  {name: "The Joker", cohort: :november, sport: :tennis, country: :america},
  {name: "Joffrey Baratheon", cohort: :november, sport: :football, country: :westeros},
  {name: "Norman Bates", cohort: :november, sport: :swimming, country: :america}
]
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
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
