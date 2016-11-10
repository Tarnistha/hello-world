class MarksMailer < ApplicationMailer
  def new_marks(candidate_exam_detail)
    @candidate = candidate_exam_detail.candidate
    @candidate_exam_detail = candidate_exam_detail
    mail(from: "from@example.com", to: @candidate.email, subject: 'Marks declared')
  end
end
