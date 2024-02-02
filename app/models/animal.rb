class Animal < ApplicationRecord
    # Story 4:
    validates :common_name, :scientific_binomial, presence: true
    validates :common_name, :scientific_binomial, uniqueness: true
    validate :common_name_cannot_match_scientific_binomial
    
    def common_name_cannot_match_scientific_binomial
        if common_name == scientific_bionomial
            errors.add(:common_name, "cannot match scientific binomial")
        end
    end
end
