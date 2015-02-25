class HashtagsController < ApplicationController


	def show
		@status = Status.where("body LIKE ?", "%##{params[:id]}%")
	end

end