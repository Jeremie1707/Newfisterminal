class DashboardController < ApplicationController
  DEFAULT_ROWS_PER_PAGE = 5
  DEFAULT_SORT = 'id ASC'

  def index
    @page = 1
    session[:page] = @page
    set_rows_per_page
    session[:search] = nil
    @sort = DEFAULT_SORT
    session[:sort] = DEFAULT_SORT
    get_load_ins
  end

  def get_load_ins
    p 'search'
    p session[:search]
    p 'query'
    p params[:query]
    p 'sort'
    p @sort
    @index = (@page - 1) * @rows_per_page
    if session[:search].blank? && params[:query].blank?
      p 'hello 1'
      @load_ins_all = LoadIn.all.order(@sort)
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
    elsif !params[:query].blank?
      p 'hello 2'
      @load_ins_all = LoadIn.order(@sort).global_search(params[:query])
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
      session[:search] = params[:query]
    else #Serarch term present in session
      p 'hello 3'
      @load_ins_all = LoadIn.order(@sort).global_search(session[:search])
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
    end
    @total_load_ins = @load_ins_all.size
    @total_pages = (@total_load_ins / @rows_per_page)
    @search = session[:search]
    p 'first loadin'
    p @load_ins[0]
  end

  def set_sort
    @page = 1
    @sort = params[:sort]
    session[:sort] = @sort
    set_rows_per_page
    get_load_ins
  end

  def set_page
    @sort = session[:sort]
    set_rows_per_page
    @page = params[:page].to_i || 1
    session[:page] = @page
    get_load_ins


  end

  def set_rows
    @sort = session[:sort]
    @rows_per_page = params[:loadin_rows].to_i || 1
    session[:rows_per_page] = @rows_per_page
    @page = params[:page].to_i || 1
    session[:page] = @page
    get_load_ins

  end

  def set_rows_per_page
    if session[:rows_per_page]
      @rows_per_page = session[:rows_per_page]
    else
      @rows_per_page = DEFAULT_ROWS_PER_PAGE
      session[:rows_per_page] = @rows_per_page
    end
  end

  def search
    # ESSAYER DE MEMORISE LES LOADINS DANS LA SESSION (commencé ligne)
    @sort = session[:sort]
    @rows_per_page = session[:rows_per_page]
    session[:search] = nil
    @page = 1
    @search = params[:query]
    @session_search = session[:search]
    get_load_ins
  end

def get_load_ins2
    @load_ins_all = LoadIn.order(:id).limit(@rows_per_page).offset((@page - 1) * @rows_per_page)
    @total_load_ins = LoadIn.count
    @total_pages = (@total_load_ins / @rows_per_page)
    @load_ins = session[:loadins]
  end


  # def index
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: }
  #   end
  # end
end




 # def search
 #    @page = 1
 #    @rows_per_page = session[:rows_per_page]
 #    @index = (@page - 1) * @rows_per_page
 #    if params[:query] == ''
 #      @load_ins = LoadIn.order(:id).limit(@rows_per_page).offset((@page - 1) * @rows_per_page)
 #      @total_load_ins = LoadIn.count
 #    else
 #      @load_ins_all = LoadIn.global_search(params[:query])
 #      @load_ins = @load_ins_all[@index..@index + @rows_per_page]
 #      @total_load_ins = @load_ins_all.count
 #      # @load_ins = LoadIn.global_search(params[:query]).limit(@rows_per_page).offset((@page - 1) * @rows_per_page)
 #    end
 #    @total_pages = (@total_load_ins / @rows_per_page)
 #  end
