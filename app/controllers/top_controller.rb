class TopController < ApplicationController
  def index
    @events = Event.preload([:winning_numbers, :bonus_number])
                   .lottery_date_order
                   .page(params[:page])
                   .per(10)
  end
end
