class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)
    @user = current_user
    if @reservation.save
      redirect_to reservation_confirmation_path(@reservation)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = @reservation.room
    @user_id = current_user.id
    @check_in = @reservation.check_in
    @check_out = @reservation.check_out
    @total_day = (@check_out - @check_in ).to_i
    @number_of_people = @reservation.number_of_people
    @total_price = @room.price.to_i * @total_day * @reservation.number_of_people.to_i

    if @reservation.save
      redirect_to @reservation
    else
      render 'new'
    end
  end  
end

private

def reservation_params
  params.require(:reservation).permit(:check_in, :check_out, :number_of_people,:room_id,:user_id)
end
