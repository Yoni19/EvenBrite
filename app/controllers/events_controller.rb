class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	before_action :is_organizer, only: [:update, :destroy, :edit]
  before_action :is_validated, only: [:show]

	def index
		@all_events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create 
		@event = Event.new(organizer: current_user,
			title: params[:title],
			start_date: params[:start_date],
			duration: params[:duration],
			description: params[:description],
			price: params[:price],
			location: params[:location]		
			)


		if @event.save
			flash[:success] = "L'evenement à bien été ajouté 👍"
			redirect_to events_path 
		else
    	# Keeps on the new event view
    	render 'new' 
    end
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])

  	if @event.update(title: params[:title],
  		start_date: params[:start_date],
  		duration: params[:duration],
  		description: params[:description],
  		price: params[:price],
  		location: params[:location]				
  		)

	  	flash[:success] = "Modifié avec succès ! 👍"
	  	redirect_to event_path
	  else
	  	render 'edit'
 		end
 	end


  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
  	flash[:alert] = "L'evenement à été supprimé (pense a sortir les poubelles 🗑️"
  	redirect_to events_path
  end

  # we use a method to make event modification and deletion more secure
  def is_organizer
  	@event = Event.find(params[:id])
  	puts "*"*1000
  	if current_user != @event.organizer && current_user.is_admin == false
  		flash[:error] = "Vous n'avez pas l'autorisation d'etre ici !"
  		redirect_to event_path
  	end
  end

   # we use this to prevent show for unvalidated events
  def is_validated
    @event = Event.find(params[:id])
    puts "*"*1000
    if @event.is_validated != false && current_user.is_admin == false
      flash[:error] = "Non disponible pour le moment !"
      redirect_to root_path
    end
  end
end
