class SupporterEmployee < ApplicationRecord
  has_many :schedule_assignments, dependent: :destroy

  validates :name, presence: true
  validates :assigned_color, presence: true
end
