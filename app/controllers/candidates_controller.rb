class CandidatesController < ApplicationController
   before_action :authenticate_user!, except:[:index, :show]
  def index
    @candidates = Candidate.all.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @candidate = Candidate.find(params[:id])
    @candidate_exam_details = @candidate.candidate_exam_details 
  end
  
  def new
    @candidate = Candidate.new
  end
  
  def edit
    @candidate= Candidate.find(params[:id])
  end
  
  def create
    @candidate = Candidate.new(candidate_params)
    
    if @candidate.save
      redirect_to @candidate, notice: 'Candidate was successfully created.' 
    else
      render :new 
    end
  end
  
  def update
    @candidate= Candidate.find(params[:id])
    
    if @candidate.update(candidate_params)
      redirect_to @candidate, notice: 'Candidate was successfully updated.' 
    else
      render :edit
    end
  end
  
  def destroy
    @candidate= Candidate.find(params[:id])
    
    if @candidate.destroy
      redirect_to candidates_url, notice: 'Candidate was successfully destroyed.' 
    else
      redirect_to candidates_url, notice: 'Could not be deleted. Try again'
    end
  end
  
  private
  def candidate_params
    params.require(:candidate).permit(:name, :qualification, :college, :stream, :marks, :email)
  end
end
