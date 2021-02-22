Rails.application.routes.draw do
  get 'test/problem'
  get '/' => "home#loginform"
  get 'home/menu1' => 'home#menu1'
  get 'home/menu2' => 'home#menu2'
  get 'home/menu3' => 'home#menu3'
  get 'home/menu4' => 'home#menu4'
  get 'home/login' => 'home#login'
  get 'home/logout' => 'home#logout'
  get 'home/leveltop/:level' => 'home#leveltop'

  get 'test/testtop/:level' => 'test#testtop'
  get  'test/reviewtop/:level' => 'test#reviewtop'

  # 単語抽出に関するルーティング
  get 'test/extract/:level' => 'test#extractword'
  get 'test/extract/review/:level' => 'test#reviewword'
  get 'test/extract/practice/:level/:practice_id' => 'test#practiceword'

  get 'test/problem/:level/:word_id' => 'test#problem'
  get 'test/answer/:level/:word_id' => 'test#answer'
  get 'test/reviewproblem/:level/:word_id' => 'test#reviewproblem'
  get 'test/reviewanswer/:level/:word_id' => 'test#reviewanswer'
  get 'test/practiceproblem/:level/:practice_id/:word_id' => 'test#practiceproblem'
  get 'test/practiceanswer/:level/:practice_id/:word_id' => 'test#practiceanswer'

  get 'test/practice/:level' => 'test#practice'
  get 'test/testtop/:level/:practice_id' => 'test#practicetop'
  get 'test/afterpractice/:level' => 'test#afterpractice'

  # 間違った単語一覧に関するルーティング
  get 'test/incorrectlist/:level' => 'test#incorrectlist'

  # 正誤に関するルーティング
  get 'test/result/correct/:level/:word_id' => 'test#correct'
  get 'test/result/incorrect/:level/:word_id' => 'test#incorrect'
  get 'test/result/review/correct/:level/:word_id' => 'test#reviewcorrect'
  get 'test/result/review/incorrect/:level/:word_id' => 'test#reviewincorrect'
  get 'test/result/practice/correct/:level/:practice_id/:word_id' => 'test#practicecorrect'
  get 'test/result/practice/incorrect/:level/:practice_id/:word_id' => 'test#practiceincorrect'

  get 'test/score/:level' => 'test#score'
  get 'test/reviewfinish/:level' => 'test#reviewfinish'

  post 'home/login' => 'home#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
