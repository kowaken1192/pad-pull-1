class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = @user.rooms
  end

  def new
    @user = current_user
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
      if @room.save
        redirect_to @room, notice: 'Room was successfully created.'
      else
        render :new
      end
    end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :information, :price, :address, :user_id,:room_id, :image))
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
    @rooms = @q.result(distinct: true)
  end
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :avatar,:user_id,:room_id)
  end
end
