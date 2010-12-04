class Teacher < ActiveRecord::Base
  has_many :groups

#Name validations

  #Does not allow teacher name to be empty
  validates_presence_of :name

  #Teacher name must be unique
  validates_uniqueness_of :name

  #Teacher name should not exceed 100 chars
  validates_length_of :name, :maximum=>100

#Email validations

  #Does not allow teacher email to be empty
  validates_presence_of :email

  #Teacher email must be unique
  validates_uniqueness_of :email

  #Teacher email should not exceed 100 chars
  validates_length_of :email, :maximum=>100

#Registration validations
  
  #Does not allow teacher registration to be empty
  validates_presence_of :registration

  #Verify if registration is a number
  validates_numericality_of :registration

  #Registration must be unique
  validates_uniqueness_of :registration
end
