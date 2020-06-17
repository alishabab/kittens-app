class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  def show
    @kitten = Kitten.find(params[:id])
  end
  def new
    @kitten =Kitten.new
  end
  def create
    @kitten = Kitten.new(kitten_params)
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
