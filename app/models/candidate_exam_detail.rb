class CandidateExamDetail < ApplicationRecord
  belongs_to :exam
  belongs_to :candidate
  
  validates :candidate, :exam, :marks_obtained, presence: true
  validates :marks_obtained, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0 }
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
