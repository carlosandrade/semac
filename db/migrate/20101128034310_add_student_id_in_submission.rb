class AddStudentIdInSubmission < ActiveRecord::Migration
  def self.up
   add_column :submissions, :student_id, :integer
  end

  def self.down
    remove_column :submissions, :student_id
  end
end
