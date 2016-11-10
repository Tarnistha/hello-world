class AddAttachmentImageToCandidateExamDetails < ActiveRecord::Migration
  def self.up
    change_table :candidate_exam_details do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :candidate_exam_details, :image
  end
end
