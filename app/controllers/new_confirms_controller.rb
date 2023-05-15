class NewConfirmsController < ApplicationController
  before_action :set_new_confirm, only: %i[ show edit update destroy ]

  # GET /new_confirms or /new_confirms.json
  def index
    @new_confirms = NewConfirm.all
  end

  # GET /new_confirms/1 or /new_confirms/1.json
  def show
  end

  # GET /new_confirms/new
  def new
    @new_confirm = NewConfirm.new
  end

  # GET /new_confirms/1/edit
  def edit
  end

  # POST /new_confirms or /new_confirms.json
  def create
    @new_confirm = NewConfirm.new(new_confirm_params)

    respond_to do |format|
      if @new_confirm.save
        format.html { redirect_to new_confirm_url(@new_confirm), notice: "New confirm was successfully created." }
        format.json { render :show, status: :created, location: @new_confirm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @new_confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_confirms/1 or /new_confirms/1.json
  def update
    respond_to do |format|
      if @new_confirm.update(new_confirm_params)
        format.html { redirect_to new_confirm_url(@new_confirm), notice: "New confirm was successfully updated." }
        format.json { render :show, status: :ok, location: @new_confirm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @new_confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_confirms/1 or /new_confirms/1.json
  def destroy
    @new_confirm.destroy

    respond_to do |format|
      format.html { redirect_to new_confirms_url, notice: "New confirm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_confirm
      @new_confirm = NewConfirm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def new_confirm_params
      params.require(:new_confirm).permit(:check_in, :check_out, :head_count_interger, :user_id, :room_id)
    end
end
