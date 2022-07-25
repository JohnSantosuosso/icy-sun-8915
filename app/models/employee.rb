class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def sort_tickets_asc
    tickets.order(:age)
  end

  def find_oldest_ticket
    tickets.order(:age).first
  end
end