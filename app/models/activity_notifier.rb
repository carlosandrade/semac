class ActivityNotifier < ActionMailer::Base
  def activity_notification(student, teacher, activity)
    
    recipients "<#{student.email}>"
    from "semac.rails@gmail.com"
    subject "New activity available"
    body :student => student, :teacher => teacher, :activity => activity
  end
end

