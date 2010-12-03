class ActivityNotifier < ActionMailer::Base
  def activity_notification(student, teacher, activity)
    
    recipients "davidgorender@gmail.com"
    from "semac.rails@gmail.com"
    subject "New activity available"
    body :student => student, :teacher => teacher, :activity => activity
  end
end

#<#{student.email}>"
