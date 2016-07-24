ActionController::Routing::Routes.draw do |map|
	map.resources :admins

	map.resources :companies

	map.resources :students

  map.resources :students_registration,:only => [:new,:create,:index]

  map.resources :user_mailer,:only => [:create]

	map.resources :userlogin_sessions

	map.resources :userlogins
	# The priority is based upon order of creation: first created -> highest priority.

	# Sample of regular route:
	#   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
	# Keep in mind you can assign values other than :controller and :action
	# map.connect 'accounts', :controller => 'catalog', :action => 'view'
	# Sample of named route:
	#   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
	# This route can be invoked with purchase_url(:id => product.id)
	
	map.forgot_password 'forgot_password', :controller => 'userlogins', :action => 'forgot_password'
	map.reset_password 'reset_password', :controller => 'userlogins', :action => 'reset_password'
	map.register 'register', :controller => 'userlogins', :action => 'new'
	map.login 'login', :controller => 'userlogin_sessions', :action => 'new'
	map.logout 'logout', :controller => 'userlogin_sessions', :action => 'destroy'

	map.student_registration 'student_registration',:controller => 'students_registration',:action =>'new'

	map.student_home 'student', :controller => 'students', :action => 'show'

	map.admin_home  'admin', :controller => 'admins', :action => 'show'
	map.dept_prog  'dept_progs', :controller => 'admins', :action => 'change_dept_prog'
	map.admin_notice  'AddNotice', :controller => 'admins', :action => 'add_notice'

	map.company_home 'company', :controller => 'companies', :action => 'home'
	map.add_opening  'add_opening', :controller => 'companies', :action => 'add_opening'
	map.view_opening 'view_opening', :controller => 'companies' , :action => 'view_openings'

	#map.applications 'applications' , :controller => 'companies' , :action => 'applications',:conditions => {:method=>:get}
	map.accepted_applications 'pending_applications' , :controller => 'companies' , :action => 'pending_applications'
	map.shortlisted_applications 'shortlisted_applications' , :controller => 'companies' , :action => 'shortlisted_applications'
	map.rejected_applications 'rejected_applications' , :controller => 'companies' , :action => 'rejected_applications'
	map.accepted_applications 'accepted_applications' , :controller => 'companies' , :action => 'accepted_applications'

	map.download_resumes 'download_resumes' , :controller => 'companies' , :action => 'download_resumes'

	map.change_password 'change_password' , :controller => 'companies' , :action => 'change_password'

	map.mail_students 'mail_students' , :controller => 'companies' , :action => 'mail_students'

	map.credits 'credits' , :controller => 'companies' , :action => 'credits'

	map.connect 'eligibility_to_str', :controller => 'companies',:action=>'eligibility_to_str'

  
  # ---- Gaurav ----
  map.connect 'attachments/:class/:ptype/:pid/:uid', :controller => 'attachments', :action => 'show',:conditions => {:method=>:get}
  map.home 'home', :controller => 'home'
  # ---- Gaurav ----
  
  

	# Sample resource route (maps HTTP verbs to controller actions automatically):
	#   map.resources :products

	# Sample resource route with options:
	#   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

	# Sample resource route with sub-resources:
	#   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

	# Sample resource route with more complex sub-resources
	#   map.resources :products do |products|
	#     products.resources :comments
	#     products.resources :sales, :collection => { :recent => :get }
	#   end

	# Sample resource route within a namespace:
	#   map.namespace :admin do |admin|
	#     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
	#     admin.resources :products
	#   end

	# You can have the root of your site routed with map.root -- just remember to delete public/index.html.
	# map.root :controller => "welcome"

	# See how all your routes lay out with "rake routes"

	# Install the default routes as the lowest priority.
	# Note: These default routes make all actions in every controller accessible via GET requests. You should
	# consider removing the them or commenting them out if you're using named routes and resources.
	#map.connect ':controller/:id'
	#map.connect ':controller/:action/:id.:format'
	map.connect '*', :controller => 'userlogin_sessions',:action => 'new'
end

