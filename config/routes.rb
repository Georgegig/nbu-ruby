Rails.application.routes.draw do
 resources :books
 root :to => redirect('/books')
 
 resources :books do
  get 'show_same', :on => :member
 end
end
