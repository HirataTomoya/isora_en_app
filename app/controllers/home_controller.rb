class HomeController < ApplicationController
  def loginform
  end

  def login
    @user = User.find_by(password: params[:password])
    if @user
      session[:user_id] = @user.user_id
      redirect_to("/home/menu1")
    else
      redirect_to("/home/loginform")
      flash[:notice] = "パスワードが間違っています"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def menu1
    score_stage1 = Score.find_by(level_id: 1, user_id: @current_user)
    score_stage2 = Score.find_by(level_id: 2, user_id: @current_user)
    score_stage3 = Score.find_by(level_id: 3, user_id: @current_user)
    score_stage4 = Score.find_by(level_id: 4, user_id: @current_user)
    score_stage5 = Score.find_by(level_id: 5, user_id: @current_user)
    score_stage6 = Score.find_by(level_id: 6, user_id: @current_user)
    score_stage7 = Score.find_by(level_id: 7, user_id: @current_user)
    score_stage8 = Score.find_by(level_id: 8, user_id: @current_user)
    score_stage9 = Score.find_by(level_id: 9, user_id: @current_user)
    score_stage10 = Score.find_by(level_id: 10, user_id: @current_user)

    gon.score_stage1 = score_stage1
    gon.score_stage2 = score_stage2
    gon.score_stage3 = score_stage3
    gon.score_stage4 = score_stage4
    gon.score_stage5 = score_stage5
    gon.score_stage6 = score_stage6
    gon.score_stage7 = score_stage7
    gon.score_stage8 = score_stage8
    gon.score_stage9 = score_stage9
    gon.score_stage10 = score_stage10
    gon.user = @current_user
  end

  def menu2
    score_stage11 = Score.find_by(level_id: 11, user_id: @current_user)
    score_stage12 = Score.find_by(level_id: 12, user_id: @current_user)
    score_stage13 = Score.find_by(level_id: 13, user_id: @current_user)
    score_stage14 = Score.find_by(level_id: 14, user_id: @current_user)
    score_stage15 = Score.find_by(level_id: 15, user_id: @current_user)
    score_stage16 = Score.find_by(level_id: 16, user_id: @current_user)
    score_stage17 = Score.find_by(level_id: 17, user_id: @current_user)
    score_stage18 = Score.find_by(level_id: 18, user_id: @current_user)
    score_stage19 = Score.find_by(level_id: 19, user_id: @current_user)
    score_stage20 = Score.find_by(level_id: 20, user_id: @current_user)

    gon.score_stage11 = score_stage11
    gon.score_stage12 = score_stage12
    gon.score_stage13 = score_stage13
    gon.score_stage14 = score_stage14
    gon.score_stage15 = score_stage15
    gon.score_stage16 = score_stage16
    gon.score_stage17 = score_stage17
    gon.score_stage18 = score_stage18
    gon.score_stage19 = score_stage19
    gon.score_stage20 = score_stage20
  end

  def menu3
    score_stage21 = Score.find_by(level_id: 21, user_id: @current_user)
    score_stage22 = Score.find_by(level_id: 22, user_id: @current_user)
    score_stage23 = Score.find_by(level_id: 23, user_id: @current_user)
    score_stage24 = Score.find_by(level_id: 24, user_id: @current_user)
    score_stage25 = Score.find_by(level_id: 25, user_id: @current_user)
    score_stage26 = Score.find_by(level_id: 26, user_id: @current_user)
    score_stage27 = Score.find_by(level_id: 27, user_id: @current_user)
    score_stage28 = Score.find_by(level_id: 28, user_id: @current_user)
    score_stage29 = Score.find_by(level_id: 29, user_id: @current_user)
    score_stage30 = Score.find_by(level_id: 30, user_id: @current_user)

    gon.score_stage21 = score_stage21
    gon.score_stage22 = score_stage22
    gon.score_stage23 = score_stage23
    gon.score_stage24 = score_stage24
    gon.score_stage25 = score_stage25
    gon.score_stage26 = score_stage26
    gon.score_stage27 = score_stage27
    gon.score_stage28 = score_stage28
    gon.score_stage29 = score_stage29
    gon.score_stage30 = score_stage30
  end

  def menu4
    score_stage31 = Score.find_by(level_id: 31, user_id: @current_user)
    score_stage32 = Score.find_by(level_id: 32, user_id: @current_user)
    score_stage33 = Score.find_by(level_id: 33, user_id: @current_user)
    score_stage34 = Score.find_by(level_id: 34, user_id: @current_user)
    score_stage35 = Score.find_by(level_id: 35, user_id: @current_user)
    score_stage36 = Score.find_by(level_id: 36, user_id: @current_user)
    score_stage37 = Score.find_by(level_id: 37, user_id: @current_user)
    score_stage38 = Score.find_by(level_id: 38, user_id: @current_user)
    score_stage39 = Score.find_by(level_id: 39, user_id: @current_user)
    score_stage40 = Score.find_by(level_id: 40, user_id: @current_user)

    gon.score_stage31 = score_stage31
    gon.score_stage32 = score_stage32
    gon.score_stage33 = score_stage33
    gon.score_stage34 = score_stage34
    gon.score_stage35 = score_stage35
    gon.score_stage36 = score_stage36
    gon.score_stage37 = score_stage37
    gon.score_stage38 = score_stage38
    gon.score_stage39 = score_stage39
    gon.score_stage40 = score_stage40
  end

  def leveltop
    @level = params[:level]
    @score = Score.find_by(level_id: @level, user_id: @current_user)
  end
end
