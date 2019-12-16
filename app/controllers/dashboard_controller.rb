class DashboardController < ApplicationController
  DEFAULT_ROWS_PER_PAGE = 5

  def index
    puts'index'
    puts params[:query].present?
    @page = 1
    if params[:query].present?
      search
    else
    set_rows_per_page
    get_load_ins
    end
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

  def search
    puts 'hello'
    @page = 1
    @rows_per_page = session[:rows_per_page]
    @index = (@page - 1) * @rows_per_page
    if params[:query] == ''
      @load_ins = LoadIn.order(:id).limit(@rows_per_page).offset((@page - 1) * @rows_per_page)
      @total_load_ins = LoadIn.count
    else
      @load_ins_all = LoadIn.global_search(params[:query])
      @load_ins = @load_ins_all[@index..@index + @rows_per_page]
      @total_load_ins = @load_ins_all.count
      # @load_ins = LoadIn.global_search(params[:query]).limit(@rows_per_page).offset((@page - 1) * @rows_per_page)
    end
    @total_pages = (@total_load_ins / @rows_per_page)
  end

  def search2
    @rows_per_page = session[:rows_per_page]
    @load_ins = LoadIn.global_search(params[:query]).limit(@rows_per_page).offset((@page - 1) * @rows_per_page)
    @total_load_ins = @load_ins.count
    @total_pages = (@total_load_ins / @rows_per_page)

  end


  # def index
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: }
  #   end
  # end
end
