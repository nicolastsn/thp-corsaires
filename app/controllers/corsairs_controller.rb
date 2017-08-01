class CorsairsController < ApplicationController
  def new
  	@corsair = Corsair.new
  end

  def show
  	@corsair = Corsair.find(params[:id])
  end

  def edit
  	@corsair = Corsair.find(params[:id])
  end

  def index
  	@corsair = Corsair.all
  end

  def update
  	@corsair = Corsair.find(params[:id])
  	if @corsair.update(corsair_params)
  		flash[:success] = "Corsair #{@corsair.first_name} has been modified"
  		redirect_to corsair_path(@corsair)
  	else
  		render :edit
  	end
  end

  def create
  	@corsair = Corsair.new(corsair_params)
   
  	if @corsair.save
  		flash[:success] = "New corsair #{@corsair.first_name} successfully created!"
  		redirect_to @corsair
  	else
  		render :new
  	end
  end

  def destroy
  	@corsair = Corsair.find(params[:id])
  	@corsair.destroy
  	redirect_to corsairs_path
  end

private
  def corsair_params
  	params.require(:corsair).permit(:first_name, :age, :bio, :slack_handle, :github_handle, :likeness)
  end

end
