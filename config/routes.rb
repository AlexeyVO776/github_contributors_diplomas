Rails.application.routes.draw do
  get 'diplomas/show'
  get 'contributors/index'
  get 'contributors/fetch'
  
  get 'contributors/:id/certificate', to: 'contributors#certificate', as: :certificate_contributor

  resources :contributors, only: [:show] do
    member do
      get 'download_certificate'
    end

    collection do
      get 'download_zip'
    end
  end

  get 'diplomas', to: 'diplomas#show', as: :diplomas

  root 'contributors#index'
end


