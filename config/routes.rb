Rails.application.routes.draw do
  get 'test/problem'
  get '/' => "home#loginform"
  get 'home/menu1' => 'home#menu1'
  get 'home/login' => 'home#login'
  get 'home/logout' => 'home#logout'
  get 'home/leveltop/:id' => 'home#leveltop'

  get 'test/problem/:level/:id' => 'test#problem'
  get 'test/answer/:level/:id' => 'test#answer'
  post 'home/login' => 'home#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
