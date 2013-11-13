class EventsController < ApplicationController
	def index
		@events=Event.all
	end

	def show
		@event=Event.find(params[:id])
		@reviews=@event.reviews
	end

	def edit
		@event=Event.find(params[:id])
	end

	def update
		@event=Event.find(params[:id])
		if @event.update_attributes(event_params)
			flash[:notice]="Nice"
			redirect_to @event
		else
			render 'edit'
		end
	end

	def new
		@event=Event.new
	end

	def create
		@event=Event.new (event_params)
		if @event.save
			flash[:notice]="Success"
			redirect_to @event
		else
			flash[:error]="nope"	
			render 'new'
		end
	end

	def destroy
		@event=Event.find(params[:id]).destroy
		redirect_to events_path
	end

	private
	def event_params
		params.require(:event).permit(:title,:description,:address)
	end
end
