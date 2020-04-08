class OutAssignmentsController < ApplicationController
before_action :set_load_out, only: [:create]
before_action :set_out_assignment, only: [:edit, :update, :destroy]

  def new
    @out_assignment = OutAssignment.new
  end

  def create
    @out_assignment = OutAssignment.new(strong_params)
    @out_assignment.load_out = @load_out
    @packers = Packer.pluck(:packer_nr).uniq.sort
    respond_to do |format|
      if @out_assignment.save
        @out_assignment.set_reference
        @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
        @load_out.save
        format.html { redirect_to dashboard_index_path, success: 'Assignment was successfully created.' }
        format.js
      else
        format.html { redirect_to dashboard_index_path, alert: @in_assignment.errors}
        format.js { render :action => 'new' }
      end
    end
  end

  def edit
  end

  def update
    @out_assignment.update_attributes(strong_params)
    @load_out = LoadOut.find(@out_assignment.load_out_id)
    @packers = Packer.pluck(:packer_nr).uniq.sort
    respond_to do |format|
      if @out_assignment.save
        @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
        @load_out.save
        @assignment = Assignment.find_by(out_assignment_id: @out_assignment)
        if @assignment.present?
          if update_in_assignment(@assignment)
            flash[:notice] = "Assignment In and Assignment Out were successfully updated."
            format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully updated.' }
            format.js
          else
            format.html { render action: "update", :alert => "There were errors in updating the Assignment " }
            format.js { render :action => 'edit'}
          end
        else
          flash[:notice] = "Assignment In was successfully updated."
          format.html { redirect_to dashboard_index_path, notice: 'Assignment In was successfully updated.' }
          format.js
        end
      else
        format.html { render action: "update" }
        format.js { render :action => 'edit' }
      end
    end
  end

  def update_in_assignment(assignment)
    @in_assignment = InAssignment.find(assignment.in_assignment_id)
    @in_assignment.update_attributes(packer: params[:out_assignment][:packer],
                                     lot_nr: params[:out_assignment][:lot_nr],
                                     recipient_id: params[:out_assignment][:recipient_id],
                                     other_ref: params[:out_assignment][:other_ref],
                                     incoming_order_ref: params[:out_assignment][:incoming_order_ref],
                                     incoming_transport_ref: params[:out_assignment][:incoming_transport_ref],
                                     number_of_boxe: params[:out_assignment][:number_of_boxe],
                                     number_of_pallet: params[:out_assignment][:number_of_pallet],
                                     net_weight: params[:out_assignment][:net_weight])
     @load_in = LoadIn.find(@in_assignment.load_in_id)
     @load_in.total_weight = @load_in.in_assignments.sum(:net_weight)
      @load_in.save!
  end

  def destroy
    @out_assignment = OutAssignment.find(params[:id])
    @load_out = LoadOut.find(@out_assignment.load_out_id)
    @out_assignment.destroy
    respond_to do |format|
    if @out_assignment.destroy!
      @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
      @load_out.save!
      format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully deleted.'  }
      format.js
    else
        format.html { render action: "new" }
        format.js { render action: "new" }
      end
    end
  end

  private
  def strong_params
    params.require(:out_assignment).permit(:order_index,:packer, :lot_nr, :incoming_order_ref, :incoming_transport_ref, :other_ref, :number_of_boxe, :number_of_pallet, :net_weight,:cost, :div_cost, :load_out_id, :recipient_id, :note)
  end

  def set_out_assignment
    @out_assignment = OutAssignment.find(params[:id])
  end

  def set_load_out
    @load_out = LoadOut.find(params[:out_assignment][:load_out_id])
  end

end

