class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
    def index
      @reservations = current_user
      @reservations = Reservation.all
    end
    
 

  def show
    @total_price = @reservation.room.price * (@reservation.check_out - @reservation.check_in).to_i * @reservation.head_count
  end
  
  def new
    @reservation = Reservation.new
    @reservation.room_id = params[:room_id]
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :head_count, :user_id, :room_id,:guests))
    @room = Room.find(params[:reservation][:room_id])
    @user = User.find_by(params[:reservation][:room_id])
    if @reservation.save
      respond_to do |format|
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def confirm
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.check_in.nil?
      redirect_to @room, alert: "開始日を入力してください" and return
    end
    if @reservation.check_out.nil?
      redirect_to @room, alert: "終了日を入力してください" and return
    end
    if @reservation.check_out < @reservation.check_in
      redirect_to @room, alert: "終了日は開始日以降の日付にしてください" and return
    end
    if @reservation.head_count.nil?
      redirect_to @room, alert: "正しい人数を入力してください" and return
    end
    @total_day = (@reservation.check_out - @reservation.check_in).to_i 
    @total_price = (@total_day * @reservation.head_count * @room.fee)
  end
  
    private
  
   
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out, :head_count, :user_id, :room_id,:guests)
    end
  end