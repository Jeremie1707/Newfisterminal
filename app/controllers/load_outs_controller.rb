class LoadOutsController < ApplicationController

  def new
    puts "starts loadins controller"
    @load_out = LoadOut.new
  end

  def show
    @load_out = LoadOut.find(params[:id])
    respond_to do |format|
     # format.html
      format.pdf do
        render pdf: "load_outs",
              header: {
                        html:{ template: 'load_outs/header.html.erb',
                              layout:'out_pdf',
                              orientation: 'Landscape',
                              dpi: 75,
                              margin:  {   top: 0,                     # default 10 (mm)
                                            bottom: 0,
                                            left: 0,
                                            right: 0 },
                              }
                              },
              footer: {right: '[page] of [topage]'}, # Excluding ".pdf" extension.
              template: 'load_outs/show.html.erb',
              layout: 'out_pdf',
              orientation: 'Landscape',
              dpi: 75,

               margin:  {   top: 40,                     # default 10 (mm)
                            bottom: 5,
                            left: 0,
                            right: 0 }

      end
    end
  end

  def create
    @packers = Packer.pluck(:packer_nr).uniq.sort
    @load_out = LoadOut.new(strong_params)
    flash[:load_out_error] = []
    respond_to do |format|
      if @load_out.save
       @load_out.set_reference
       @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
       @load_out.save
       @out_assignment = OutAssignment.find_by(id: @load_out.out_assignments.first.id)
       @out_assignment.set_reference
        flash[:notice] = "Load Out was successfully created."
        format.html { redirect_to dashboard_index_path, notice: 'Load Out was successfully created.' }
        format.js {render js: "window.location='#{dashboard_index_path}'"}
      else
        flash[:notice] = "There were errors in creating the Load Out."
        flash[:load_out_error] << @load_out.errors
        format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the LoadOut. " }
        format.json { render json: @load_out.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    @load_out = LoadOut.find(params[:id])
      respond_to do |format|
        format.js
      end
  end

  def update
    @load_out = LoadOut.find(params[:id])
    @load_out.update_attributes(strong_params)
    respond_to do |format|
      if @load_out.save
        format.html { redirect_to dashboard_index_path, success: 'Load Out was successfully updated.' }
        format.js
      else
        format.html { render action: "update" }
        format.json { render json: @load_out.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @load_out = LoadOut.find(params[:id])
    @load_out.destroy
    respond_to do |format|
    if @load_out.destroy!
      format.html { redirect_to dashboard_index_path, success: 'Load Out was successfully deleted.' }
    else
        format.html { render action: "new" }
        format.json { render json: @load_out.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def strong_params
    params.require(:load_out).permit(
    :t1_customer_id, :status, :departure_date, :truck_nr, :trailer_nr, :type_of_service,:note, :trip_ref, :out_assignments_attributes => [ :packer, :lot_nr,:number_of_boxe,:number_of_pallet,:net_weight, :incoming_order_ref, :other_ref,:cost, :div_cost]
  )
  end

end


