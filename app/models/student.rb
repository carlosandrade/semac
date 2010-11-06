class Student < ActiveRecord::Base

#Name validations

  #Does not allow student names to be empyt
  validates_presence_of :name

  #Student names must be unique
  validates_uniqueness_of :name

  #Student names should not exceed 100 chars
  validates_length_of :name, :maximum=>100

#Email validations

  #Does not allow student email to be empyt
  validates_presence_of :email

  #Student emails must be unique
  validates_uniqueness_of :email

  #Student emails should not exceed 100 chars
  validates_length_of :email, :maximum=>100

#Registration validations
  
  #Does not allow student registration to be empyt
  validates_presence_of :registration



end
