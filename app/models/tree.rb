class Tree < ActiveRecord::Base
  # Attributes

  # Associations

  # Scopes

  # Validations
  validates :name, uniqueness: true

  # Methods
end
