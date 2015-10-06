class DerbyEventsController < ApplicationController
  before_action :set_derby_event, only: [:show, :edit, :update, :destroy]

  # GET /derby_events
  def index
    @title = "Derby Event List -"
    if admin_signed_in?
      @derby_events = DerbyEvent.all
    else
      @derby_events = DerbyEvent.upcoming
    end
    @derby_events = @derby_events.map {|derby_event| DerbyEventPresenter.new(derby_event)}
  end

  # GET /derby_events/1
  def show
    unless @derby_event.viewable? || admin_signed_in?
      redirect_to root_path
      return
    end
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  # GET /derby_events/new
  def new
    @title = "Submit an Event -"
    @derby_event = DerbyEvent.new
  end

  # GET /derby_events/1/edit
  def edit
    redirect_to root_path unless admin_signed_in?
  end

  # POST /derby_events
  def create
    derby_event_params[:start_date]
    @derby_event = DerbyEvent.new(derby_event_params)

    respond_to do |format|
      if @derby_event.save
        format.html { redirect_to event_thanks_path }
      else
        format.html { render :new }
      end
    end
  end

  def thanks
  end

  # PATCH/PUT /derby_events/1
  def update
    redirect_to root_path unless admin_signed_in?
    respond_to do |format|
      if @derby_event.update(derby_event_params)
        format.html { redirect_to root_path, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /derby_events/1
  def destroy
    redirect_to root_path unless admin_signed_in?
    @derby_event.destroy
    respond_to do |format|
      format.html { redirect_to derby_events_url, notice: 'Derby event was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derby_event
      @derby_event = DerbyEventPresenter.new(DerbyEvent.find(params[:id]))
    end

    def format_date_for_db(form_date)
      month, day, year = form_date.split('/')
      "#{year}-#{month}-#{day}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derby_event_params
      event_params = params.require(:derby_event).permit(:name, :start_date, :start_time, :end_date, :end_time, :venue, :city, :state, :postal_code, :country, :host, :website, :event_contact, :cost, :mrda, :wftda, :jrda, :made, :usars, :rdcl, :female, :male, :coed, :preregistration, :spectators, :general_info, :submission_contact, :approved, :deleted)

      [:start_date, :end_date].each do |date_field|
        if !event_params[date_field].blank?
          event_params[date_field] = format_date_for_db(event_params[date_field])
        end
      end
      event_params
    end
end
