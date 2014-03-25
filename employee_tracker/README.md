Employee tracker
=========
epicodus assignment

Let's build an app for a company to help track what its employees are working on. Here are the features to build:

1. Let users add and list employees.

2. Let users create divisions in the company and add employees to a division. In this company, an employee only belongs to one division (there is a one-to-many relationship between employees and divisions). Let users list out division.

3. Let users add and list projects, and assign projects to employees. An employee can have multiple projects and many employees can work on the same project.

4. Lets users choose a division or a project to see what employees are in it.

5. Creates the contributions class

The company wants to start tracking what each employee contributed to a project. Read the Rails guide on has_many :through and use it instead of has_and_belongs_to_many. Make sure that the company can provide a description of each employee's contribution to the project.

Let the company choose a division and list out all of the projects its employees have worked on. Do this with a single line of Active Record methods.
