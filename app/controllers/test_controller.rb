class TestController < ApplicationController
  def problem
    @level = params[:level]
    @word = Word.find_by(word_id: params[:word_id])
    # 何問目かを確認する処理
    @words = Result.where(answered: 0, level_id: params[:level].to_i, user_id: @current_user.user_id)
    @unanswered_questions_number = @words.length
    @problem_number = 51 - @unanswered_questions_number

    gon.href_link_incorrect = '/test/result/incorrect/' + @level + '/' + @word.word_id.to_s
    gon.href_link_correct = '/test/result/correct/' + @level + '/' + @word.word_id.to_s
    gon.speak_word = @word.word_en
    gon.word_jp = @word.word_jp
  end

  def reviewproblem
    @level = params[:level]
    @word = Word.find_by(word_id: params[:word_id])
    # 何問目かを確認する処理
    @words = Result.where(answered: 0, level_id: params[:level].to_i, user_id: @current_user.user_id, correct_judgment: 0)
    @unanswered_questions_number = @words.length
    @problem_number = 3 - @unanswered_questions_number

    gon.href_link_review_incorrect = '/test/result/review/incorrect/' + @level + '/' + @word.word_id.to_s
    gon.href_link_review_correct = '/test/result/review/correct/' + @level + '/' + @word.word_id.to_s
    gon.speak_word = @word.word_en
    gon.word_jp = @word.word_jp
  end

  def practiceproblem
    @level = params[:level]
    @practice_id = params[:practice_id]
    @word = Word.find_by(word_id: params[:word_id])
    # 何問目かを確認する処理
    @words = Result.where(answered: 0, level_id: params[:level].to_i, user_id: @current_user.user_id, practice_id: @practice_id.to_i)
    @unanswered_questions_number = @words.length
    @problem_number = 11 - @unanswered_questions_number

    gon.href_link_practice_incorrect = '/test/result/practice/incorrect/' + @level + '/' + @practice_id + '/' + @word.word_id.to_s
    gon.href_link_practice_correct = '/test/result/practice/correct/' + @level + '/' + @practice_id + '/' + @word.word_id.to_s
    gon.speak_word = @word.word_en
    gon.word_jp = @word.word_jp
  end

  def extractword
    @level = params[:level]

    # 未使用の単語群からランダムに単語を1つ抽出する処理
    @words = Result.where(answered: 0, level_id: @level.to_i, user_id: @current_user.user_id)
    if @words == []
      redirect_to('/test/score/' + @level)
    else
      @unanswered_questions_number = @words.length
      @word = @words[rand(@unanswered_questions_number)]

      redirect_to('/test/problem/' + @level + '/' + @word.word_id.to_s)
    end
  end

  def reviewword
    @level = params[:level]

    # 未使用の単語群からランダムに単語を1つ抽出する処理
    @words = Result.where(answered: 0, level_id: @level.to_i, user_id: @current_user.user_id, correct_judgment: 0)
    if @words == []
      redirect_to('/test/reviewfinish/' + @level)
    else
      @unanswered_questions_number = @words.length
      @word = @words[rand(@unanswered_questions_number)]

      redirect_to('/test/reviewproblem/' + @level + '/' + @word.word_id.to_s)
    end
  end

  def practiceword
    @level = params[:level]
    @practice_id = params[:practice_id]

    # 未使用の単語群からランダムに単語を1つ抽出する処理
    @words = Result.where(answered: 0, level_id: @level.to_i, user_id: @current_user.user_id, practice_id: @practice_id.to_i)
    if @words == []
      redirect_to('/test/afterpractice/' + @level)
    else
      @unanswered_questions_number = @words.length
      @word = @words[rand(@unanswered_questions_number)]

      redirect_to('/test/practiceproblem/' + @level + '/' + @practice_id + '/' + @word.word_id.to_s)
    end
  end

  def answer
    @level = params[:level]
    @word = Word.find_by(word_id: params[:word_id])

    # 何問目かを確認する処理
    @words = Result.where(answered: 0, level_id: params[:level].to_i, user_id: @current_user.user_id)
    @unanswered_questions_number = @words.length
    @problem_number = 51 - @unanswered_questions_number

  end

  def reviewanswer
    @level = params[:level]
    @word = Word.find_by(word_id: params[:word_id])

    # 何問目かを確認する処理
    @words = Result.where(answered: 0, level_id: params[:level].to_i, user_id: @current_user.user_id, correct_judgment: 0)
    @unanswered_questions_number = @words.length
    @problem_number = 3 - @unanswered_questions_number
  end

  def score
    @level = params[:level]

    # 正当数を記録
    @count_correct_words = Result.where(correct_judgment: 1, user_id: @current_user.user_id).count
    @score = Score.find_by(user_id: @current_user.user_id, level_id: @level)
    @score.score = @count_correct_words

    # 試行回数を記録
    if @score.trial_number == nil
      @score.trial_number = 1
    else
      @score.trial_number += 1
    end
    @score.save

  end

  def reviewfinish

  end

  def testtop
    @level = params[:level]

    # 全ての単語を未回答の状態にする
    Result.update_all(answered: 0)
  end

  def practicetop
    @level = params[:level]
    @practice_id = params[:practice_id]

    # 全ての単語を未回答の状態にする
    Result.update_all(answered: 0)
  end

  def reviewtop
    @level = params[:level]

    # 全ての単語を未回答の状態にする
    Result.update_all(answered: 0)
  end

  def correct
    # 回答済のチェックをいれる処理
    word = Result.find_by(word_id: params[:word_id])
    word.answered = 1
    word.save

    # 正解を記録する処理
    result = Result.find_by(word_id: params[:word_id])
    result.correct_judgment = 1
    result.save

    level = params[:level]
    redirect_to('/test/extract/' + level)
  end

  def incorrect
    # 回答済のチェックをいれる処理
    word = Result.find_by(word_id: params[:word_id])
    word.answered = 1
    word.save

    # 不正解を記録する処理
    result = Result.find_by(word_id: params[:word_id])
    result.correct_judgment = 0
    result.save

    level = params[:level]
    redirect_to('/test/extract/' + level)
  end

  def reviewcorrect
    # 回答済のチェックをいれる処理
    word = Result.find_by(word_id: params[:word_id])
    word.answered = 1
    word.save

    # 正解を記録する処理
    result = Result.find_by(word_id: params[:word_id])
    result.correct_judgment = 1
    result.save

    level = params[:level]
    redirect_to('/test/extract/review/' + level)
  end

  def reviewincorrect
    # 回答済のチェックをいれる処理
    word = Result.find_by(word_id: params[:word_id])
    word.answered = 1
    word.save

    # 不正解を記録する処理
    result = Result.find_by(word_id: params[:word_id])
    result.correct_judgment = 0
    result.save

    level = params[:level]
    redirect_to('/test/extract/review/' + level)
  end

  def practicecorrect
    # 回答済のチェックをいれる処理
    word = Result.find_by(word_id: params[:word_id])
    word.answered = 1
    word.save

    level = params[:level]
    practice_id = params[:practice_id]
    redirect_to('/test/extract/practice/' + level + '/' + practice_id)
  end

  def practiceincorrect
    # 回答済のチェックをいれる処理
    word = Result.find_by(word_id: params[:word_id])
    word.answered = 1
    word.save

    level = params[:level]
    practice_id = params[:practice_id]
    redirect_to('/test/extract/practice/' + level + '/'  + practice_id)
  end

  def practice
    @level = params[:level]

  end

  def afterpractice
    @level = params[:level]
  end

  def incorrectlist
    @level =params[:level]
    @incorrect_words_en = []
    @incorrect_words_jp = []
    @incorrect_words = Result.where(level_id: @level.to_i, user_id: @current_user.user_id, correct_judgment: 0)
    @incorrect_words.each do |word|
      incorrect_word = Word.find_by(word_id: word.word_id)
      @incorrect_words_en.push(incorrect_word.word_en)
      @incorrect_words_jp.push(incorrect_word.word_jp)
    end
  end
end