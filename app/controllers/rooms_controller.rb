class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show] 
  before_action :set_q, only: [:index, :search]
  def index
    @user = current_user
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
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
  if params[:id] == 'search'
    # 'search'が渡された場合の処理を記述する
    # 例えば、検索結果を表示するための処理を行う
  else
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
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
      @results = @q.result
      @numbers = @q.result.count
    end
end
  private
  def set_q
    @q = Room.ransack(params[:q])
  end
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :avatar,:room_id).merge(user_id: current_user.id)
  end

