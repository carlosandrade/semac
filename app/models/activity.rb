class Activity < ActiveRecord::Base

#Relationship
  belongs_to :group

#Title validations
  
  #Does not allow activity title to be empty
  validates_presence_of :title

#Specification validations
  
  #Does not allow specification registration to be empty
  validates_presence_of :specification

#Group validations
  
  #Does not allow activity group_id to be empty
  validates_presence_of :group_id
end
