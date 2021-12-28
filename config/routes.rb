Rails.application.routes.draw do
  post 'portal', to: 'portal#start_exam'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
