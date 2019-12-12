class DashboardController < ApplicationController
  before_action :set_page, only: [:index]
  ROWS_PER_PAGE = 10

  def index
    @load_ins = LoadIn.order(:id).limit(ROWS_PER_PAGE).offset(@page * ROWS_PER_PAGE)
    @total_load_ins = LoadIn.count
    @total_pages = 10 - 1
  end

  private

  def set_page
    @page = params[:page].to_i || 0
  end

  def set_rows_per_page
    @rows_per_page = params[:rows]
  end

  # def index
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: }
  #   end
  # end
end
