class CatelogiesController < ApplicationController
  def index
    @catelogies = Catelogy.paginate(page: params[:page], per_page:2).order("created_at desc")
  end

  def show
    @catelogy = Catelogy.find(params[:id])
  end

  def new
    @catelogy = Catelogy.new
  end

  def create
    @catelogy = Catelogy.new(catelogy_params)
    if @catelogy.save
      redirect_to catelogies_path
    else
      render "new"
    end
  end

  def edit
    @catelogy = Catelogy.find(params[:id])
  end

  def update
    @catelogy = Catelogy.find(params[:id])     
    if @catelogy.update(catelogy_params)
       redirect_to catelogies_path
    else
      render "edit"
    end
  end

  def destroy
    @catelogy = Catelogy.find(params[:id])
    @catelogy.destroy
    redirect_to catelogies_path
  end
  private
  def catelogy_params
    params.require(:catelogy).permit(:name, :description, :image)    
  end
end
