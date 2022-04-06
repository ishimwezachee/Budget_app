class FundingsController < ApplicationController
  before_action :set_funding, only: %i[ show edit update destroy ]

  # GET /fundings or /fundings.json
  def index
    @category = Category.find(params[:category_id])
    @fundings = @category.fundings.order(created_at: :desc)
  end

  # GET /fundings/1 or /fundings/1.json
  def show
  end

  # GET /fundings/new
  def new
    # @funding = Funding.new
    @user = current_user
    @category = Category.find(params[:category_id])
    @funding = Funding.new
  end

  # GET /fundings/1/edit
  def edit
  end

  # POST /fundings or /fundings.json


  def create
    @funding = Funding.new(funding_params)
    @funding.user_id = current_user.id
    @funding.category_id = Category.find_by_id(params[:category_id]).id
    respond_to do |format|
      if @funding.save
        format.html { redirect_to category_fundings_path(@funding.category_id), notice: "Funding was successfully created." }
        format.json { render :show, status: :created, location: @funding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funding.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding
      @funding = Funding.find(params[:id])
    end

    def funding_params
      params.require(:funding).permit(:user_id, :name, :category_id, :amount)
    end
end

















