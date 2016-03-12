class Warehouse < ActiveRecord::Base
    validates :name, presence: true,
                     length: { minimum: 1 },
                     uniqueness: { message: 'name must be unique' }
end
