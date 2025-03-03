class Task < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
