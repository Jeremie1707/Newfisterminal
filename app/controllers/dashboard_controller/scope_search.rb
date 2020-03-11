class DashboardController
  class ScopeSearch

    attr_accessor  :page, :sort, :rows_per_page, :load_ins, :total_pages, :query

    def initialize(parameters = {}, session = {})
      @page = parameters[:page] || 1
      @rows_per_page = parameters[:loadin_rows] || 5
      @sort = parameters [:sort] || 'id DESC'
      @query = parameters[:query] || ''
      @session_search = session[:search] || ''
      @scope = parameters[:scope] || LoadIn.all.order(@sort)

      get_load_ins
      @load_ins

    end

    private
    def get_load_ins
        @index = (@page.to_i - 1) * @rows_per_page.to_i
        if @session_search.blank? && @query.blank?
          @load_ins = @scope[@index..@index + @rows_per_page.to_i - 1]
        elsif !@query.blank?
          @scope = LoadIn.order(@sort).global_search(@query)
          @load_ins = @scope[@index..@index + @rows_per_page.to_i - 1]
          @session_search = @query
        else #Serarch term present in session
          @load_ins = @load_ins_all[@index..@index + @rows_per_page.to_i - 1]
        end
        @total_load_ins = @scope.size
        @total_pages = (@total_load_ins.to_f / @rows_per_page.to_f).ceil
        @search = @session_search
    end
  end
end
