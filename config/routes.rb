Rails.application.routes.draw do
  resources :leads do
    post :index, on: :collection
  end

  root to: "visitors#index"
  get '/thanks', :to => redirect('/pages/thanks')
end
