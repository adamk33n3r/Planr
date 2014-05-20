class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :level, :due, :name
  
  def due_dates
    due.to_date.to_s
  end
  
  def due_dates=(due_date)
    self.due = Time.parse(due_str)
  rescue ArgumentError
    @due_invalid = true
  end
  
  def validate
    errors.add(:due, "is invalid") if @due_invalid
  end
  
  def to_s
    self.name
  end
end
