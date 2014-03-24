require 'active_record'
require './lib/employee'

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
        add_division
      when "X"
        puts "Bye!"
      else
        puts "Invalid input!"
    end
  end
end

def add_employee
  puts "Enter the name of the Employee;"
  new_name = gets.chomp
  new_employee = Employee.create({:name => new_name})
  puts "'#{new_name}' added to the employee database"
end

def list_employees
  puts "Your Loyal Employees"
  Employee.all.each_with_index do |employee, index|
    puts "#{index + 1}) #{employee.name}"
  end
end

system "clear"
main_menu

