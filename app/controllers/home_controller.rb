class HomeController < ApplicationController
  def loginform
  end

  def login
    @user = User.find_by(password: params[:password])
    puts params[:password]
    puts @user
    if @user
      session[:user_id] = @user.user_id
      redirect_to("/home/menu1")
    else
      redirect_to("/")
      flash[:notice] = "パスワードが間違っています"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def menu1
    @score_stage1 = Score.find_by(level_id: 1, user_id: @current_user.user_id)
    @score_stage2 = Score.find_by(level_id: 2, user_id: @current_user.user_id)
    @score_stage3 = Score.find_by(level_id: 3, user_id: @current_user.user_id)
    @score_stage4 = Score.find_by(level_id: 4, user_id: @current_user.user_id)
    @score_stage5 = Score.find_by(level_id: 5, user_id: @current_user.user_id)
    @score_stage6 = Score.find_by(level_id: 6, user_id: @current_user.user_id)
    @score_stage7 = Score.find_by(level_id: 7, user_id: @current_user.user_id)
    @score_stage8 = Score.find_by(level_id: 8, user_id: @current_user.user_id)
    @score_stage9 = Score.find_by(level_id: 9, user_id: @current_user.user_id)
    @score_stage10 = Score.find_by(level_id: 10, user_id: @current_user.user_id)

  end

  def menu2
    @score_stage11 = Score.find_by(level_id: 11, user_id: @current_user.user_id)
    @score_stage12 = Score.find_by(level_id: 12, user_id: @current_user.user_id)
    @score_stage13 = Score.find_by(level_id: 13, user_id: @current_user.user_id)
    @score_stage14 = Score.find_by(level_id: 14, user_id: @current_user.user_id)
    @score_stage15 = Score.find_by(level_id: 15, user_id: @current_user.user_id)
    @score_stage16 = Score.find_by(level_id: 16, user_id: @current_user.user_id)
    @score_stage17 = Score.find_by(level_id: 17, user_id: @current_user.user_id)
    @score_stage18 = Score.find_by(level_id: 18, user_id: @current_user.user_id)
    @score_stage19 = Score.find_by(level_id: 19, user_id: @current_user.user_id)
    @score_stage20 = Score.find_by(level_id: 20, user_id: @current_user.user_id)

  end

  def menu3
    @score_stage21 = Score.find_by(level_id: 21, user_id: @current_user.user_id)
    @score_stage22 = Score.find_by(level_id: 22, user_id: @current_user.user_id)
    @score_stage23 = Score.find_by(level_id: 23, user_id: @current_user.user_id)
    @score_stage24 = Score.find_by(level_id: 24, user_id: @current_user.user_id)
    @score_stage25 = Score.find_by(level_id: 25, user_id: @current_user.user_id)
    @score_stage26 = Score.find_by(level_id: 26, user_id: @current_user.user_id)
    @score_stage27 = Score.find_by(level_id: 27, user_id: @current_user.user_id)
    @score_stage28 = Score.find_by(level_id: 28, user_id: @current_user.user_id)
    @score_stage29 = Score.find_by(level_id: 29, user_id: @current_user.user_id)
    @score_stage30 = Score.find_by(level_id: 30, user_id: @current_user.user_id)

  end

  def menu4
    @score_stage31 = Score.find_by(level_id: 31, user_id: @current_user.user_id)
    @score_stage32 = Score.find_by(level_id: 32, user_id: @current_user.user_id)
    @score_stage33 = Score.find_by(level_id: 33, user_id: @current_user.user_id)
    @score_stage34 = Score.find_by(level_id: 34, user_id: @current_user.user_id)
    @score_stage35 = Score.find_by(level_id: 35, user_id: @current_user.user_id)
    @score_stage36 = Score.find_by(level_id: 36, user_id: @current_user.user_id)
    @score_stage37 = Score.find_by(level_id: 37, user_id: @current_user.user_id)
    @score_stage38 = Score.find_by(level_id: 38, user_id: @current_user.user_id)
    @score_stage39 = Score.find_by(level_id: 39, user_id: @current_user.user_id)
    @score_stage40 = Score.find_by(level_id: 40, user_id: @current_user.user_id)

  end

  def leveltop
    @level = params[:level]
    @score = Score.find_by(level_id: @level, user_id: @current_user.user_id)
    gon.user = @current_user
  end
end
