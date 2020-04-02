class LoadInsController < ApplicationController

  def show
    @load_in = LoadIn.find(params[:id])
    respond_to do |format|
     # format.html
      format.pdf do
        render pdf: "load_ins",
              header: { right: '[page] of [topage]' },  # Excluding ".pdf" extension.
              template: 'load_ins/show.html.erb',
              layout: 'in_pdf',
              orientation: 'Landscape',
              dpi: 75,

               margin:  {   top: 5,                     # default 10 (mm)
                            bottom: 0,
                            left: 0,
                            right: 0 }

      end
    end
  end


  def new
    puts "starts loadins controller"
    @load_in = LoadIn.new
  end

  def create
    @packers = Packer.pluck(:packer_nr).uniq.sort
    @load_in = LoadIn.new(strong_params)
    flash[:error_load_in] = []
    respond_to do |format|
      if @load_in.save
        @load_in.set_reference
        @in_assignment = InAssignment.find_by(id: @load_in.in_assignments.first.id)
        @in_assignment.set_reference
        if @load_in.type_of_service == "TRUCK TO TRUCK" || @load_in.type_of_service == "TRUCK TERMINAL TRUCK"
          if create_load_out_and_out_assignment(params)
            flash[:notice] = "Load In and Load Out were successfully created."
          format.html { redirect_to dashboard_index_path}
          format.js {render js: "window.location='#{dashboard_index_path}'"}
          else
            flash[:error_load_in]
            format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the LoadOut. " }
            format.js
          end
        else
          flash[:notice] = "Load In was successfully created."
          format.html { redirect_to dashboard_index_path, notice: 'Load In was successfully created.' }
          format.js {render js: "window.location='#{dashboard_index_path}'"}
        end
      else
        p "hello error"
        flash[:error_load_in] << @load_in.errors
        format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the Load In. " }
        format.js
      end
    end
  end


  def create_load_out_and_out_assignment(params = {})
    LoadOut.transaction do
      @load_out = LoadOut.new(t1_customer_id: params[:load_in][:t1_customer_id], type_of_service: params[:load_in][:type_of_service],note: params[:load_in][:note])
      @load_out.save

      @out_assignment = OutAssignment.new(load_out_id: @load_out.id, lot_nr: params[:load_in][:in_assignments_attributes][0][:lot_nr], recipient_id: params[:load_in][:in_assignments_attributes][0][:recipient_id], other_ref: params[:load_in][:in_assignments_attributes][0][:other_ref],packer: params[:load_in][:in_assignments_attributes][0][:packer])
       @out_assignment.save

      @assignment = Assignment.new(in_assignment_id: @load_in.in_assignment_ids.first, out_assignment_id: @out_assignment.id)
       @assignment.save

       if @load_out && @out_assignment && @assignment
        @load_out.set_reference
        @out_assignment.set_reference
        return true
        else
          flash[:error_load_in] << @assignment.errors << @out_assignment.errors << @load_out.errors
           raise ActiveRecord::Rollback
        end
    end
  end

  def edit
    @load_in = LoadIn.find(params[:id])
      respond_to do |format|
        format.js
      end
  end

  def update
    @load_in = LoadIn.find(params[:id])
    @load_in.update_attributes(strong_params)
    respond_to do |format|
      if @load_in.save
        format.html { redirect_to dashboard_index_path, success: 'Load In was successfully updated.' }
        format.js
      else
        format.html { render action: "update" }
      end
    end
  end

  def destroy
    @load_in = LoadIn.find(params[:id])
    @load_in.destroy
    respond_to do |format|
    if @load_in.destroy!
      format.html { redirect_to dashboard_index_path, success: 'Load In was successfully deleted.' }
    else
        format.html { render action: "new" }
      end
    end
  end

  private

  def strong_params
    params.require(:load_in).permit(
    :t1_customer_id, :status, :arrival_date, :truck_nr, :trailer_nr, :type_of_service,:note, :in_assignments_attributes => [ :packer, :lot_nr, :incoming_order_ref, :other_ref]
  )
  end

end

