Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  #この表記によりcontact_path(/contact)やcontact_url(ドメイン名/contact)
  get  '/signup',  to: 'users#new'
end