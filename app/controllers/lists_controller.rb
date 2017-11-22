class ListsController < ApplicationController

  before_action :set_todo, :only => [:show, :edit, :update, :destroy, :done]
  #after_action :back, :only => [:destroy]

  #Read
  def index
    lists = List.all

    lists.each do |l|
      l.update_status
    end

    @lists = lists.order("status, due_date")
  end

  #Create
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :action => :new
    end
  end

  #Update
  def edit
    if @list.status == 1 || @list.status == 4
      render lists_path
    end
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to lists_path
    else
      render :action => :edit
    end
  end

  #Delete
  def destroy

  if @list.status <= 3
      @list.destroy
      flash[:alert] = "Task was successfully deleted !!"
      redirect_to lists_path
    else
      flash[:alert] = "Task is overdue, can not be deleted !!"
      redirect_to todos_path
    end
  end

  # Finish the task
  def done
    @list.update(task_done: true)
    redirect_to lists_path
  end

  private

  def set_todo
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:item_name, :due_date, :memo)
  end
end
