class MoviesController < ApplicationController
  
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :checkout, :checkin]
  before_action :authenticate_user!

  # GET /movies
  # GET /movies.json
  def index
    @current_user = current_user
    @movies = Movie.sorted
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @current_user = current_user
    if !@movie.checked_out_to_id.nil?
      if @movie.checked_out_to_id == current_user.id
        @checkout_status = "You currently have this movie"
      else
        checked_out_to = User.find(@movie.checked_out_to_id).name
        @checkout_status = "Checked out to #{checked_out_to}" 
      end
    else
      @checkout_status = "Available!" 
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @users = User.all
    
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    if @movie.rating.nil?
      @movie.rating = 0
    end
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update

    if @movie.rating.nil?
      @movie.rating = 0
    end

    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkout
    if @movie.update(:checked_out_to => current_user)
      redirect_to @movie, notice: 'Movie was successfully checked out to you!' 
    else
      redirect_to @movie, notice: 'Error unable to checkout movie' 
    end    
  end

  def checkin
    
    if @movie.update(:checked_out_to => nil)
      redirect_to @movie, notice: 'Movie was successfully returned!' 
    else
      redirect_to @movie, notice: 'Error unable to return movie' 
    end
    
  end
  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :rating, :runtime, :released, :url, :checked_out_to_id)
    end
end
