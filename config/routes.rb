Rails.application.routes.draw do
  resources :leads

  root to: "visitors#index"
  get '/thanks', :to => redirect('/pages/thanks')
end
