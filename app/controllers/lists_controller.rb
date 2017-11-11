class ListsController < ApplicationController

  #Read
  def index
    @lists = List.all.order("status")
  end

  #Create
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.update_status
    @list.save

    redirect_to lists_path
  end

  #Update
  def edit
    @list = List.find(params[:id]).update_status
  end

  def update
    @list = List.find(params[:id])
    @list.update_status
    @list.update_attributes(list_params)

    update_lists_status

    redirect_to lists_path
  end

  #Delete
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  def list_params
    params.require(:list).permit(:item_name, :due_date, :memo)
  end
end
