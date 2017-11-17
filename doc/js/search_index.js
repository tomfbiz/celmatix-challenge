var search_data = {"index":{"searchIndex":["api","cartitemscontroller","orderscontroller","orderbuilder","productscontroller","userscontroller","applicationcontroller","applicationjob","applicationmailer","applicationrecord","cart","cartsproduct","notifiermailer","order","pagescontroller","product","productshelper","user","userscontroller","admin?()","authenticate_user_api!()","build()","create()","create()","create()","destroy()","index()","index()","index()","new()","pretty_number()","save()","show()","welcome()","readme"],"longSearchIndex":["api","api::cartitemscontroller","api::orderscontroller","api::orderscontroller::orderbuilder","api::productscontroller","api::userscontroller","applicationcontroller","applicationjob","applicationmailer","applicationrecord","cart","cartsproduct","notifiermailer","order","pagescontroller","product","productshelper","user","userscontroller","user#admin?()","applicationcontroller#authenticate_user_api!()","api::orderscontroller::orderbuilder#build()","api::cartitemscontroller#create()","api::orderscontroller#create()","api::productscontroller#create()","api::cartitemscontroller#destroy()","api::cartitemscontroller#index()","api::productscontroller#index()","api::userscontroller#index()","api::orderscontroller::orderbuilder::new()","productshelper#pretty_number()","cart#save()","pagescontroller#show()","notifiermailer#welcome()",""],"info":[["API","","API.html","",""],["API::CartItemsController","","API/CartItemsController.html","","<p>Verifies user is authenticated before any actions are run\n"],["API::OrdersController","","API/OrdersController.html","","<p>Verifies user is authenticated before any actions are run\n"],["API::OrdersController::OrderBuilder","","API/OrdersController/OrderBuilder.html","","<p>Plain Old Ruby Object to create an <code>order</code> out of a\n<code>cart</code>\n"],["API::ProductsController","","API/ProductsController.html","","<p>Verifies user is authenticated as admin before the <code>create</code>\nactions is run\n"],["API::UsersController","","API/UsersController.html","","<p>Verifies user is authenticated as admin before the <code>index</code>\naction is run\n"],["ApplicationController","","ApplicationController.html","",""],["ApplicationJob","","ApplicationJob.html","",""],["ApplicationMailer","","ApplicationMailer.html","","<p>sets defaults for child <code>mailer</code> classes.\n"],["ApplicationRecord","","ApplicationRecord.html","","<p>Wroapper record for ActiveRecord\n<p>Other records should inherit from this, so that shared behaviors can …\n"],["Cart","","Cart.html","","<p><code>validates_uniqueness_of :user</code> to ensure that creating a second\ncart will throw an error rather than deleting …\n"],["CartsProduct","","CartsProduct.html","",""],["NotifierMailer","","NotifierMailer.html","",""],["Order","","Order.html","",""],["PagesController","","PagesController.html","","<p>Controller used to render “Static” pages\n"],["Product","","Product.html","",""],["ProductsHelper","","ProductsHelper.html","",""],["User","","User.html","","<p>Inclues Clearance user functionality.\n"],["UsersController","","UsersController.html","","<p>Extends from <code>Clearance::UsersController</code>\n<p><code>after_action</code> sends  welcome email afte the <code>create</code>\naction is called, …\n"],["admin?","User","User.html#method-i-admin-3F","()","<p>Retunrs true if user is the “default admin” or if the <code>admin</code>\nproperrt is true\n"],["authenticate_user_api!","ApplicationController","ApplicationController.html#method-i-authenticate_user_api-21","(require: :any)","<p>Before_action filter to verify if user is logged in Renders errors when\nfailing, which will prevent the …\n"],["build","API::OrdersController::OrderBuilder","API/OrdersController/OrderBuilder.html#method-i-build","()","<p>Finds the cart for the passed in user, and copies products into a new\n<code>order</code> for that user, then calls …\n"],["create","API::CartItemsController","API/CartItemsController.html#method-i-create","()","<p>Adds a product to cart Finds the cart using <code>current_user</code>\nCreates the cart if one doesn&#39;t exist renders …\n"],["create","API::OrdersController","API/OrdersController.html#method-i-create","()","<p>Creates an order with the items in the cart, using\n<code>OrderBuilder</code> object\n"],["create","API::ProductsController","API/ProductsController.html#method-i-create","()","<p>Creates a product record\n<p>Params\n<p><code>name</code>\n"],["destroy","API::CartItemsController","API/CartItemsController.html#method-i-destroy","()","<p>Removes a product from the cart Finds the cart using\n<code>current_user</code> renders an error user does not have …\n"],["index","API::CartItemsController","API/CartItemsController.html#method-i-index","()","<p>Renders items in the cart in JSON\n"],["index","API::ProductsController","API/ProductsController.html#method-i-index","()","<p>Renders all <code>prodiuct</code> records as JSON\n"],["index","API::UsersController","API/UsersController.html#method-i-index","()","<p>Renders all <code>user</code> records as JSON\n"],["new","API::OrdersController::OrderBuilder","API/OrdersController/OrderBuilder.html#method-c-new","(user:)","<p>Pass in current user, who&#39;s cart you want to use\n"],["pretty_number","ProductsHelper","ProductsHelper.html#method-i-pretty_number","(number)",""],["save","Cart","Cart.html#method-i-save","(options = {})","<p>Rescues <code>ActiveRecord::RecordNotUnique</code>. Vecause of\n<code>validates_uniqueness_of</code>, this will only happen in a …\n"],["show","PagesController","PagesController.html#method-i-show","()","<p>renders page passed in via <code>params[:page]</code>\n<p><code>page</code> corresponds to a view in the <code>views/pages</code>\ndirectory\n"],["welcome","NotifierMailer","NotifierMailer.html#method-i-welcome","(user)","<p>Sends welcome email to the email address associated with the user. Called\nwhen a user signs up\n<p>Parameters …\n"],["README","","README_md.html","","<p>CELMATIX_CHALLENGE\n<p>This app was build using webpack and vue.js\n<p>It is deployed at celmatix-challenge-tomfbiz.herokuapp.com …\n"]]}}