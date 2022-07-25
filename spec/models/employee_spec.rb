require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many :employee_tickets }
  end

  describe 'instance methods' do
    it 'should sort tickets by oldest' do
      department_1 = Department.create(name: 'IT')
      employee_1 = Employee.create(name: 'John', level: 3, department_id: department_1.id)
      ticket_1 = Ticket.create(subject: 'Broken Printer', age: 1)
      ticket_2 = Ticket.create(subject: 'Broken Laptop', age: 2)
      ticket_3 = Ticket.create(subject: 'Broken Keyboard', age: 3)
      ticket_4 = Ticket.create(subject: 'Broken Monitor', age: 4)
      employee_ticket_1 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_1.id)
      employee_ticket_2 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_2.id)
      employee_ticket_3 = EmployeeTicket.create(employee_id: employee_1.id, ticket_id: ticket_3.id)
      
      expect(employee_1.sort_tickets_asc).to eq([ticket_1, ticket_2, ticket_3])
    end
  end

end