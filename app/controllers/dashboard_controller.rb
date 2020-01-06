  class DashboardController < ApplicationController
  DEFAULT_ROWS_PER_PAGE = 5
  DEFAULT_SORT = 'id DESC'

  def index
    @load_in = LoadIn.new
    @in_assignment = InAssignment.new
    @page = 1
    session[:page] = @page
    set_rows_per_page
    session[:search] = nil
    @sort = DEFAULT_SORT
    session[:sort] = DEFAULT_SORT
    @packers = Packer.pluck(:packer_nr).uniq.sort
    get_load_ins

  end

  def get_load_ins
    @index = (@page - 1) * @rows_per_page
    if session[:search].blank? && params[:query].blank?
      @load_ins_all = LoadIn.all.order(@sort)
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
    elsif !params[:query].blank?
      @load_ins_all = LoadIn.order(@sort).global_search(params[:query])
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
      session[:search] = params[:query]
    else #Serarch term present in session
      @load_ins_all = LoadIn.order(@sort).global_search(session[:search])
      @load_ins = @load_ins_all[@index..@index + @rows_per_page - 1]
    end
    @total_load_ins = @load_ins_all.size
    @total_pages = (@total_load_ins.to_f / @rows_per_page.to_f).ceil
    p @total_load_ins
    p @rows_per_page
    p @total_pages
    @search = session[:search]
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

  def set_modal
    @load_in = LoadIn.find(params[:load_in])
    @in_assignment = InAssignment.new
  end

  def create_modal_in_assignment
    @in_assignment = InAssignment.new(in_assignment_params)
    @load_in = LoadIn.find(params[:load_in])
  end

  def edit_modal_in_assignment
    @in_assignment = InAssignment.find(params[:id])
  end

private

def in_assignment_params
  params.permit(:packer, :lot_nr, :incoming_order_ref, :other_ref, :boxe_number, :pallet_number, :load_in_id)
end

end
