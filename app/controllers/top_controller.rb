class TopController < ApplicationController
  def index
    @events = LotoSixEvent.preload(:loto_six_numbers)
                   .lottery_date_order
                   .page(params[:page])
                   .per(10)
  end
end
