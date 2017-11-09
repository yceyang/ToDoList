class ListsController < ApplicationController

  #Read
  def index
    @lists = List.all
  end

  #Create
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to lists_path
  end

  #Update
  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)

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
