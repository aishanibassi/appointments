Rails.application.routes.draw do
  # Routes for the Appointment resource:

  # CREATE
  get("/appointments/new", { :controller => "appointments", :action => "new_form" })
  post("/create_appointment", { :controller => "appointments", :action => "create_row" })

  # READ
  get("/appointments", { :controller => "appointments", :action => "index" })
  get("/appointments/:id_to_display", { :controller => "appointments", :action => "show" })

  # UPDATE
  get("/appointments/:prefill_with_id/edit", { :controller => "appointments", :action => "edit_form" })
  post("/update_appointment/:id_to_modify", { :controller => "appointments", :action => "update_row" })

  # DELETE
  get("/delete_appointment/:id_to_remove", { :controller => "appointments", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
