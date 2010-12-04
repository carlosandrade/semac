class Student < ActiveRecord::Base

  has_and_belongs_to_many :groups, :join_table => "students_groups"
  has_many :submissions




#Name validations

  #Does not allow student names to be empty
  validates_presence_of :name

  #Student names must be unique
  validates_uniqueness_of :name

  #Student names should not exceed 100 chars
  validates_length_of :name, :maximum=>100

#Email validations

  #Does not allow student email to be empty
  validates_presence_of :email

  #Student emails must be unique
  validates_uniqueness_of :email

  #Student emails should not exceed 100 chars
  validates_length_of :email, :maximum=>100

#Registration validations
  
  #Does not allow student registration to be empty
  validates_presence_of :registration

  #Verify if registration is a number
  validates_numericality_of :registration

  #Registration must be unique
  validates_uniqueness_of :registration
  
end
