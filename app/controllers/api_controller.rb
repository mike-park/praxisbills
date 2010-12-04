class ApiController < ApplicationController

  skip_before_filter :require_user

  # API access
  def last_auth
    @auth = Auth.unscoped.where(:patient_id => params[:id]).order('auths.updated_at DESC').first
    respond_to do |format|
      format.js { render :json => @auth }
    end
  end
  
end
