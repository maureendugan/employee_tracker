require 'active_record'
require './lib/employee'
require './lib/division'
require './lib/project'
require './lib/employee_project'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  choice  = nil
  until choice == 'X'
    puts "Press 'N' to add an employee, division or project"
    puts "Press 'L' to list your employees, divisions and projects"
    puts "Press 'A' to assign employees to divisons and/or projects"
    puts "Press 'X' to exit"
    choice = gets.chomp.upcase

    case choice
    when "A"
      edit_menu
    when "L"
      list_menu
    when "N"
      add_menu
    when "X"
      puts "Bye!"
    else
      puts "Invalid input!"
    end
  end
end

def add_menu
  system "clear"
  puts "-------ADD-------"
  puts "Press 'E' for employee"
  puts "Press 'D' for division"
  puts "Press 'P' for projects"
  puts "Press 'M' to return to main menu"
  choice = gets.chomp.upcase

  case choice
  when "E"
    add_employee
  when "D"
    add_division
  when "P"
    add_project
  when "M"

  else
    puts "Invalid Input"
    add_menu
  end
end

def list_menu
  system "clear"
  puts "------LIST-------"
  puts "Press 'E' for employee"
  puts "Press 'D' for division"
  puts "Press 'P' for projects"
  puts "Press 'M' to return to main menu"
  choice = gets.chomp.upcase

  case choice
  when "E"
    list_employees
  when "D"
    list_divisions
  when "P"
    list_projects
  when "M"

  else
    puts "Not a valid entry"
    list_menu
  end
end

def edit_menu
  system "clear"
  puts "----ASSIGN-----"
  puts "Press 'D' to add an employee to a division"
  puts "Press 'P' to add an employee to a project"
  puts "Press 'M' to return to main menu"
  choice = gets.chomp.upcase

  case choice
  when "D"
    add_employee_to_division
  when "P"
    add_employee_to_project
  when "M"

  else
    puts "Not a valid entry"
    edit_menu
  end

end

def add_employee
  puts "Enter the name of the Employee:"
  new_name = gets.chomp
  new_employee = Employee.create({:name => new_name})
  puts "'#{new_employee.name}' added to the employee database"
end

def list_employees
  puts
  puts "Your Employees"
  Employee.all.reorder('name').each do |employee|
    if employee.division
      puts "#{employee.name} #{employee.division.name}"
    else
      puts "#{employee.name}"
    end
  end
end

def add_employee_to_division
  list_divisions
  puts "Pick a divison name to add your employee to:"
  division_name = gets.chomp.capitalize
  division = Division.find_by(:name => division_name)
  list_employees
  puts "Who are you adding to #{division.name}?"
  employee_name = gets.chomp
  employee = Employee.find_by(:name => employee_name)
  division.employees << employee
end

def add_division
  puts "Enter the new division name:"
  division_name = gets.chomp.capitalize
  new_division = Division.create(:name => division_name)
  puts "#{new_division.name} added to the company"
end

def list_divisions
  puts "All of your divisions"
  Division.all.reorder('name').each_with_index do |division, index|
    puts "#{index + 1}) #{division.name}"
  end
end

def add_project
  puts "What is the name of your project?"
  project_name = gets.chomp
  new_project = Project.create(:name => project_name)
  puts "#{new_project.name} added"
end

def list_projects
  puts
  puts "All of your projects"
  Project.all.reorder('name').each do |project|
    puts "#{project.name}"
  end
end

def add_employee_to_project
  list_employees
  puts "Enter an employee name:"
  employee_name = gets.chomp
  list_projects
  puts "Enter a project for #{employee_name}"
  project_name = gets.chomp
  employee = Employee.find_by(:name => employee_name)
  project = Project.find_by(:name => project_name)

  employee.projects << project
  puts "#{employee.name} is now working on #{project.name}"
end

system "clear"
main_menu

