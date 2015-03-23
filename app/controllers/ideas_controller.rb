class IdeasController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :like, :dislike, :interesting, :publish]

  # GET /ideas
  # GET /ideas.json
  def index
      @ideas = Idea.all
  end

  def for_businessman
      @ideas = Idea.where(businessman_id: params[:businessman_id])
  end

  def my
      @ideas = Idea.where(businessman_id: current_user.profile.id)
  end

  def published
      @ideas = Idea.published
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @interested_investors = @idea.get_likes(:vote_scope => 'interesting').voters
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.businessman = current_user.profile
    respond_to do |format|
      if @idea.save
        format.html { redirect_to for_businessman_ideas_path(businessman_id: @idea.businessman.id), notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to for_businessman_ideas_path(businessman_id: @idea.businessman.id), notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @idea.liked_by current_user.profile

    if request.xhr?
      head :ok
    else
      redirect_to @idea
    end
  end

  def dislike
    @idea.disliked_by current_user.profile

    if request.xhr?
      head :ok
    else
      redirect_to @idea
    end
  end

  def interesting
    @idea.liked_by current_user.profile, vote_scope: 'interesting'

    if request.xhr?
      head :ok
    else
      redirect_to @idea
    end
  end

  def publish
    @idea.update(published: true)
    redirect_to @idea, notice: 'Idea has been published'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :branch, :location, :team, :plans, :demands)
    end
end
