require 'rails_helper'

RSpec.describe 'Departments', type: :feature do
  describe 'index' do
    it 'should show all departments and their employees' do
      department_1 = Department.create(name: 'IT', floor: 1)
      department_2 = Department.create(name: 'Accounting', floor: 2)

      employee_1 = Employee.create(name: 'John', level: 3, department_id: department_1.id)
      employee_2 = Employee.create(name: 'Jane', level: 2, department_id: department_1.id)
      employee_3 = Employee.create(name: 'Bob', level: 1, department_id: department_2.id)
      employee_4 = Employee.create(name: 'Mary', level: 1, department_id: department_2.id)

      visit '/departments'

      within("#department-#{department_1.id}") do
      expect(page).to have_content('IT')
      expect(page).to have_no_content('Accounting')
      expect(page).to have_content('John')
      expect(page).to have_content('Jane')
      expect(page).to have_no_content('Bob')
      expect(page).to have_no_content('Mary')
      end

      within("#department-#{department_2.id}") do
      expect(page).to have_content('Accounting')
      expect(page).to have_content('Bob')
      expect(page).to have_content('Mary')
      end

    end
  end
end