class Exam < ApplicationRecord
  has_many :candidates, through: :candidate_exam_details
  has_many :candidate_exam_details
  
  validates :total_marks, :name, presence: true
  validates :name, uniqueness: true
  validates :total_marks, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0 }
end
