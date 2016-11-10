Rails.application.routes.draw do
 
  get 'static_pages/candidate'
  get 'static_pages/exam'
  get 'static/pages'
  get 'static/candidate'
  get 'static/exam'
  devise_for :users
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#candidate'
  get 'static_pages/candidate'
  get 'static_pages/exam'
  
  resources :candidates do 
    resources :candidate_exam_details do
      get :send_marks_mail, on: :member
    end
  end
  resources :exams
 
end
