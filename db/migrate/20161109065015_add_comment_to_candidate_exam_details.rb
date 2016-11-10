class AddCommentToCandidateExamDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :candidate_exam_details, :comment, :string
  end
end
