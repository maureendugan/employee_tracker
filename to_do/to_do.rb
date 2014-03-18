require './lib/task'
require './lib/list'
require 'pg'
DB = PG.connect(:dbname => 'to_do')

def start_menu
  puts "Here's the database!!"

  puts "Press a, create a new list"

  puts "Press b, to edit an exiting list"

  puts "press x, to exit"


  user_input = gets.chomp.downcase

  if user_input == 'a'
      new_list
  elsif user_input == 'b'
      task_menu
  elsif user_input == 'x'
    puts "Goodbye"
  else
    start_menu
  end
end


def new_list
puts "Please enter the name of your new list"
user_input = gets.chomp
current_list = List.new(user_input)
current_list.save
@current_list = current_list
task_menu
end


def task_menu
puts "Enter 'n' to enter a new task"
puts "Enter 'v' to view existing tasks within a certain list"
puts "Enter 'x' to return to the main menu"
user_input = gets.chomp.downcase
  if user_input == 'n'
    new_task
  elsif user_input == 'v'
    show_tasks
  elsif user_input == 'x'
    puts "Back to the main menu"
    start_menu
  else
    puts "Invalid input"
    start_menu
  end
end

def new_task
  puts "Please select a list to add a task to"
  List.all
  puts "\n"
  puts "List Name:"
  user_input = gets.chomp

   list_id = DB.exec ("SELECT id FROM lists WHERE name = '#{user_input}';")
  list_id.each do |result|
    @answer = result['id'].to_i
  end

  puts "Please enter the name of your new task"
  user_input = gets.chomp

  DB.exec ("INSERT INTO tasks (name,list_id) VALUES ('#{user_input}', '#{@answer}') ;")

  puts "Your task has been added!"
  task_menu
end

def show_tasks
  puts "Please select a list by name to edit it"
  List.all
  puts "\n"
  puts "List Name:"
  user_input = gets.chomp

  list_id = DB.exec ("SELECT id FROM lists WHERE name = '#{user_input}';")
  list_id.each do |result|
    @answer = result['id'].to_i
  end

  puts "\n"
  puts "Task Names:"
  task_id = DB.exec ("SELECT * FROM tasks WHERE list_id = '#{@answer}';")
  task_id.each do |result|
    @answer = result['name']
    puts @answer
  end
  puts "\n"
  puts "Hit 'e' if you would like to edit a task, or 'd' if you would like to delete one"
  puts "Press 'x' to go back"
  user_input = gets.chomp
  if user_input == 'd'
    delete_task
  elsif user_input == 'e'
    edit_task
  elsif user_input == 'x'
    task_menu
  else
    puts "Invalid input, try again"
    show_tasks
  end
end

def delete_task
  puts "Please enter the name of the task you would like to delete"
  user_input = gets.chomp
  DB.exec ("Delete FROM tasks WHERE name = '#{user_input}';")
  puts "#{user_input} has been deleted."
  task_menu
end

start_menu
