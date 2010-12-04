class ChangeStudentNameAndEmailFromVarchar255ToVarchar100 < ActiveRecord::Migration
  def self.up
    change_column :students, :name, :string, :limit => 100
    change_column :students, :email, :string, :limit => 100
  end

  def self.down
    change_column :students, :name, :string
    change_column :students, :email, :string
  end
end
