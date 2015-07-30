class DerbyEventsController < ApplicationController
  before_action :set_derby_event, only: [:show, :edit, :update, :destroy]

  # GET /derby_events
  # GET /derby_events.json
  def index
    if admin_signed_in?
      @derby_events = DerbyEvent.all
    else
      @derby_events = DerbyEvent.where(approved: true, deleted: false)
    end
  end

  # GET /derby_events/1
  # GET /derby_events/1.json
  def show
    redirect_to root_path
  end

  # GET /derby_events/new
  def new
    @derby_event = DerbyEvent.new
  end

  # GET /derby_events/1/edit
  def edit
    redirect_to root_path unless admin_signed_in?
  end

  # POST /derby_events
  # POST /derby_events.json
  def create
    derby_event_params[:start_date]
    @derby_event = DerbyEvent.new(derby_event_params)

    respond_to do |format|
      if @derby_event.save
        format.html { redirect_to thanks_path }
        format.json { render :show, status: :created, location: @derby_event }
      else
        format.html { render :new }
        format.json { render json: @derby_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def thanks
  end

  # PATCH/PUT /derby_events/1
  # PATCH/PUT /derby_events/1.json
  def update
    redirect_to root_path unless admin_signed_in?
    respond_to do |format|
      if @derby_event.update(derby_event_params)
        format.html { redirect_to @derby_event, notice: 'Derby event was successfully updated.' }
        format.json { render :show, status: :ok, location: @derby_event }
      else
        format.html { render :edit }
        format.json { render json: @derby_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /derby_events/1
  # DELETE /derby_events/1.json
  def destroy
    redirect_to root_path unless admin_signed_in?
    @derby_event.destroy
    respond_to do |format|
      format.html { redirect_to derby_events_url, notice: 'Derby event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derby_event
      @derby_event = DerbyEvent.find(params[:id])
    end

    def format_date_for_db(form_date)
      month, day, year = form_date.split('/')
      "#{year}-#{month}-#{day}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derby_event_params
      event_params = params.require(:derby_event).permit(:name, :start_date, :start_time, :end_date, :end_time, :venue, :city, :state, :postal_code, :country, :host, :website, :event_contact, :cost, :mrda, :wftda, :jrda, :made, :usars, :rdcl, :female, :male, :coed, :preregistration, :spectators, :general_info, :submission_contact)
      [:start_date, :end_date].each do |date_field|
        if !event_params[date_field].blank?
          event_params[date_field] = format_date_for_db(event_params[date_field])
        end
      end
      event_params
    end
end
