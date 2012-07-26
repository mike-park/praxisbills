class ApiController < ApplicationController

  skip_before_filter :require_user

  # API access
  def last_auth
    if (last_created_auth = Auth.unscoped.where(:patient_id => params[:id]).order('auths.created_at DESC').first)
      insurer_id = last_created_auth.insurer_id
    end

    if (last_date_auth = Auth.unscoped.where(:patient_id => params[:id]).order('auths.last_date DESC').first)
      last_date_hint = last_date_auth.last_date ? "Last billed date #{last_date_auth.last_date.to_s(:de)}" : ""
    end
    respond_to do |format|
      format.js { render :json => { insurer_id: insurer_id, last_date_hint: last_date_hint } }
    end
  end

end
