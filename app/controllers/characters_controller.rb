class CharactersController < ApplicationController
  before_action :require_login
  before_action :set_character, only: %i[show edit update destroy]

  # GET /characters or /characters.json
  def index
    #@characters = Character.all
    if current_user
      @characters = current_user.characters
    else
      @characters = []
    end
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters or /characters.json
  def create
    #@character = Character.new(character_params)
    @character = current_user.characters.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: "Character was successfully created." }
        format.json { render :show, status: :created, location: @character }
        # redirect_to characters_path, notice: 'Character created successfully!'
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
        # render :new, alert: 'Error creating character.'
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy!

    respond_to do |format|
      format.html { redirect_to characters_path, status: :see_other, notice: "Character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      # @character = Character.find(params[:id])
      @character = current_user.characters.find_by(id: params[:id])
      redirect_to characters_path, alert: "Character not found or unauthorized access." unless @character
    end

    def require_login
      unless logged_in?
        redirect_to login_path, alert: "You must be logged in to access this page."
      end
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :level, :abilities)
    end
end