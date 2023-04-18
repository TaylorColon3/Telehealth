Rails.application.routes.draw do
  # Routes for the Health condition resource:

  # CREATE
  post("/insert_health_condition", { :controller => "health_conditions", :action => "create" })
          
  # READ
  get("/health_conditions", { :controller => "health_conditions", :action => "index" })
  
  get("/health_conditions/:path_id", { :controller => "health_conditions", :action => "show" })
  
  # UPDATE
  
  post("/modify_health_condition/:path_id", { :controller => "health_conditions", :action => "update" })
  
  # DELETE
  get("/delete_health_condition/:path_id", { :controller => "health_conditions", :action => "destroy" })

  #------------------------------

  # Routes for the Vital resource:

  # CREATE
  post("/insert_vital", { :controller => "vitals", :action => "create" })
          
  # READ
  get("/vitals", { :controller => "vitals", :action => "index" })
  
  get("/vitals/:path_id", { :controller => "vitals", :action => "show" })
  
  # UPDATE
  
  post("/modify_vital/:path_id", { :controller => "vitals", :action => "update" })
  
  # DELETE
  get("/delete_vital/:path_id", { :controller => "vitals", :action => "destroy" })

  #------------------------------

  # Routes for the Medical inquiry resource:

  # CREATE
  get("/", { :controller => "medical_inquiries", :action => "index" })
  post("/insert_medical_inquiry", { :controller => "medical_inquiries", :action => "create" })
          
  # READ
  get("/medical_inquiries", { :controller => "medical_inquiries", :action => "index" })
  
  get("/medical_inquiries/:path_id", { :controller => "medical_inquiries", :action => "show" })
  
  # UPDATE
  
  post("/modify_medical_inquiry/:path_id", { :controller => "medical_inquiries", :action => "update" })
  
  # DELETE
  get("/delete_medical_inquiry/:path_id", { :controller => "medical_inquiries", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  class ApplicationController < ActionController::Base
    def index
      render file: 'app/views/index.html'
    end
  end
end
