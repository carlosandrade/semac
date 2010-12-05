class AddActivityIdInSubmission < ActiveRecord::Migration
  def self.up
   add_column :submissions, :activity_id, :integer
  end

  def self.down
    remove_column :submissions, :activity_id
  end
end
