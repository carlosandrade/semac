class Activity < ActiveRecord::Base

#Title validations
  
  #Does not allow student registration to be empty
  validates_presence_of :title

#Specification validations
  
  #Does not allow specification registration to be empyt
  validates_presence_of :specification
end
