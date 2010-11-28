class Attachment < ActiveRecord::Base
  belongs_to :submission

# Name validations
  #Does not allow attachment name to be empty
  validates_presence_of :name

  #Attachment name should not exceed 60 chars
  validates_length_of :name, :maximum=>60

# Path validations
  #Does not allow attachment path to be empty
  validates_presence_of :path

  #Attachment path should not exceed 100 chars
  validates_length_of :path, :maximum=>100

# Extension validations
  #Does not allow attachment extension to be empty
  validates_presence_of :extension

  #Attachment extension should not exceed 10 chars
  validates_length_of :extension, :maximum=>10

end
