class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def index
  	@event = Event.find(params[:id])
  	@attendances = @event.attendances
  end

  def new
    @event = Event.find(params[:id])
  end

  def create
  	@event = Event.find(params[:id])

  	a = Attendance.create(stripe_customer_id: "Evenement gratuit",user: current_user, event: @event)

  	flash[:success] = "Vous rejoignez l'evenement !"
		redirect_to root_path
	end
end
