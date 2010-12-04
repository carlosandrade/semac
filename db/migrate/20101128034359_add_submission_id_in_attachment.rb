class AddSubmissionIdInAttachment < ActiveRecord::Migration
  def self.up
   add_column :attachments, :submission_id, :integer
  end

  def self.down
    remove_column :attachments, :submission_id
  end
end
