class DashboardController
  class ScopeSearch

    attr_accessor  :page, :sort, :rows_per_page, :total_pages,:total_loads,:loads, :query

    def initialize(parameters = {})
      @page = parameters[:page] || 1
      @rows_per_page = parameters[:loadin_rows] || 5
      @sort = parameters [:sort] || 'id DESC'
      @query = parameters[:query] || ''
      # @scope = parameters[:scope] || LoadIn.all.order(@sort)

    end

    def get_load
      pagination
        if @query.blank?
          @loads = scope[@range_index]
        else !@query.blank?
          @scope = query_scope
          @loads = scope[@range_index]
        end
        @total_loads = scope.size
        @total_pages = (@total_loads.to_f / @rows_per_page.to_f).ceil
        @loads
    end

    private

    def scope
      self.class.scope
    end

    def query_scope
      self.class.query_scope
    end



    def pagination
      page = @page.to_i
      rows_per_page = @rows_per_page.to_i
      @index = (page - 1) * rows_per_page
      @range_index = @index..@index + rows_per_page - 1
    end
  end
end
