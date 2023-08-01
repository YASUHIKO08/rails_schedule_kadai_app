class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all 
  end

  def new
    @schedule = Schedule.new 
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title,:start,:end,:memo,:all_day))
    if @schedule.save
      flash[:notice] = "新規登録が完了しました"
      redirect_to :schedules
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    flash[:notice] = "編集が完了しました"
    if @schedule.update(params.require(:schedule).permit(:title,:start,:end,:memo,:all_day))
      redirect_to :schedules
    else
      render "edit"
    end
  end

  def destroy
    @Sshedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "削除が完了しました"
    redirect_to :schedules
  end

end
