class EventsController < ApplicationController

    before_action :find_event, only: [:show, :destroy, :update]

    def index
        @events = Event.all
        render json: @events
    end

    def show
        render json: @event
    end

    def create
        @event = Event.create(event_params)
        # if event.valid?
        #     session[:event_id] = event.id
        #     redirect_to event_path(event)
        # else
        #     flash[:errors] = event.errors.full_messages
        #     redirect_to new_event_path
        # end
        render json: @event
    end

    def new
        @event = Event.new
        render json: @event
    end

    def destroy
        @event.destroy
        render json: @events
    end

    def update
        @event.update(event_params)
        render json: @event
    end
    private

    def event_params
        params.require(:event).permit!
        # (:name, :event_type, :image_url, :date, :time, :event_url, :ticket, :favorite)
    end

    def find_event
        @event = Event.find(params[:id])
    end


end
