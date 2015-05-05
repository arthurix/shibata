class AppointmentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def index
  	@appointments = if params[:keywords]
        Appointment.where('UPPER(name) like UPPER(?)',"%#{params[:keywords]}%")
    else
        Appointment.all
    end
  end
end
