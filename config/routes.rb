Rails.application.routes.draw do
  # root to: "landing#show"

  namespace :my do
    root to: "dashboard#show"

    # resource :account, only: [:show, :edit, :update]
  end

  namespace :manage do
    root to: "dashboard#show"

    resource :profile, only: [:show, :new, :create, :edit, :update]

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

  namespace :coordinate do
    root to: "dashboard#show"

    resource :profile, only: [:show, :new, :create, :edit, :update]

    resource :pool, only: [:show, :new, :create, :destroy]

    resources :donations, only: [:index, :show, :new, :create]
  end

  namespace :admin do
    root to: "dashboard#show"

    resources :accounts, only: [:index, :show] do
      # put :activate, on: :member
      # put :deactivate, on: :member
    end

    # TODO: improve onboarding experience for managers
    # resources :managers, only: [:index, :new, :create, :destroy]

    # resources :coordinators, only: [:index] do
    #   put :approve, on: :member
    #   put :deny, on: :member
    # end
  end
end
