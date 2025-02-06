class HabitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @habits = current_user.habits
  end

  def new
    @habit = Habit.new # フォーム用の空の Habit オブジェクトを作成
  end

  def create
    @habit = current_user.habits.new(habit_params) # フォームのデータを使って Habit を作成

    if @habit.save
      redirect_to habits_path, notice: '習慣を登録しました！' # 成功時に一覧ページへ
    else
      render :new, status: :unprocessable_entity # 失敗時はフォームを再表示
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:title, :description) # フォームからのデータを許可
  end
end
