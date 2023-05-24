class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
    def confirm_index
      @reservation = Reservation.new(reservation_params)
      @check_in = @reservation.check_in
      @check_out = @reservation.check_out
      @guests = @reservation.guests
      @total_price = calculate_total_price(@check_in, @check_out, @guests)
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    end
  end
  

