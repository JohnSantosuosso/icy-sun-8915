class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  validates :name, presence: true
  validates :level, presence: true
  

  def sort_tickets_desc
    tickets.order(age: :desc)
  end

  def find_oldest_ticket
    tickets.order(age: :desc).pluck(:subject).first
  end
end