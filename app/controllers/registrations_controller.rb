
class RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
      "/reachouts"
    end

    # Override Device create action :
    # Add the profile creation step 
    # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb
    def create
	    @profile = Profile.new
	    @award = Award.new
	    
	    build_resource(sign_up_params)
	    resource.save
	    yield resource if block_given?
	    if resource.persisted?
	      if resource.active_for_authentication?
	        set_flash_message! :info, :signed_up
	        sign_up(resource_name, resource)
	        respond_with resource, location: after_sign_up_path_for(resource)
	      else
	        set_flash_message! :info, :"signed_up_but_#{resource.inactive_message}"
	        expire_data_after_sign_in!
	        respond_with resource, location: after_inactive_sign_up_path_for(resource)
	      end
	      @profile.user = resource
	      @profile.save
	      
	      @award.profile_id = @profile.id
	      @award.title = "Early adopter"
	      @award.image = "http://res.cloudinary.com/darri/image/upload/v1517261007/medal_bronze_32_ofplbx.png"
	      @award.save
	    else
	      clean_up_passwords resource
	      set_minimum_password_length
	      respond_with resource
	    end
	  	end

    private

	def sign_up_params
		params.require(:user).permit(:email, :password, :position, :avatar)
	end

	def account_update_params
		params.require(:user).permit(:email, :password, :current_password, :avatar)
	end

end
