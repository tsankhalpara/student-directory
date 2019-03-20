#put students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#prints the list of students
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
#puts the total number of students
puts "Overall, we have #{student.count} great students"
