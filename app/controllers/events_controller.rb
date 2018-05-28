class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_presenter, only: [:show]
  #TODO: shouldn't we authenticate the user before the create action also?
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :authorised_user?, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @event = Event.new
  end

  def create
    event_params = user_params
    # add the user id if we've got one
    event_params.merge!(user_id: current_user.id) if user_signed_in?
    # handle creation of recurring events here
    if params[:recurring] == 'yes'
      series_params = event_params.merge(event_params[:event_series]).except(:event_series, :featured)
      @event_series = EventSeries.new(series_params)
      saved = @event_series.save
      notice = I18n.t('event_series.created', link: url_for(@event_series), name: @event_series.name, num_events: @event_series.coming_events.size)
    else
      @event = Event.new(event_params.except('event_series'))


      #
      # TODO: REMOVE WHEN LOCATION USER INPUT IS HANDLED
      #
      ungdomshuset = Location.where(:name => "Ungdomshuset").first
      @event.location_id = ungdomshuset.id if !ungdomshuset.nil?


      saved = @event.save
      notice = I18n.t('events.event_created', link: url_for(@event), name: @event.name)
    end

    respond_to do |format|
      if saved
        format.html { redirect_to root_path, notice: notice }
        format.json { render action: 'show', status: :created, location: @event }
      elsif @event_series.present?
        format.html { render template: 'event_series/new' }
        format.json { render json: @event_series.errors, status: :unprocessable_entity }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(user_params)
        destroy_image?
        format.html {
          redirect_to root_path, notice: I18n.t('events.event_updated', link: url_for(@event), name: @event.name)
        }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: I18n.t('events.event_deleted') }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_presenter
    @event_presenter = EventPresenter.new(@event, view_context)
  end

  def authorised_user?
    unless current_user.can_edit? @event
      redirect_to root_path, alert: I18n.t('general.permission_denied')
    end
  end

  # if the obj has a picture but it's not in the new form
  def destroy_image?
    if @event.picture.present? && params[:remove_picture] == '1'
      @event.picture.clear
      @event.save
    end
  end

  def user_params
    (params[:event][:category_ids] || []).uniq!
    params[:event][:event_series][:days] = params[:event_series][:day_array].select(&:present?).join(',') if params[:event_series].present? && params[:event_series][:day_array].present?
    start_time_string = "#{(params[:start_time_yyyy_mm_dd] || []).first} #{(params[:start_time_hh_mm_ss] || []).first}"
    end_time_string = "#{(params[:end_time_yyyy_mm_dd] || []).first} #{(params[:end_time_hh_mm_ss] || []).first}"
    if /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/.match(start_time_string)
      start_time_string= start_time_string + ":00"
    end
    if /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/.match(start_time_string)
      params[:event][:start_time] = DateTime.strptime(start_time_string, "%Y-%m-%d %H:%M:%S")
    end
    if /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/.match(end_time_string)
      end_time_string= end_time_string + ":00"
    end
    if /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/.match(end_time_string)
      params[:event][:end_time] = DateTime.strptime(end_time_string, "%Y-%m-%d %H:%M:%S")
    end
    params[:event].delete(:featured) unless current_user.is_admin? # only admins can update featured value
    params.require(:event).permit(:title, :short_description, :long_description,
                                 :start_time, :end_time,  :location_id, :comments_enabled,
                                 :price, :cancelled, :link, :picture, :featured, :published,
                                 # TODO event_series fix start_time?
                                 category_ids: [], event_series: [[:rule, :start_date, 
                                 :start_time, :expiry, :end_time, day_array: []]])
  end
end
