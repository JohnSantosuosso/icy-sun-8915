require 'rails_helper'

RSpec.describe 'Employees Show', type: :feature do
  describe 'show' do
    it 'should show the employees name and department' do
      department_1 = Department.create(name: 'IT')
      department_2 = Department.create(name: 'HR')

      employee_1 = Employee.create(name: 'John', level: 3, department_id: department_1.id)
      employee_2 = Employee.create(name: 'Jane', level: 2, department_id: department_1.id)

      visit "/employees/#{employee_1.id}"

      within("#employee-#{employee_1.id}") do
        expect(page).to have_content('John')
        expect(page).to have_content('IT')
        expect(page).to have_no_content('Jane')
        expect(page).to have_no_content('HR')
      end

    end

    it 'should show the employees tickets sorted by oldest' do
      department_1 = Department.create(name: 'IT')


      employee_1 = Employee.create(name: 'John', level: 3, department_id: department_1.id)
      employee_2 = Employee.create(name: 'Jane', level: 2, department_id: department_1.id)

      ticket_1 = Ticket.create(subject: 'Broken Printer', age: 1)
      ticket_2 = Ticket.create(subject: 'Broken Laptop', age: 2)
      ticket_3 = Ticket.create(subject: 'Broken Keyboard', age: 3)
      ticket_4 = Ticket.create(subject: 'Broken Monitor', age: 4)

      employee_ticket_1 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_1.id)
      employee_ticket_2 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_2.id)
      employee_ticket_3 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_3.id)
      employee_ticket_4 = EmployeeTicket.create(employee_id: employee_2.id, ticket_id: ticket_4.id)

      visit "/employees/#{employee_1.id}"

      within("#employee-#{employee_1.id}") do
        expect(page).to have_content('Broken Printer')
        expect(page).to have_content('Broken Laptop')
        expect(page).to have_content('Broken Keyboard')
        expect(page).to have_no_content('Broken Monitor')
      end

    end
  end
end