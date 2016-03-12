class Customer < ActiveRecord::Base
    validates :first_name, presence: true,
                           length: { minimum: 1 }

    def name
        "#{first_name} #{last_name}"
    end
end
