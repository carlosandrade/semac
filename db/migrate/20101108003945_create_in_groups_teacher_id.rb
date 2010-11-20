class CreateInGroupsTeacherId < ActiveRecord::Migration
  def self.up
    add_column :groups, :teacher_id, :integer
  end

  def self.down
    remove_column :groups, :teacher_id
  end
end
