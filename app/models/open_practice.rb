class OpenPractice < ActiveRecord::Base
  DAYS = %w(monday tuesday wednesday thursday friday saturday sunday)

  scope :viewable, -> { where(approved: true, deleted: false) }

  def viewable?
    approved && !deleted
  end

  def days
    DAYS.select {|day| send(day)}
  end
end
