class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :authenticate_user, {only: [:top, :menu1, :menu2, :menu3, :menu4, :leveltop, :problem, :reviewproblem, :practiceproblem, :extractword, :reviewword, :practiceword, :answer, :reviewanswer, :score, :reviewfinish, :testtop, :practicetop, :correct, :incorrect, :reviewcorrect, :reviewincorrect, :practicecorrect, :practiceincorrect, :practice, :afterpractice, :incorrectlist]}
    before_action :forbid_login_user, {only: [:loginform, :login]}

    def set_current_user
        @current_user = User.find_by(user_id: session[:user_id])
    end

    def authenticate_user
        if @current_user == nil
            flash[:notice] = "ログインが必要です!"
            redirect_to("/home/loginform")
        end
    end

    def forbid_login_user
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/home/menu1")
        end
    end
end
