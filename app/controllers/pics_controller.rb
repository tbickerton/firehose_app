class PicsController < ApplicationController

	def index
		@pics = Pic.all
	end

	def new
		@pic = Pic.new
	end

	def show
		@pic = Pic.find(params[:id])
	end

	def destroy
		Pic.destroy(params[:id])
		redirect_to pics_path
	end

	def create
		# Call Pic.create(:lesson =>1, ....)
		@pic = Pic.create( pic_params )
		if @pic .valid?
			redirect_to pics_path
		else
			render :new, :status => :unprocessable_entity

		end
	end

	private 


	def pic_params
		params.require(:pic).permit(:lesson, :learned, :emotion, :image)

	end

end
