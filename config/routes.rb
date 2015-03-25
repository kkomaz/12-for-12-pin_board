Rails.application.routes.draw do
  resources :characters, :only => :create
  devise_for :users
  resources :pins do
    resources :comments
    member do
      put "like", to: "pins#upvote"
    end
  end
 root "pins#index"
end
