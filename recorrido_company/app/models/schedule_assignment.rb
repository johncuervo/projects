class ScheduleAssignment < ApplicationRecord
  belongs_to :client
  belongs_to :supporter_employee
  belongs_to :client_schedule

  validates :time, presence: true
  validates :confirmed_time, inclusion: { in: [true, false] }
end
