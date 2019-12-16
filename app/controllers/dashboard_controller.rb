class DashboardController < ApplicationController
  DEFAULT_ROWS_PER_PAGE = 5

  def index
    puts'index'
    set_rows_per_page
    @page = 1
    get_load_ins

  end

  def get_load_ins
     puts'get_load_ins'
    @load_ins = LoadIn.order(:id).limit(@rows_per_page).offset((@page - 1) * @rows_per_page)
    @total_load_ins = LoadIn.count
    @total_pages = (@total_load_ins / @rows_per_page)
  end

  def set_page
     puts'set_page'
    set_rows_per_page
    @page = params[:page].to_i || 1
    get_load_ins
  end

  def set_rows
    puts'set_rows'
    @rows_per_page = params[:loadin_rows].to_i || 1
    session[:rows_per_page] = @rows_per_page
    @page = params[:page].to_i || 1
    get_load_ins
  end

  def set_rows_per_page
    puts 'set_rows_per_page'
    if session[:rows_per_page]
      puts session
      @rows_per_page = session[:rows_per_page]
    else
      puts 'else'
      @rows_per_page = DEFAULT_ROWS_PER_PAGE
      session[:rows_per_page] = @rows_per_page
    end
  end


  # def index
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: }
  #   end
  # end
end
