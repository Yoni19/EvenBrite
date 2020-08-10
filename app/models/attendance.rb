class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :attendance_send

  def attendance_send
		AttendanceMailer.participation_email(self.user, self.event.organizer, self.event).deliver_now
	end

end
