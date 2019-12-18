class DashboardController < ApplicationController
  DEFAULT_ROWS_PER_PAGE = 5

  def index
    @page = 1
    session[:page] = @page
    set_rows_per_page
    session[:search] = nil
    get_load_ins
  end

  def get_load_ins
    @index = (@page - 1) * @rows_per_page
    if session[:search].blank? && params[:query].blank?
      @load_ins_all = LoadIn.all.order(:id)
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
    elsif !params[:query].blank?
      @load_ins_all = LoadIn.global_search(params[:query]).order(:id)
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
      session[:search] = params[:query]
    else #Serarch term present in session
      @load_ins_all = LoadIn.global_search(session[:search]).order(:id)
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
    end
    @total_load_ins = @load_ins_all.count
    @total_pages = (@total_load_ins / @rows_per_page)
    @search = session[:search]
  end

  def set_page
    set_rows_per_page
    @page = params[:page].to_i || 1
    session[:page] = @page
    get_load_ins


  end

  def set_rows
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
