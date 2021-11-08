class Users::HomeController < Admins::BaseController
    layout 'layouts/admin'
    def dashboard
        render 'users/dashboard'
    end
end
