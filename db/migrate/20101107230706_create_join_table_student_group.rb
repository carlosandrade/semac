class CreateJoinTableStudentGroup < ActiveRecord::Migration
  def self.up
    create_table :students_groups, :id => false do |t|
      t.integer :student_id
      t.integer :group_id
    end
  end

  def self.down
    drop_table :students_groups
  end
end
