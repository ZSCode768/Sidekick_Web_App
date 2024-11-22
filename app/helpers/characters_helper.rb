module CharactersHelper
    def calculate_modifier(stat)
        modifier = ((stat - 10) / 2).floor
        modifier >= 0 ? "+#{modifier}" : modifier.to_s
    end
end
