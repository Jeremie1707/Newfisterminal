class DashboardController

  class ScopeSearchLoadOut < ScopeSearch
    attr_reader :load_outs, :total_load_outs

    def initialize(parameters = {})
      super(parameters)
      @scope = parameters[:scope] || LoadOut.all.order(@sort)
    end

    def scope
      @scope
    end

    def query_scope
     LoadOut.order(@sort).global_search(@query)
    end

    def get_load
      super
      @total_load_outs =  @total_loads
      @total_pages = (@total_loads.to_f / @rows_per_page.to_f).ceil
      @load_outs =  @loads
    end
  end
end
