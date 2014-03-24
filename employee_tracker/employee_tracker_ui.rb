require 'active_record'
require './lib/employee'
require './lib/division'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  choice  = nil
  until choice == 'X'
    puts "Press 'A' to add an employee 'L' to list your employees 'D' to add an employee to a division"
    puts "Press 'X' to exit"
    choice = gets.chomp.upcase

    case choice
    when "A"
      add_employee
    when "L"
      list_employees
    when "D"
      add_employee_to_division
    when "X"
      puts "Bye!"
    else
      puts "Invalid input!"
    end
  end
end

def add_employee
  puts "Enter the name of the Employee:"
  new_name = gets.chomp
  new_employee = Employee.create({:name => new_name})
  puts "'#{new_employee.name}' added to the employee database"
end

def list_employees
  puts "Your Loyal Employees"
  Employee.all.reorder('name').each do |employee|
    if employee.division
      puts "#{employee.name} #{employee.division.name}"
    else
      puts "#{employee.name}"
    end
  end
end

def add_employee_to_division
  if Division.all.length > 0
    list_division
  else
    add_division
    list_division
  end
  puts "Pick a divison name to add your employee to:"
  division_name = gets.chomp
  employees_division = Division.find_by(:name => division_name)
  list_employees
  puts "Who are you adding to #{employees_division.name}?"
  employee_name = gets.chomp
  employee = Employee.find_by(:name => employee_name)
  employee.update(:division_id => employees_division.id)
end

def add_division
  puts "Enter the new division name:"
  division_name = gets.chomp
  new_division = Division.create(:name => division_name)
  puts "#{new_division.name} added to the company"
end

def list_division
  puts "All of your divisions;"
  Division.all.each_with_index do |division, index|
    puts "#{index + 1}) #{division.name}"
  end
end

system "clear"
main_menu

