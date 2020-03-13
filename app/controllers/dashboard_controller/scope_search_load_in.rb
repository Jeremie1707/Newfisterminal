class DashboardController

  class ScopeSearchLoadIn < ScopeSearch
    attr_reader :load_ins, :total_load_ins

    def initialize(parameters = {})
      super(parameters)
      @scope = parameters[:scope] || LoadIn.all.order(@sort)
    end

    def scope
      @scope
    end

    def query_scope
     LoadIn.order(@sort).global_search(@query)
    end

    def get_load
      super
      @total_load_ins =  @total_loads
      @total_pages = (@total_loads.to_f / @rows_per_page.to_f).ceil
      @load_ins =  @loads
    end
  end
end
