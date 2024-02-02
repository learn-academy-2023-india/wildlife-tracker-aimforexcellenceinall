class Animal < ApplicationRecord
    # Story 5: 
    # Link (has_many): Sightings are attached to an animal, like tags on a keychain.
    # Manage (dependent): When I handle an animal's details, I can also add, change, or remove its sightings easily.
    # Clean Up (:destroy): If I remove an animal from the system (or Rails app and database), all its sightings go away too, keeping everything neat and tidy.
    # accepts_nested_attributes_for is for managing related things together. It's like filling out a form for an animal and including where and when I saw it on the same form. This Rails method allows a hierarchical or nested relationship between two (or more) models in a Rails app.
    has_many :sightings, dependent: :destroy
    accepts_nested_attributes_for :sightings

    # Story 4:
    validates :common_name, :scientific_binomial, presence: true
    validates :common_name, :scientific_binomial, uniqueness: true
    validate :common_name_cannot_match_scientific_binomial
    
    def common_name_cannot_match_scientific_binomial
        if common_name == scientific_binomial
            errors.add(:common_name, "cannot match scientific binomial")
        end
    end
end
