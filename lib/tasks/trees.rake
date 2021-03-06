require 'open-uri'
namespace :trees do
  desc 'Plants all trees from the data at http://aggie-horticulture.tamu.edu/ornamentals/natives/INDEXSCIENTIFIC.HTM'
  task plant: :environment do
    index = Nokogiri::HTML(open("http://aggie-horticulture.tamu.edu/ornamentals/natives/INDEXSCIENTIFIC.HTM"))
    index.xpath("//dd/a").each do |tree_link|
      tree_page = Nokogiri::HTML(open("http://aggie-horticulture.tamu.edu/ornamentals/natives/#{tree_link.first.last}"))
      tree_data = tree_page.xpath("//td[2]").children.reject { |x| x.name != "p" }.reject { |x| x.children.length < 2 }
      Tree.new.tap do |tree|
        # Name
        tree.name = tree_page.xpath("//i").first.children.first.text.strip

        # Synonyms

        # Nicknames
        tree.nicknames = tree_page.xpath("//b").first.children.first.text.strip

        # Description
        tree.description = tree_page.xpath("//td[2]").children.reject { |x| x.name != "p" }[1].text.gsub("\n", "")

        # Habit
        tree.habit = tree_data[0].children.last.text.gsub("\n", ", ")

        # Exposure
        tree.exposure = tree_data[1].children.last.text.gsub("\n", ", ")

        # Flowering Color
        tree.flowering_color = tree_data[2].children.last.text.gsub("\n", ", ")

        # Blooming Period
        tree.blooming_period = tree_data[3].children.last.text.gsub("\n", ", ")

        # Fruit Characteristics
        tree.fruit_characteristics = tree_data[4].children.last.text

        # Height
        tree.height = tree_data[5].children.last.text

        # Width
        tree.width = tree_data[6].children.last.text

        # Plant Character
        tree.plant_character = tree_data[7].children.last.text.gsub("\n", ", ")

        # Heat Tolerance
        tree.heat_tolerance = tree_data[8].children.last.text.gsub("\n", ", ")

        # Water Requirements
        tree.water_requirements = tree_data[9].children.last.text.gsub("\n", ", ")

        # Soil Requirements
        tree.soil_requirements = tree_data[10].children.last.text.gsub("\n", ", ")

        # USDA Hardiness Zone
        tree.usda_hardiness_zone = tree_data[11].children.last.text.to_i
      end.save
    end
  end
end
