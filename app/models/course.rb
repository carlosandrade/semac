class Course < ActiveRecord::Base

# Name validations
  #Does not allow course name to be empty
  validates_presence_of :name

  #Course name must be unique
  validates_uniqueness_of :name

  #Course name should not exceed 60 chars
  validates_length_of :name, :maximum=>60

# Code validations
  #Does not allow course code to be empty
  validates_presence_of :code

  #Course code must be unique
  validates_uniqueness_of :code

  #Course code should not exceed 6 chars
  validates_length_of :code, :maximum=>6
end
