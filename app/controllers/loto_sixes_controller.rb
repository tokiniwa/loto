class LotoSixesController < ApplicationController
  def index
    @events = LotoEvent.loto_six
                       .preload(:loto_six_numbers)
                       .lottery_date_order
                       .page(params[:page])
                       .per(10)
  end
end
