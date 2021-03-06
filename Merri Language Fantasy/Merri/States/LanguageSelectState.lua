LanguageSelectState = Core.class( StateBase )

function LanguageSelectState:init( options )
	StateBase:init( options )
end

-- Setup / Teardown --
function LanguageSelectState:Setup( options )
	GLOBAL_CONFIG.HELPER_LANGUAGE = nil
	GLOBAL_CONFIG.TARGET_LANGUAGE = nil
	StateBase:Setup( { backgroundScroll = true } )
	self:SetupHelperMenu( options )
end

function LanguageSelectState:SetupHelperMenu( options )	
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	StateBase:AddButton( { 
		button = { id = "btn_language_en", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 25  },
		label 	= { id = "btn_language_en", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 25+35, color = 0xFFFFFF, size = 16, text = "I know English" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language_eo", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 100  },
		label 	= { id = "btn_language_eo", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 100+35, color = 0xFFFFFF, size = 16, text = "Mi konas Esperanton" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language_io", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 175  },
		label 	= { id = "btn_language_io", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 175+35, color = 0xFFFFFF, size = 16, text = "Me konas Ido" }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language_es", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 250  },
		label 	= { id = "btn_language_es", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 250+35, color = 0xFFFFFF, size = 16, text = "Yo conozco español" }
		} )
		
	self.menuPage = "SelectHelper"
	self:Draw()
end

function LanguageSelectState:SetupTargetMenu( options )
	StateBase:ClearScreen()
	StateBase:ClearWidgets()

	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	StateBase:AddButton( { 
		button = { id = "btn_language_en", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 25  },
		label 	= { id = "btn_language_en", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 25+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning English" ) }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language_eo", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 100  },
		label 	= { id = "btn_language_eo", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 100+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning Esperanto" ) }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language_io", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 175  },
		label 	= { id = "btn_language_io", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 175+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning Ido" ) }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_language_es", 	path = "Content/Graphics/UI/widebtnbg.png",  	pos_x = 15, pos_y = 250  },
		label 	= { id = "btn_language_es", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 25, pos_y = 250+35, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "I am learning Spanish" ) }
		} )
		
	self.menuPage = "SelectTarget"
	self:Draw()
end

function LanguageSelectState:Cleanup()
end

function LanguageSelectState:Draw()
	StateBase:Draw()
end

-- Cyclical --
function LanguageSelectState:Update()
end

-- Callbacks --
function LanguageSelectState:Handle_AndroidKey( event )
end

function LanguageSelectState:Handle_KeyDown( event )
end

function LanguageSelectState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	
	if ( self.menuPage == "SelectHelper" ) then
		if ( clickedButton == "btn_language_en" ) then 				GLOBAL_CONFIG.HELPER_LANGUAGE = "English"
		elseif ( clickedButton == "btn_language_eo" ) then 		GLOBAL_CONFIG.HELPER_LANGUAGE = "Esperanto"
		elseif ( clickedButton == "btn_language_io" ) then 		GLOBAL_CONFIG.HELPER_LANGUAGE = "Ido"
		elseif ( clickedButton == "btn_language_es" ) then 		GLOBAL_CONFIG.HELPER_LANGUAGE = "Spanish"
		end
		
		if ( GLOBAL_CONFIG.HELPER_LANGUAGE ~= nil ) then
			self:SetupTargetMenu()
		end
		
	elseif ( self.menuPage == "SelectTarget" ) then
		if ( clickedButton == "btn_language_en" ) then 				GLOBAL_CONFIG.TARGET_LANGUAGE = "English"
		elseif ( clickedButton == "btn_language_eo" ) then 		GLOBAL_CONFIG.TARGET_LANGUAGE = "Esperanto"
		elseif ( clickedButton == "btn_language_io" ) then 		GLOBAL_CONFIG.TARGET_LANGUAGE = "Ido"
		elseif ( clickedButton == "btn_language_es" ) then 		GLOBAL_CONFIG.TARGET_LANGUAGE = "Spanish"
		end
		
		if ( GLOBAL_CONFIG.TARGET_LANGUAGE ~= nil ) then
			SAVE_CONFIG()
			--StateBase:SetGotoState( "TitleState" )
			StateBase:SetGotoState( "GameMinerState" )
		end
	end
end

function LanguageSelectState:Handle_EnterFrame( event )
	StateBase:Update()
end

function LanguageSelectState:ClearScreen()
	StateBase:ClearScreen()	
end

function LanguageSelectState:ClearWidgets()
	StateBase:ClearWidgets()
end

function LanguageSelectState:GotoState()
	return StateBase:GotoState()
end