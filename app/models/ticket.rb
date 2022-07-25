class Ticket < ApplicationRecord
  validates :subject, presence: true
  validates :age, presence: true
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets
end