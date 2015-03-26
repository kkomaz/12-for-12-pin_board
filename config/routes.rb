Rails.application.routes.draw do
  resources :characters, :only => :create
  resources :contact_forms, :only => [:new, :create]
  devise_for :users
  resources :pins do
    resources :comments
    member do
      put "like", to: "pins#upvote"
      put "dislike", to: "pins#downvote"
    end
  end
 root "pins#index"
end
