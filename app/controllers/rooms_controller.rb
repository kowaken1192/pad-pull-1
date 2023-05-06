class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @reservation = Reservation.new
  end

  def show    
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :avatar))
    if @room.save
      redirect_to @room
    else
      render 'new'
    end
  end
  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :price, :address, :avatar))

      redirect_to @room, notice: 'ルーム情報を更新しました'
    else
      render :edit
    end
  end
  
  
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end



def room_params
  params.require(:room).permit(:name, :introduction, :price, :address, :avatar)
end
