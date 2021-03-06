class CharacterScreen

	def initialize(display_system, input_system, entities)
		@display_system = display_system
		@input_system = input_system
		@player = entities.find { |e| e.has?(:name) && e.get(:name) == 'Player' }
		raise 'Can\'t find player in display system' if @player.nil?
	end
	
	def show		
		#@display_system.clear
		
		hp = @player.get(:health)
		exp = @player.get(:experience)
		grey = Color.new(192, 192, 192)
		
		@display_system.draw_rectangle(3, 2, 25, 6, grey)
		@display_system.draw_text(5, 4, "Level: #{exp.level}", grey)
		@display_system.draw_text(5, 5, "Experience: #{exp.experience}/#{exp.next_level_at}", grey)		
		@display_system.draw_text(5, 6, "Health: #{hp.current_health}/#{hp.max_health}", grey)
		
		@input_system.get_input
		# Close the screen.		
		# Is it a hack to draw dots when we close the character screen?
		# Not a hack. Entities will be drawn over these, including the 
		# underlying dungeon properties.
		@display_system.fill_screen('.', Color.new(128, 128, 128))
		@display_system.draw
	end

end
