class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy,]
  before_action :set_current_user
  def index
    @reservations = Reservation.all
    @rooms = Room.all
    @user = current_user
    @reservation = @user.rooms
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
    @reservation.user_id = current_user.id
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    respond_to do |format|
      if @reservation.valid? && @reservation.save
        format.html { redirect_to post_url(@reservation), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    if @reservation.nil?
      flash[:error] = '予約情報が見つかりませんでした。'
      redirect_to root_path and return
    end

    @room = @reservation.room
    @reservation = Reservation.new

    if @room.nil?
      flash[:error] = '部屋情報が見つかりませんでした。'
      redirect_to root_path and return
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    @user_id = current_user.id
    @check_in = @reservation.check_in
    @check_out = @reservation.check_out
    @total_day = (@check_out - @check_in).to_i
    @number_of_people = @reservation.number_of_people
    @total_price = @room.price.to_i * @total_day * @reservation.number_of_people.to_i
  
      if @reservation.save
        redirect_to @reservation
      else
        render 'new'
      end
  end  

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :number_of_people, :room_id, :user_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
 end
 def set_current_user
  @current_user = current_user
end