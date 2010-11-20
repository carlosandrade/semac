class ChangeTeacherNameAndEmailFromVarchar255ToVarchar100 < ActiveRecord::Migration
  def self.up
    change_column :teachers, :name, :string, :limit => 100
    change_column :teachers, :email, :string, :limit => 100
  end

  def self.down
    change_column :teachers, :name, :string
    change_column :teachers, :email, :string
  end
end
