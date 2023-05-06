class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)
    if @reservation.valid?
      @reservation.save
      redirect_to reservation_confirmation_path(@reservation)
    else
      render :new
    end
  end


  def show
    @reservation = Reservation.find(:room_id)
    @room = @reservation.room
    binding.pry
    if @reservation.nil?
      flash[:error] = '予約情報が見つかりませんでした。'
      redirect_to root_path and return
    end
    @room = @reservation.room
  if @room.nil?
    flash[:error] = '部屋情報が見つかりませんでした。'
    redirect_to root_path and return
  end
  end

  def confirm
    @reservation = Reservation.new(params.permit(:check_in, :check_out, :num_of_people,:head_count,:room_id, :user_id ))
    @room = @reservation.room
    @check_in = @reservation.check_in
    @check_out = @reservation.check_out
    @total_day = (@check_out - @check_in ).to_i
    @number_of_people = @reservation.head_count
    @total_price = @room.price * @total_day * @number_of_people
  end
end
private

def reservation_params
  params.require(:reservation).permit(:check_in, :check_out, :num_of_people,:head_count)
end

