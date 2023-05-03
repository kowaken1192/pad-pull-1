class ReservationsController < ApplicationController
  #before_action :permit_params

def index
@user = current_user
@reservations = Reservation.all
end

def confirm

if params[:room_id]
@room = Room.find(params[:room_id])

    @user_id = current_user.id
    @reservation = Reservation.new
else
  render "rooms/show"
end
end

def create
  @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :head_count, ))
  @room = Room.find(params[:reservation][:room_id])
  @user = User.find_by(params[:reservation][:room_id])
  if @reservation.save
    redirect_to :reservations
  def show
    binding.pry
    @reservation = Reservation.find_by(room_id: params[:room_id])
    @room = @reservation.room
  end

private


# Only allow a list of trusted parameters through.
def reservation_params
  params.require(:reservation).permit(:check_in, :check_out, :head_count, :user_id, :room_id,:guests)
end
end
end
end


