Rails.application.routes.draw do
  # resource :setup, only: [:show, :create]

  namespace :my do
    # resource :account, only: [:show, :edit, :update]
  end

  namespace :manage do
    root to: "dashboard#show"

    resources :beneficiaries, only: [:index, :show, :new, :create, :edit, :update] do
      resources :needs, only: [:new, :create, :edit, :update]
    end

    resources :donors, only: [:index, :show]

    resources :campaigns, only: [:index, :show, :new, :create, :edit, :update] do
      # put :show
      # put :hide

      # resource :launch, only: [:show, :create]
      # resource :archive, only: [:show, :create]

      resources :updates, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :pools, only: [:index, :show] do
      resources :disbursements, only: [:new, :create]
    end
  end

  namespace :coordinators do
    # root to: "dashboard#show"

    # resources :pools, only: [:index, :show, :new, :create, :destroy]

    # resources :donations, only: [:index, :show, :new, :create]
  end

  namespace :admin do
    # root to: "dashboard#show"

    # resources :accounts, only: [:index, :show, :new, :create] do
    #   put :activate, on: :member
    #   put :deactivate, on: :member

    #   resource :manager, only: [:show, :new, :create, :edit, :update]
    #   resource :coordinator, only: [:show, :new, :create, :edit, :update]
    # end
  end
end
