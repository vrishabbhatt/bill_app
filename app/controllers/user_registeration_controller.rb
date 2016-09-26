class UserRegisterationController <  Devise::RegistrationsController
	def new
	    build_resource({})
	    yield resource if block_given?
	     unless params[:bill_id].blank?
	    	@bill_id = params[:bill_id].to_s.to_i
	    	puts "++++++++++++++++"
	    	puts @bill_id
	    end
	    respond_with resource
	  
  	end

	def create
	    build_resource(sign_up_params)

	    resource.save
	    puts "-------------------$%_______"
	    puts resource.id
	    if params[:bill_id].blank?
	    else
	    	@bill_id = params[:bill_id].to_s.to_i
	    	puts "++++++++++++++++-----------------=================----------------"
	    	puts @bill_id
	    	bill = Bill.find(@bill_id)
	    	bill.update(primary_user_id: resource.id)
	    	bill.generate_role_for_primary_user(resource.id)
	    	puts bill.bill_roles.last.user_id
	    end
	    yield resource if block_given?
	    if resource.persisted?
	      if resource.active_for_authentication?
	        # set_flash_message! :notice, :signed_up
	        sign_up(resource_name, resource)
	        respond_with resource, location: after_sign_up_path_for(resource)
	      else
	        # set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
	        expire_data_after_sign_in!
	        respond_with resource, location: after_inactive_sign_up_path_for(resource)
	      end
	    else
	      clean_up_passwords resource
	      set_minimum_password_length
	      respond_with resource
	    end
  	end
end
