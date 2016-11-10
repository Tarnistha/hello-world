class Candidate < ApplicationRecord
  has_many :exams, through: :candidate_exam_details, dependent: :destroy
  has_many :candidate_exam_details
  
  validates :name, :college, presence: true
  validates :name, uniqueness: true
end
