Rails.application.routes.draw do
#Devise
   root to: "home#index"
  # Routes for the Follow requests join table resource:

  # CREATE
  post("/insert_follow_requests_join_table", { :controller => "follow_requests_join_tables", :action => "create" })
          
  # READ
  get("/follow_requests_join_tables", { :controller => "follow_requests_join_tables", :action => "index" })
  
  get("/follow_requests_join_tables/:path_id", { :controller => "follow_requests_join_tables", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_requests_join_table/:path_id", { :controller => "follow_requests_join_tables", :action => "update" })
  
  # DELETE
  get("/delete_follow_requests_join_table/:path_id", { :controller => "follow_requests_join_tables", :action => "destroy" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite thing resource:

  # CREATE
  post("/insert_favorite_thing", { :controller => "favorite_things", :action => "create" })
          
  # READ
  get("/favorite_things", { :controller => "favorite_things", :action => "index" })
  
  get("/favorite_things/:path_id", { :controller => "favorite_things", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite_thing/:path_id", { :controller => "favorite_things", :action => "update" })
  
  # DELETE
  get("/delete_favorite_thing/:path_id", { :controller => "favorite_things", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
