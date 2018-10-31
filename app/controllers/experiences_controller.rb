class ExperiencesController < ApplicationController

  def new
    @profile = Profile.find(params[:profile_id])
    @experience = @profile.experiences.build
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @experience = @profile.experiences.create(params[:experience].permit(:title, :company, :location, :description, :from_date, :to_date))
    @experience.save

    respond_to do |format|
      if @experience.save
        format.html { redirect_to edit_profile_path(@profile), notice: 'Experience was successfully created.'}
      else
        format.js { render action: "new" }
      end
    end

  end

  def edit
    @profile = Profile.find(params[:profile_id])
    @experience = @profile.experiences.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @experience = @profile.experiences.find(params[:id])

    respond_to do |format|
      if @experience.update(params[:experience].permit(:title, :company, :location, :description, :from_date, :to_date))
        format.html { redirect_to edit_profile_path(@profile), notice: 'Experiences section was successfully updated.'}
      else
        format.js { render action: "edit" }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    @experience = @profile.experiences.find(params[:id])
    @experience.destroy
    redirect_to edit_profile_path(@profile), notice: 'Experience was successfully deleted.'
  end

end
