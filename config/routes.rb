Exec::Application.routes.draw do
  resources :tipovendas
  resources :formapagamentos

  resources :groups
  resources :rules
  resources :atividades

  #Antes de verificar os path padroes vejo este caminho especifico
  get 'vendaplanos/show_import_csv' , to: 'vendaplanos#show_import_csv'
  resources :vendaplanos do
    collection { post :import_csv }
  end

  get 'valor_plano', to: 'tabelaplanos#valor_plano'
  resources :tabelaplanos do
  end

  #Recursos para impressao dos treinos.
  get 'printIndex', to: 'treinos#printIndex'
  get 'printTreino', to: 'treinos#print'
  get 'confirmaTreino', to: 'treinos#confirmaTreino'
  resources :treinos do
  end

  resources :alunos do
    resources :treinos
    resources :diasemanas
  end

  resources :musculos do
    resources :atividades
  end

  #root :to => "home#index"
  #<% if can? :read, Atividade %>
  root :to => 'index#routeStartPage'

  #necessario para direcionar as ações padroes do devise.
  devise_for :users, :controllers => {:registrations => "registrations" }

  #Alterando as propriedades para registro de 1 usuario pelo adm.

  devise_scope :user do
    get   'users'     , to: 'admusers#index', as: 'users' #Chama o indice
    post  'users_save', to: 'adminserts#create'  #Botao da gravacao da criacao
    get   'users/new' , to: 'adminserts#new' #clicado no novo

    get   'user/:id'  , to: 'admusers#change', as: 'user' #Carrega o item para edicao

    #Atualizacao
    patch  'users_update/', to: 'admusers#update'  #Botao da Atualizacao.

    #Atualizacao senha
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end


  #resources :admusers
  #get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
