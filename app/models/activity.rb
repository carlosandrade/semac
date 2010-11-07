class Activity < ActiveRecord::Base

#Title validations
  
  #Does not allow student registration to be empty
  validates_presence_of :title
end
