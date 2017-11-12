class ListsController < ApplicationController

  #Read
  def index
    lists = List.all.order("status")
    lists.each do |l|
      l.update_status
    end

    @lists = lists
  end

  #Create
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    @list.update_status

    redirect_to lists_path
  end

  #Update
  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)

    @list.update_status

    redirect_to lists_path
  end

  #Delete
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  def done
    @list = List.find(params[:id])

    if @list.task_done == true
      @list.update(task_done: false)
    else
      @list.update(task_done: true)
    end

    @list.update_status
    
    redirect_to lists_path
  end

  def list_params
    params.require(:list).permit(:item_name, :due_date, :memo)
  end
end
