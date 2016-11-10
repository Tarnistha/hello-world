class ExamsController < ApplicationController
  def index
    @exams = Exam.all.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @exam = Exam.find(params[:id])
    @candidate_exam_details = @exam.candidate_exam_details
  end
  
  def new
    @exam = Exam.new
  end
  
  def edit
    @exam = Exam.find(params[:id])
  end
  
  def create
    @exam = Exam.new(exam_params)
    
    if @exam.save
      redirect_to exam_path(@exam), notice: 'Exam was successfully created.' 
    else
      render :new 
    end
  end
  
  def update
    @exam = Exam.find(params[:id])
    
    if @exam.update(exam_params)
      redirect_to @exam, notice: 'Exam was successfully updated.' 
    else
      render :edit
    end
  end
  
  def destroy
    @exam = Exam.find(params[:id])
    
    if @exam.destroy
      redirect_to exams_path, notice: 'Succesfully destroyed'
    else
      redirect_to exams_path, notice: 'Could not be deleted. Try again'
    end
  end
  
  private
  
  def exam_params
    params.require(:exam).permit(:name, :total_marks, :date_of_exam)
  end
end
