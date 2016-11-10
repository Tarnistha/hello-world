class AddNullToCandidateId < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:candidate_exam_details, :candidate_id, false)
    change_column_null(:candidate_exam_details, :exam_id, false)
  end
end
