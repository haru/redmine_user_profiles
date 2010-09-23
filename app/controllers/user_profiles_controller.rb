class UserProfilesController < ApplicationController
  unloadable



  def preview
    @text = params[:user][:profile]
    render :partial => 'common/preview'
  end

end
