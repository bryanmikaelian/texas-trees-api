class Tree < ActiveRecord::Base
  # Attributes

  # Associations

  # Scopes

  # Validations
  validates :name, uniqueness: true

  # Methods
  def self.sunspot_search(query, opts = {})
    search = Tree.search do
      fulltext query do
        fields(name: 10.0, description: 2.0, nicknames: 20.0)
        fields(:flowering_color)
        phrase_fields(nicknames: 20.0)
        phrase_fields(habit: 4.0)
        phrase_fields(fruit_characteristics: 2.0)
        phrase_fields(plant_character: 2.0)
      end

      if opts[:exposure]
        with(:exposure, opts[:exposure])
      end

      if opts[:blooming_period]
        with(:blooming_period, opts[:blooming_period])
      end

      if opts[:heat_tolerance]
        with(:heat_tolerance, opts[:heat_tolerance])
      end

      if opts[:water_requirements]
        with(:water_requirements, opts[:water_requirements])
      end

      if opts[:soil_requirements]
        with(:soil_requirements, opts[:soil_requirements])
      end

      if opts[:min_usda_hardiness_zone] && opts[:max_usda_hardiness_zone]
        with(:usda_hardiness_zone, opts[:min_usda_hardiness_zone].to_i..opts[:max_usda_hardiness_zone].to_i)
      end
    end.results
  end

  concerning :Search do
    included do
      searchable do
        text :name
        text :nicknames do
          nicknames.split(",")
        end
        text :habit do
          habit.split(",")
        end
        text :description
        string :exposure
        text :flowering_color
        string :blooming_period
        text :fruit_characteristics
        text :plant_character
        string :heat_tolerance
        string :water_requirements
        string :soil_requirements
        integer :usda_hardiness_zone
      end
    end
  end
end
