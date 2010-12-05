class Attachment < ActiveRecord::Base
  belongs_to :submission

  file_column :path

# Name validations
  #Does not allow attachment name to be empty
  validates_presence_of :name

  #Attachment name should not exceed 60 chars
  validates_length_of :name, :maximum=>60

# Path validations
  #Does not allow attachment path to be empty
  validates_presence_of :path

# Extension validations
  #Does not allow attachment extension to be empty
  validates_presence_of :extension

  #Attachment extension should not exceed 10 chars
  validates_length_of :extension, :maximum=>10

end
