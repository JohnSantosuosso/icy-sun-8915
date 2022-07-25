# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


      department_1 = Department.create(name: 'IT')


      employee_1 = Employee.create(name: 'John', level: 3, department_id: department_1.id)

      ticket_1 = Ticket.create(subject: 'Broken Printer', age: 1)
      ticket_2 = Ticket.create(subject: 'Broken Laptop', age: 2)
      ticket_3 = Ticket.create(subject: 'Broken Keyboard', age: 3)
      ticket_4 = Ticket.create(subject: 'Broken Monitor', age: 4)

      employee_ticket_1 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_1.id)
      employee_ticket_2 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_2.id)
      employee_ticket_3 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_3.id)
