class LotoSevensController < ApplicationController
  def index
    @events = LotoEvent.loto_seven
                       .preload(:loto_seven_numbers)
                       .lottery_date_order
                       .page(params[:page])
                       .per(10)
  end
end
