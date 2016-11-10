class CreateCandidateExamDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :candidate_exam_details do |t|
      t.integer :exam_id
      t.integer :candidate_id
      t.integer :marks_obtained

      t.timestamps
    end
  end
end
