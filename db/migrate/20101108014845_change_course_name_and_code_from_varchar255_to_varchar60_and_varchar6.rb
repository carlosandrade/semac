class ChangeCourseNameAndCodeFromVarchar255ToVarchar60AndVarchar6 < ActiveRecord::Migration
  def self.up
    change_column :courses, :name, :string, :limit => 60
    change_column :courses, :code, :string, :limit => 6
  end

  def self.down
    change_column :courses, :name, :string
    change_column :courses, :code, :string
  end
end
