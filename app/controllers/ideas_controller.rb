class IdeasController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :like, :dislike, :interesting, :publish]

  IDEAS_PER_PAGE = 5

  # GET /ideas
  # GET /ideas.json
  def index
      @ideas = Idea.all.paginate(page: params[:page], per_page: IDEAS_PER_PAGE)
  end

  def for_businessman
      @ideas = Idea.where(businessman_id: params[:businessman_id]).paginate(page: params[:page], per_page: IDEAS_PER_PAGE)
  end

  def my
      @ideas = Idea.where(businessman_id: current_user.profile.id).paginate(page: params[:page], per_page: IDEAS_PER_PAGE)
  end

  def published
      @ideas = Idea.published.paginate(page: params[:page], per_page: IDEAS_PER_PAGE)
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
        format.html { redirect_to my_ideas_path, notice: 'Idea was successfully created.' }
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
      format.html { redirect_to my_ideas_path, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    if current_user.profile.liked? @idea
      @idea.unliked_by current_user.profile
    else
      @idea.liked_by current_user.profile
    end

    if request.xhr?
       render json: { 'likes_count': @idea.get_likes.count, 'dislikes_count': @idea.get_dislikes.count }
    else
      redirect_to @idea
    end
  end

  def dislike
    if current_user.profile.disliked? @idea
      @idea.undisliked_by current_user.profile
    else
      @idea.disliked_by current_user.profile
    end

    if request.xhr?
      render json: { 'likes_count': @idea.get_likes.count, 'dislikes_count': @idea.get_dislikes.count }
    else
      redirect_to @idea
    end
  end

  def interesting
    if current_user.profile.liked? @idea, vote_scope: 'interesting'
      @idea.unliked_by current_user.profile, vote_scope: 'interesting'
    else
      @idea.liked_by current_user.profile, vote_scope: 'interesting'
    end

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
