class ReviewsController < ApplicationController
	def new
		@event=Event.find(params[:event_id])
		@review=Review.new
	end

	def create
		@event=Event.find(params[:event_id])
		@review=@event.reviews.build(review_params)
		@review.user_id=current_user.id #need user id to give review.user something
        current_user.points +=1
        @user=User.find_by_email(current_user[:email])
        @user.update_attributes(:points=>(@user.points+1))
		#since reviews belong to users they get the id from current
		debugger
		if @review.save
			redirect_to @event
		else
			render 'new'
		end

	end

	def destory
	end

	def edit
	end

	def update
	end

	private
	def review_params
		params.require(:review).permit(:comment)
	end
end
