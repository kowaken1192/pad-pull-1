class RoomsController < ApplicationController
 

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
    @reservation = Reservation.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save  
      redirect_to @room
    else
      render 'new'
    end
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :head_count, ))
    binding.pry
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end
 
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :avatar)
  end
  
end
