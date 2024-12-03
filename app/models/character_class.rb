class CharacterClass < ApplicationRecord
    has_many :spells
    has_many :characters

    validates :name, presence: true, uniqueness: true
    validates :description, presence:true

    #function to split class description into features based on level.
    def features_by_level(level)
        return [] unless description.present?
      
        lines = description.split("\n")
      
        features = []
        current_feature_name = ""
        current_feature_desc = ""
      
        lines.each do |line|
          # Match lines with level markers like (1st), (2nd), etc.
          if line.match(/\((\d+)(st|nd|rd|th)\)/)
            # Save the current feature if we already have one
            unless current_feature_name.empty?
              features << "#{current_feature_name}\n#{current_feature_desc.strip}"
            end
      
            # Start a new feature
            current_feature_name = line.strip
            current_feature_desc = ""
          else
            # Accumulate description lines for the current feature
            current_feature_desc += " #{line.strip}"
          end
        end
      
        # Add the last feature if it exists
        unless current_feature_name.empty?
          features << "#{current_feature_name}\n#{current_feature_desc.strip}"
        end
      
        # Filter features based on the character's level
        features.select do |feature|
          if feature.match(/\((\d+)(st|nd|rd|th)\)/)
            feature_level = $1.to_i
            feature_level <= level
          else
            false
          end
        end
      end
end
