class OpenPracticesController < ApplicationController
  before_action :set_open_practice, only: [:show, :edit, :update, :destroy]

  # GET /open_practices
  def index
    @title = "Open Practice List -"
    if admin_signed_in?
      @open_practices = OpenPractice.all
    else
      @open_practices = OpenPractice.viewable
    end
    @open_practices = @open_practices.map {|open_practice| OpenPracticePresenter.new(open_practice)}
  end

  # GET /open_practices/1
  def show
    unless admin_signed_in? || @open_practice.viewable?
      redirect_to root_path
      return
    end
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  # GET /open_practices/new
  def new
    @title = "Submit an Open Practice -"
    @open_practice = OpenPractice.new
  end

  # GET /open_practices/1/edit
  def edit
    redirect_to root_path unless admin_signed_in?
  end

  def thanks
  end

  # POST /open_practices
  def create
    @open_practice = OpenPractice.new(open_practice_params)

    respond_to do |format|
      if @open_practice.save
        format.html { redirect_to practice_thanks_path }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /open_practices/1
  def update
    redirect_to root_path unless admin_signed_in?
    respond_to do |format|
      if @open_practice.update(open_practice_params)
        format.html { redirect_to @open_practice, notice: 'Open practice was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /open_practices/1
  def destroy
    redirect_to root_path unless admin_signed_in?
    @open_practice.destroy
    respond_to do |format|
      format.html { redirect_to open_practices_url, notice: 'Open practice was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_open_practice
      @open_practice = OpenPracticePresenter.new(OpenPractice.find(params[:id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def open_practice_params
      params.require(:open_practice).permit(:league_name, :league_website, :city, :state, :postal_code, :country, :venue, :cost, :monday, :monday_start, :monday_end, :tuesday, :tuesday_start, :tuesday_end, :wednesday, :wednesday_start, :wednesday_end, :thursday, :thursday_start, :thursday_end, :friday, :friday_start, :friday_end, :saturday, :saturday_start, :saturday_end, :sunday, :sunday_start, :sunday_end, :venue, :practice_contact, :submission_contact, :approved, :deleted)
    end
end
