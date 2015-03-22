class BusinessmenController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_businessman, only: [:show, :edit, :update, :destroy]

  # GET /businessmen
  # GET /businessmen.json
  def index
    @businessmen = Businessman.all
  end

  # GET /businessmen/1
  # GET /businessmen/1.json
  def show
  end

  # GET /businessmen/new
  #def new
  #  @businessman = Businessman.new
  #end

  # GET /businessmen/1/edit
  def edit
  end

  # POST /businessmen
  # POST /businessmen.json
  def create
    @businessman = Businessman.new(businessman_params)
    respond_to do |format|
      if @businessman.save
        format.html { redirect_to @businessman, notice: 'Businessman was successfully created.' }
        format.json { render :show, status: :created, location: @businessman }
      else
        format.html { render :new }
        format.json { render json: @businessman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businessmen/1
  # PATCH/PUT /businessmen/1.json
  def update
    respond_to do |format|
      if @businessman.update(businessman_params)
        format.html { redirect_to @businessman, notice: 'Businessman was successfully updated.' }
        format.json { render :show, status: :ok, location: @businessman }
      else
        format.html { render :edit }
        format.json { render json: @businessman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businessmen/1
  # DELETE /businessmen/1.json
  def destroy
    @businessman.destroy
    respond_to do |format|
      format.html { redirect_to businessmen_url, notice: 'Businessman was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_businessman
      @businessman = Businessman.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def businessman_params
      params.require(:businessman).permit(:first_name, :last_name, :skype, :birth_date, :avatar)
    end
end
