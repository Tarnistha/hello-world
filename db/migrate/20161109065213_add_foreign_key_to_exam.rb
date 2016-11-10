class AddForeignKeyToExam < ActiveRecord::Migration[5.0]
  def change
    add_reference :exams, :candidate, foreign_key: true
  end
end
