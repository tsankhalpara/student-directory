require 'csv'

@loaded_filename = ""
@default_filename = "students.csv"

@students = []

def add_students(name)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else puts "Now we have #{@students.count} students"
    end
    name = STDIN.gets.chomp
  end
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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      puts "Please enter the name of the file"
      puts "or leave empty to load students.csv"
      load_filename = gets.chomp
      load_filename.empty? ? load_students : load_students(load_filename)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  puts "Please enter the filename"
  filename = gets.chomp
  CSV.open(filename, "wb") do |csv|
  @students.each do |student|
    csv << [student[:name], student[:cohort]]
  end
  end
  puts "**file saved**"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") do |file|
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name)
  end
  end
  puts "**file loaded**"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    puts "Loaded the default file: students.csv"
    load_students
  elsif File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
