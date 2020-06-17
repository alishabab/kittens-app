class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.json { render json: @kittens }
      format.html {render index: @kittens }
    end
  end
  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.json { render json: @kitten }
      format.html {render show: @kitten }
    end
  end
  def new
    @kitten =Kitten.new
  end
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      # respond_to do |format|
      #   format.json { render json: @kitten }
      # end
      redirect_to @kitten
    end
  end
  def edit
    @kitten = Kitten.find(params[:id])
  end
  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    redirect_to @kitten
  end
  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path
  end
  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
