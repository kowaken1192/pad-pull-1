class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
    @user = current_user
    @reserve = @user.rooms
  end

  def new
    @room = Room.find(params[:room_id])
    @reserve = Reserve.new
    @reserve.user_id = current_user.id
    @reserve = @room_info.reserves.new
  end

  def create
    @reserve = Reserve.new(reserve_params)
    @room = Room.find(params[:reserve][:room_id])
    @reserve.room_id = @room.id
    respond_to do |format|
      if @reserve.calculate_and_save(@room)
        format.html { redirect_to @reserve, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @reserve }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
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
    @total_day = (@check_out - @check_in).to_i
    @number_of_people = @reserve.number_of_people
    @total_price = @room.price.to_i * @total_day * @reserve.number_of_people.to_i


  end
  private

  def reserve_params
    params.require(:reserve).permit(:check_in, :check_out, :number_of_people, :room_id, :user_id)
  end
end

