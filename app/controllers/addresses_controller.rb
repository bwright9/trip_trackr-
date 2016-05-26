class AddressesController < ApplicationController

def index
    @addresses = Address.all
  end

   def edit
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def show
    @address = Address.find(params[:id])
  end

  def create
  @address = Address.new(addresse_params)
  if @address.save
    redirect_to addresses_path
  else
    render :new
  end
end

  def destroy
    @addresse = Address.find(params[:id])
    @addresse.destroy
    redirect_to addresses_path
  end

  def update
    @addresse = Address.find(params[:id])
    if @addresse.update(addresse_params)
      redirect_to addresse_path(@addresse)
    else
      render :edit
    end
  end

  private

  def addresse_params
    params.require(:addresse).permit(:city, :state, :zip, :street)
  end
end








