class CandidateExamDetailsController < ApplicationController
  before_action :candidate_details, only:[:index, :show, :new, :create]
  def index
    @candidate_exam_details = @candidate.candidate_exam_details
  end
  
  def show
    @candidate_exam_detail = CandidateExamDetail.find(params[:id])
  end
  
  def new
    @candidate_exam_detail = @candidate.candidate_exam_details.build
  end
  
  def edit
    @candidate_exam_detail = CandidateExamDetail.find(params[:id])
  end
  
  def create
    @candidate_exam_detail = @candidate.candidate_exam_details.build(candidate_exam_detail_params)
    
    if @candidate_exam_detail.save
      redirect_to candidate_candidate_exam_details_path(@candidate,@candidate_exam_details), notice: 'Candidate Exam Details was 		 successfully created.'  
    else
      render :new 
    end
  end

  def update
    @candidate_exam_detail = CandidateExamDetail.find(params[:id])
    
    if @candidate_exam_detail.update(candidate_exam_detail_params)
      redirect_to @candidate_exam_detail, notice: 'Exam Detail was successfully updated.' 
    else
      render :edit
    end
  end
  
  def destroy
    @candidate_exam_detail = CandidateExamDetail.find(params[:id])
    
    if @candidate_exam_detail.destroy
      redirect_to candidate_candidate_exam_details_path, notice: 'Successfully destroyed'
    else
      redirect_to candidate_candidate_exam_details_path, notice: 'Could not be deleted. Try again' 
    end
  end
  
  def send_marks_mail
    @candidate_exam_detail = CandidateExamDetail.find(params[:id])
    MarksMailer.new_marks(@candidate_exam_detail).deliver
    flash[:notice] = "mail has been sent."
    redirect_to candidate_candidate_exam_details_path
  end
  
  private       
  def candidate_details
    @candidate = Candidate.find(params[:candidate_id])
  end
  
  def candidate_exam_detail_params
    params.require(:candidate_exam_detail).permit( :marks_obtained, :exam_id, :image, :comment)
  end
end
