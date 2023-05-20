class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = @user.rooms
    @rooms = Room.all

  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      redirect_to new_room_path, alert: 'Failed to create a room.'
    end
  end

  def show
    
    @user = current_user
    @room = Room.find(params[:id])
    @reserve = Reserve.new
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def search
    @user = current_user
    @q = Room.ransack(params[:q])
    binding.pry
    @rooms = @q.result(distinct: true)
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :avatar, :user_id, :room_id)
  end
end

