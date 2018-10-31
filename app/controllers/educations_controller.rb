class EducationsController < ApplicationController

  def new
    @profile = Profile.find(params[:profile_id])
    @education = @profile.educations.build
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @education = @profile.educations.create(params[:education].permit(:school, :degree, :field_of_study, :grade, :description, :from_date, :to_date))
    @education.save

    respond_to do |format|
      if @education.save
        format.html { redirect_to edit_profile_path(@profile), notice: 'Education was successfully created.'}
      else
        format.js { render action: "new" }
      end
    end
  end

  def edit
    @profile = Profile.find(params[:profile_id])
    @education = @profile.educations.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @education = @profile.educations.find(params[:id])
    respond_to do |format|
      if @education.update(params[:education].permit(:school, :degree, :field_of_study, :grade, :description, :from_date, :to_date))
        format.html { redirect_to edit_profile_path(@profile), notice: 'Education section was successfully updated.'}
      else
        format.js { render action: "edit" }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    @education = @profile.educations.find(params[:id])
    @education.destroy
    redirect_to edit_profile_path(@profile), notice: 'Education was successfully deleted.'
  end

end
