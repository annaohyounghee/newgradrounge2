class ResearchesController < ApplicationController
	def new
    @profile = Profile.find(params[:profile_id])
    @research = @profile.researches.build
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @research = @profile.researches.create(params[:research].permit(:description))
    @research.save
    
    respond_to do |format|
      if @research.save
        format.html { redirect_to edit_profile_path(@profile), notice: 'Research was successfully created.'}
      else
        format.js { render action: "new" }
      end
    end
  end

  def edit
    @profile = Profile.find(params[:profile_id])
    @research = @profile.researches.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @research = @profile.researches.find(params[:id])

    respond_to do |format|
      if @research.update(params[:research].permit(:description))
        format.html { redirect_to edit_profile_path(@profile), notice: 'Research section was successfully updated.'}
      else
        format.js { render action: "edit" }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    @research = @profile.researches.find(params[:id])
    @research.destroy
    redirect_to edit_profile_path(@profile), notice: 'Research was successfully deleted.'
  end
end
