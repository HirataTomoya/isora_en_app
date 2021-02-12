Rails.application.routes.draw do
  get 'test/problem'
  get '/' => "home#loginform"
  get 'home/top' => 'home#top'
  get 'home/top' => "home#top"
  get 'home/login' => 'home#login'
  get 'home/logout' => 'home#logout'
  get 'home/leveltop/:id' => 'home#leveltop'

  get 'test/score/1' => 'test#score'
  get 'test/problem/1' => 'test#problem'
  get 'test/answer/1' => 'test#answer'
  post 'home/login' => 'home#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
