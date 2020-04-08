class InAssignmentsController < ApplicationController
before_action :set_load_in, only: [:create]
before_action :set_in_assignment, only: [:edit, :update, :destroy]

  def new
    @in_assignment = InAssignment.new
  end

  def create
    @in_assignment = InAssignment.new(strong_params)
    @in_assignment.load_in = @load_in
    @packers = Packer.pluck(:packer_nr).uniq.sort
    respond_to do |format|
      if @in_assignment.save
        @in_assignment.set_reference
        @load_in.total_weight = @load_in.in_assignments.sum(:net_weight)
        @load_in.save
        format.html { redirect_to dashboard_index_path, success: 'Assignment was successfully created.' }
        format.js

      else
        format.html { redirect_to dashboard_index_path, alert: @in_assignment.errors}
        format.json { render json: @in_assignment.errors, status: :unprocessable_entity }
        format.js { render :action => 'new' }
      end
    end
  end

  def edit
  end

  def update
    @in_assignment.update_attributes(strong_params)
    @load_in = LoadIn.find(@in_assignment.load_in_id)
    @packers = Packer.pluck(:packer_nr).uniq.sort
    respond_to do |format|
      if @in_assignment.save
        @load_in.total_weight = @load_in.in_assignments.sum(:net_weight)
        @load_in.save
        @assignment = Assignment.find_by(in_assignment_id: @in_assignment)
        if @assignment.present?
          if update_out_assignment(@assignment)
            flash[:notice] = "Assignment In and Assignment Out were successfully updated."
            format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully updated.' }
            format.js
        # format.json { render json: @in_assignment, status: :updated, location: @in_assignment }
          else
            format.html { render action: "update", :alert => "There were errors in updating the Assignment " }
            format.js { render :action => 'edit' }
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

  def update_out_assignment(assignment)
    @out_assignment = OutAssignment.find(assignment.out_assignment_id)
    @out_assignment.update_attributes(packer: params[:in_assignment][:packer],
                                      lot_nr: params[:in_assignment][:lot_nr],
                                      recipient_id: params[:in_assignment][:recipient_id],
                                      other_ref: params[:in_assignment][:other_ref],
                                      incoming_order_ref: params[:in_assignment][:incoming_order_ref],
                                      incoming_transport_ref: params[:in_assignment][:incoming_transport_ref],
                                      number_of_boxe: params[:in_assignment][:number_of_boxe],
                                      number_of_pallet: params[:in_assignment][:number_of_pallet],
                                      net_weight: params[:in_assignment][:net_weight])
    @load_out = LoadOut.find(@out_assignment.load_out_id)
    @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
    @load_out.save!
  end

  def destroy
    @in_assignment = InAssignment.find(params[:id])
    @load_in = LoadIn.find(@in_assignment.load_in_id)
    @in_assignment.destroy
    respond_to do |format|
    if @in_assignment.destroy!
      @load_in.total_weight = @load_in.in_assignments.sum(:net_weight)
      @load_in.save!
      format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully deleted.'  }
      format.js
    else
        format.html { render action: "new" }
        format.js { render :action => 'new' }
      end
    end
  end

  private
  def strong_params
    params.require(:in_assignment).permit(:order_index, :packer, :lot_nr, :recipient_id, :note, :incoming_order_ref, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet, :net_weight, :load_in_id)
  end

  def set_in_assignment
    @in_assignment = InAssignment.find(params[:id])
  end

  def set_load_in
    @load_in = LoadIn.find(params[:in_assignment][:load_in_id])
  end
end
