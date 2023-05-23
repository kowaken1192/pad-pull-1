class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
    @user = current_user
    @reserve = @user.rooms
  end

  def new
    @room = Room.find(params[:room_id])
    @reserve = @room.reserves.new
    @reserve.user_id = current_user.id 
  end

  def create
      @reserve = Reserve.new(reserve_params)
      @room = Room.find(params[:reserve][:room_id])
      @reserve.room_id = @room.id
      if @reserve.save
        redirect_to @reserve, notice: 'Room was successfully created.'
      else
        render "rooms/show"
      end
  end
  def update
    @reserve = Reserve.new(reserve_params)
  end
    def show
      @reserves = Reserve.all

    if @reserve.nil?
      flash[:error] = '予約情報が見つかりませんでした。'
      redirect_to root_path and return
    end
    @room = @reserve.room
    if @room.nil?
      flash[:error] = '部屋情報が見つかりませんでした。'
      redirect_to root_path and return
    end
  end

  def confirm
    @reserve = Reserve.new(reserve_params)
    @room = Room.find(params[:reserve][:room_id])
    @user_id = current_user.id
    @check_in = @reserve.check_in
    @check_out = @reserve.check_out
    if @reserve.check_in.nil?
      redirect_to @room, alert: "開始日を入力してください"
      return
    end
    
    if @reserve.check_out.nil?
      redirect_to @room, alert: "終了日を入力してください"
      return
    end
    
    if @reserve.number_of_people.nil?
      redirect_to @room, alert: "正しい人数を入力してください"
      return
    end
    
    @total_day = (@check_out - @check_in).to_i
    @number_of_people = @reserve.number_of_people
    @total_price = @room.price.to_i * @total_day * @reserve.number_of_people.to_i
  end
end
  private

  def reserve_params
    params.require(:reserve).permit(:check_in, :check_out, :number_of_people, :room_id, :user_id)
  end

