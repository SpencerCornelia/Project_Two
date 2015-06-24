module ButtonsHelper

	def button_num
		@button = Button.find(params[:id])
	end
end
