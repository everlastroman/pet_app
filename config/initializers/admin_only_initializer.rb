require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class AdminOnly < Authenticatable
      def authenticate!
        resource  = password.present? && mapping.to.find_for_database_authentication(authentication_hash)
        encrypted = false
    
        if validate(resource){ encrypted = true; resource.valid_password?(password) }
          if resource.role == 'admin'
            success!(resource)
          else
            fail!(:not_permitted)
          end
        end
        
        mapping.to.new.password = password if !encrypted && Devise.paranoid
        fail(:not_found_in_database) unless resource
      end
    end
  end
end

Warden::Strategies.add(:admin_only, Devise::Strategies::AdminOnly)