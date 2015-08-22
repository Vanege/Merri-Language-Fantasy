GameText  = Core.class()

function GameText:init( options )
end

function GameText:Setup( options )
	GameText.HelperText = {}
	GameText.TargetText = {}
	GameText:SetupLanguages()
end

function GameText:Get( cat, id )
	local language = ""
	local category = ""
	if ( cat == "helper" ) then
		language = GLOBAL_CONFIG.HELPER_LANGUAGE
		category = "HelperText"
		
	else
		language = GLOBAL_CONFIG.TARGET_LANGUAGE
		category = "TargetText"
		
	end

	if ( GameText[ category ] == nil ) then							
		return "Invalid category " .. category
		
	elseif ( GameText[ category ][ language ] == nil ) then
		return "Invalid language " .. language 
		
	elseif ( GameText[ category ][ language ][ id ] == nil ) then
		return "Invalid id " .. id 
		
	else 
		return GameText[ category ][ language ][ id ]
		
	end
end

function GameText:SetupLanguages()
	GameText.HelperText.English = {}
	GameText.HelperText.Esperanto = {}
	GameText.HelperText.Ido = {}
	GameText.HelperText.Spanish = {}
	GameText.HelperText.Ithkuil = {}
	GameText.HelperText.French = {}
	
	GameText.TargetText.English = {}
	GameText.TargetText.Esperanto = {}
	GameText.TargetText.Ido = {}
	GameText.TargetText.Spanish = {}
	GameText.TargetText.Ithkuil = {}
	GameText.TargetText.French = {}


-- Credits --
GameText.TargetText.English		[ "Translation Credits" ]	= "Rachel J. Morris"
GameText.TargetText.Esperanto	[ "Translation Credits" ] 	= "Rachel J. Morris"
GameText.TargetText.Ido			[ "Translation Credits" ] 	= "???"
GameText.TargetText.Spanish		[ "Translation Credits" ] 	= "Tea Coba"
GameText.TargetText.Ithkuil     [ "Translation Credits" ]   = "Chikaodinaka 'dkawirl' Oluigbo"
GameText.TargetText.French		[ "Translation Credits" ] 	= "Vanege"

-- Common --

GameText.TargetText.English		[ "game title" ]	= "English Fantasy"
GameText.TargetText.Esperanto	[ "game title" ] 	= "Fantazio de Esperanto"
GameText.TargetText.Ido			[ "game title" ] 	= "Fantazio di Ido"
GameText.TargetText.Spanish		[ "game title" ] 	= "Fantasía de Español"
GameText.TargetText.Ithkuil     [ "game title" ]    = "Ithkaiwîl ubzál"
GameText.TargetText.French		[ "game title" ] 	= "Fantaisie du Français"

-- Menu Buttons --

GameText.HelperText.English		[ "Play" ] 	= "Play"
GameText.HelperText.Esperanto	[ "Play" ] 	= "Ludi"
GameText.HelperText.Ido			[ "Play" ] 	= "Ludar"
GameText.HelperText.Spanish		[ "Play" ] 	= "Jugar"
GameText.HelperText.Ithkuil     [ "Play" ]  = "Ováweš!"
GameText.HelperText.French		[ "Play" ] 	= "Jouer"

GameText.HelperText.English		[ "Options" ] 	= "Options"
GameText.HelperText.Esperanto	[ "Options" ] 	= "Agordoj"
GameText.HelperText.Ido			[ "Options" ] 	= "Agordi"
GameText.HelperText.Spanish		[ "Options" ] 	= "Opciones"
GameText.HelperText.Ithkuil     [ "Options" ]   = "Ênyar"
GameText.HelperText.French		[ "Options" ] 	= "Options"

GameText.HelperText.English		[ "Help" ] 	= "Help"
GameText.HelperText.Esperanto	[ "Help" ] 	= "Helpo"
GameText.HelperText.Ido			[ "Help" ] 	= "Helpo"
GameText.HelperText.Spanish		[ "Help" ] 	= "Ayuda"
GameText.HelperText.Ithkuil     [ "Help" ]  = "Âdnan"
GameText.HelperText.French		[ "Help" ] 	= "Aide"

GameText.HelperText.English		[ "Back" ] 	= "Back"
GameText.HelperText.Esperanto	[ "Back" ] 	= "Reveni"
GameText.HelperText.Ido			[ "Back" ] 	= "Revenar"
GameText.HelperText.Spanish		[ "Back" ] 	= "Regres"
GameText.HelperText.Ithkuil     [ "Back" ]  = "Rçarļ"
GameText.HelperText.French		[ "Back" ] 	= "Retour"

GameText.HelperText.English		[ "Menu" ] 	= "Menu"
GameText.HelperText.Esperanto	[ "Menu" ] 	= "Menuo"
GameText.HelperText.Ido			[ "Menu" ] 	= "Revenar"
GameText.HelperText.Spanish		[ "Menu" ] 	= "Regres"
GameText.HelperText.Ithkuil     [ "Menu" ]  = "Rçarļ"
GameText.HelperText.French		[ "Menu" ] 	= "Menu"

-- Got a star

GameText.TargetText.English		[ "Earned a star" ] 	= "You aquired a star!"
GameText.TargetText.Esperanto	[ "Earned a star" ] 	= "Vi akiris stelon!"
GameText.TargetText.Ido			[ "Earned a star" ] 	= "Vu aquiris stelo!"
GameText.TargetText.Spanish		[ "Earned a star" ] 	= "Usted adquirió una estrella!"
GameText.TargetText.Ithkuil     [ "Earned a star" ]     = "Uk'awîr kî"
GameText.TargetText.French		[ "Earned a star" ] 	= "Tu as gagné une étoile !"

GameText.HelperText.English		[ "Earned a star" ] 	= "You aquired a star!"
GameText.HelperText.Esperanto	[ "Earned a star" ] 	= "Vi akiris stelon!"
GameText.HelperText.Ido			[ "Earned a star" ] 	= "Vu aquiris stelo!"
GameText.HelperText.Spanish		[ "Earned a star" ] 	= "Usted adquirió una estrella!"
GameText.HelperText.Ithkuil     [ "Earned a star" ]     = "Uk'awîr kî"
GameText.TargetText.French		[ "Earned a star" ] 	= "Tu as gagné une étoile !"

-- LanguageSelectState --

GameText.HelperText.English		[ "I am learning English" ] 	= "I am learning English"
GameText.HelperText.Esperanto	[ "I am learning English" ]		= "Mi lernas anglan lingvon"
GameText.HelperText.Ido			[ "I am learning English" ] 	= "Me lernas angla linguo"
GameText.HelperText.Spanish		[ "I am learning English" ] 	= "Estoy aprendiendo inglés"
GameText.HelperText.Ithkuil     [ "I am learning English" ] = "Upinglišpel xháwîl"
GameText.HelperText.French		[ "I am learning English" ] 	= "J'apprends l'Anglais"

GameText.HelperText.English		[ "I am learning Esperanto" ]	= "I am learning Esperanto"
GameText.HelperText.Esperanto	[ "I am learning Esperanto" ]	= "Mi lernas esperanton"
GameText.HelperText.Ido			[ "I am learning Esperanto" ]	= "Me lernas esperanto"
GameText.HelperText.Spanish		[ "I am learning Esperanto" ]	= "Estoy aprendiendo esperanto"
GameText.HelperText.Ithkuil     [ "I am learning Esperanto" ]   = "Upesperantopel xháwîl"
GameText.HelperText.French		[ "I am learning Esperanto" ] 	= "J'apprends l'Espéranto"

GameText.HelperText.English		[ "I am learning Ido" ]			= "I am learning Ido"
GameText.HelperText.Esperanto	[ "I am learning Ido" ]			= "Mi lernas idon"
GameText.HelperText.Ido			[ "I am learning Ido" ]			= "Me lernas ido"
GameText.HelperText.Spanish		[ "I am learning Ido" ]			= "Estoy aprendiendo ido"
GameText.HelperText.Ithkuil     [ "I am learning Ido" ] = "Upidopel xháwîl"
GameText.HelperText.French		[ "I am learning Ido" ]			= "J'apprends l'Ido"

GameText.HelperText.English		[ "I am learning Spanish" ]		= "I am learning Spanish"
GameText.HelperText.Esperanto	[ "I am learning Spanish" ]		= "Mi lernas hispanan lingvon"
GameText.HelperText.Ido			[ "I am learning Spanish" ]		= "Me lernas hispana linguo"
GameText.HelperText.Spanish		[ "I am learning Spanish" ]		= "Estoy aprendiendo español"
GameText.HelperText.Ithkuil     [ "I am learning Spanish" ] = "Upspanišpel xháwîl"
GameText.HelperText.French		[ "I am learning Spanish" ]		= "J'apprends l'Espagnol"

GameText.HelperText.English	[ "I am learning Ithkuil" ]	= "I am learning Spanish"
GameText.HelperText.Esperanto	[ "I am learning Ithkuil" ]	= "Mi lernas hispanan lingvon"
GameText.HelperText.Ido		[ "I am learning Ithkuil" ]	= "Me lernas hispana linguo"
GameText.HelperText.Spanish	[ "I am learning Ithkuil" ]	= "Estoy aprendiendo español"
GameText.HelperText.Ithkuil	[ "I am learning Ithkuil" ]	= "Ithkel xháwîl"
GameText.HelperText.French	[ "I am learning Ithkuil" ]	= "J'apprends l'Ithkuil"

-- DifficultSelectState --

GameText.HelperText.English		[ "Practice" ] 	= "Practice"
GameText.HelperText.Esperanto	[ "Practice" ] 	= "Ekzerci"
GameText.HelperText.Ido			[ "Practice" ] 	= "Exercar"
GameText.HelperText.Spanish		[ "Practice" ] 	= "Práctica"
GameText.HelperText.Ithkuil     [ "Practice" ]  = "Xháwîl"	
GameText.HelperText.French		[ "Practice" ] 	= "Entraînement"

GameText.HelperText.English		[ "Easy" ] 		= "Easy"
GameText.HelperText.Esperanto	[ "Easy" ] 		= "Baznivela"
GameText.HelperText.Ido			[ "Easy" ] 		= "Baznivela"
GameText.HelperText.Spanish		[ "Easy" ] 		= "Fácil"	
GameText.HelperText.Ithkuil     [ "Easy" ]  = "Xháwîlürt"
GameText.HelperText.French		[ "Easy" ] 		= "Facile"

GameText.HelperText.English		[ "Medium" ] 	= "Medium"
GameText.HelperText.Esperanto	[ "Medium" ] 	= "Meznivela"
GameText.HelperText.Ido			[ "Medium" ] 	= "Meznivela"
GameText.HelperText.Spanish		[ "Medium" ] 	= "Intermedio"	
GameText.HelperText.Ithkuil     [ "Medium" ]    = "Xháwîlart" 
GameText.HelperText.French		[ "Medium" ] 		= "Intermédiaire"

GameText.HelperText.English		[ "Hard" ] 		= "Hard"
GameText.HelperText.Esperanto	[ "Hard" ] 		= "Altnivela"
GameText.HelperText.Ido			[ "Hard" ] 		= "Altnivela"
GameText.HelperText.Spanish		[ "Hard" ] 		= "Difícil"
GameText.HelperText.Ithkuil     [ "Hard" ]  = "Xháwîlert" 
GameText.HelperText.French		[ "Hard" ] 		= "Difficile"

GameText.HelperText.English		[ "Stats" ] 	= "Stats"
GameText.HelperText.Esperanto	[ "Stats" ] 	= "Statistikoj"
GameText.HelperText.Ido			[ "Stats" ] 	= "Statistiki"
GameText.HelperText.Spanish		[ "Stats" ] 	= "Estadística"
GameText.HelperText.Ithkuil     [ "Stats" ]     = "Upšáwušk"
GameText.HelperText.French		[ "Stats" ] 	= "Statistiques"

-- GameMinerState --

GameText.TargetText.English		[ "Miner" ] 	= "Miner"
GameText.TargetText.Esperanto	[ "Miner" ] 	= "Ministo"
GameText.TargetText.Ido			[ "Miner" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Miner" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "Miner" ]     = "Qò rq'il ômrar"
GameText.TargetText.French		[ "Miner" ] 	= "Mineur"

GameText.TargetText.English		[ "Floor" ] 	= "Floor:"
GameText.TargetText.Esperanto	[ "Floor" ] 	= "Nivelo:"
GameText.TargetText.Ido			[ "Floor" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Floor" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "Floor" ]     = "Mthal"
GameText.TargetText.French		[ "Floor" ] 	= "Étage :"

GameText.TargetText.English		[ "Money" ] 	= "Money:"
GameText.TargetText.Esperanto	[ "Money" ] 	= "Mono:"
GameText.TargetText.Ido			[ "Money" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Money" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "Money" ]     = "Îmsawur"
GameText.TargetText.French		[ "Money" ] 	= "Sous :"

GameText.TargetText.English		[ "Health" ] 	= "Health:"
GameText.TargetText.Esperanto	[ "Health" ] 	= "Sano:"
GameText.TargetText.Ido			[ "Health" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Health" ] 	= "Minero"
GameText.TargetText.Ithkuil [ "Health" ]    = "Glawul:"
GameText.TargetText.French		[ "Health" ] 	= "Santé :"

GameText.TargetText.English		[ "snail" ] 	= "Snail"
GameText.TargetText.Esperanto	[ "snail" ] 	= "Heliko"
GameText.TargetText.Ido			[ "snail" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "snail" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "snail" ]     = "Âļnal"
GameText.TargetText.French		[ "snail" ] 	= "Escargot"

GameText.TargetText.English		[ "mole" ] 		= "Mole"
GameText.TargetText.Esperanto	[ "mole" ] 		= "Talpo"
GameText.TargetText.Ido			[ "mole" ] 		= "Ministo"
GameText.TargetText.Spanish		[ "mole" ] 		= "Minero"
GameText.TargetText.Ithkuil     [ "mole" ]      = "Çqhwal"
GameText.TargetText.French		[ "mole" ] 		= "Taupe"

GameText.TargetText.English		[ "mushroom" ] 	= "Mushroom"
GameText.TargetText.Esperanto	[ "mushroom" ] 	= "Fungo"
GameText.TargetText.Ido			[ "mushroom" ] 	= "Piocho"
GameText.TargetText.Spanish		[ "mushroom" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "mushroom" ]  = "Cnalek"
GameText.TargetText.French		[ "mushroom" ] 	= "Champignon"

GameText.TargetText.English		[ "bat" ] 		= "Bat"
GameText.TargetText.Esperanto	[ "bat" ] 		= "Vesperto"
GameText.TargetText.Ido			[ "bat" ] 		= "Sabro"
GameText.TargetText.Spanish		[ "bat" ] 		= "Minero"
GameText.TargetText.Ithkuil     [ "bat" ]       = "Ftçal"
GameText.TargetText.French		[ "bat" ] 		= "Chauve-souris"

GameText.TargetText.English		[ "rabbit" ] 	= "Rabbit"
GameText.TargetText.Esperanto	[ "rabbit" ] 	= "Kuniklo"
GameText.TargetText.Ido			[ "rabbit" ] 	= "Sube"
GameText.TargetText.Spanish		[ "rabbit" ] 	= "Minero"
GameText.TargetText.Ithkuil [ "rabbit" ]    = "Lxwal"
GameText.TargetText.French		[ "rabbit" ] 	= "Lapin"

GameText.TargetText.English		[ "snake" ] 	= "Snake"
GameText.TargetText.Esperanto	[ "snake" ] 	= "Serpento"
GameText.TargetText.Ido			[ "snake" ] 	= "Sube"
GameText.TargetText.Spanish		[ "snake" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "snake" ]     = "Knal"
GameText.TargetText.French		[ "snake" ] 	= "Serpent"

GameText.TargetText.English		[ "skeleton" ] 	= "Skeleton"
GameText.TargetText.Esperanto	[ "skeleton" ] 	= "Skeleto"
GameText.TargetText.Ido			[ "skeleton" ] 	= "Sube"
GameText.TargetText.Spanish		[ "skeleton" ] 	= "Minero"
GameText.TargetText.Ithkuil [ "skeleton" ]  = "Urp'al eqel"
GameText.TargetText.French		[ "skeleton" ] 	= "Squelette"

GameText.TargetText.English		[ "moose" ] 	= "Moose"
GameText.TargetText.Esperanto	[ "moose" ] 	= "Alko"
GameText.TargetText.Ido			[ "moose" ] 	= "Sube"
GameText.TargetText.Spanish		[ "moose" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "moose" ]     = "Ndwal"
GameText.TargetText.French		[ "moose" ] 	= "Élan"

GameText.TargetText.English		[ "rock" ] 		= "Rock"
GameText.TargetText.Esperanto	[ "rock" ] 		= "Ŝtono"
GameText.TargetText.Ido			[ "rock" ] 		= "Roko"
GameText.TargetText.Spanish		[ "rock" ] 		= "Piedra"
GameText.TargetText.Ithkuil     [ "rock" ]      = "Ktal"
GameText.TargetText.French		[ "rock" ] 		= "Rocher"

GameText.TargetText.English		[ "star" ] 		= "Star"
GameText.TargetText.Esperanto	[ "star" ] 		= "Stelo"
GameText.TargetText.Ido			[ "star" ] 		= "Roko"
GameText.TargetText.Spanish		[ "star" ] 		= "Piedra"
GameText.TargetText.Ithkuil     [ "star" ]      = "Uk'ar"
GameText.TargetText.French		[ "star" ] 		= "Étoile"

GameText.TargetText.English		[ "sandwich" ] 	= "Sandwich"
GameText.TargetText.Esperanto	[ "sandwich" ] 	= "Sandviĉo"
GameText.TargetText.Ido			[ "sandwich" ] 	= "Sandwich"
GameText.TargetText.Spanish		[ "sandwich" ] 	= "Piedra"
GameText.TargetText.Ithkuil     [ "sandwich" ]  = "Âčmawîr"
GameText.TargetText.French		[ "sandwich" ] 	= "Sandwich"

GameText.TargetText.English		[ "amethyst" ] 	= "Amethyst"
GameText.TargetText.Esperanto	[ "amethyst" ] 	= "Ametisto"
GameText.TargetText.Ido			[ "amethyst" ] 	= "Ametisto"
GameText.TargetText.Spanish		[ "amethyst" ] 	= "Ametisto"
GameText.TargetText.Ithkuil     [ "amethyst" ]  = "Ktél khwal"
GameText.TargetText.French		[ "amethyst" ] 	= "Améthyste"

GameText.TargetText.English		[ "sapphire" ] 	= "Sapphire"
GameText.TargetText.Esperanto	[ "sapphire" ] 	= "Safiro"
GameText.TargetText.Ido			[ "sapphire" ] 	= "Akvamarino"
GameText.TargetText.Spanish		[ "sapphire" ] 	= "Akvamarino"
GameText.TargetText.Ithkuil     [ "sapphire" ]  = "Ktél přal"
GameText.TargetText.French		[ "sapphire" ] 	= "Saphir"

GameText.TargetText.English		[ "diamond" ] 	= "Diamond"
GameText.TargetText.Esperanto	[ "diamond" ] 	= "Diamanto"
GameText.TargetText.Ido			[ "diamond" ] 	= "Rubeno"
GameText.TargetText.Spanish		[ "diamond" ] 	= "Rubeno"
GameText.TargetText.Ithkuil     [ "diamond" ]   = "Stral"
GameText.TargetText.French		[ "diamond" ] 	= "Diamant"

GameText.TargetText.English		[ "emerald" ] 	= "Emerald"
GameText.TargetText.Esperanto	[ "emerald" ] 	= "Smeraldo"
GameText.TargetText.Ido			[ "emerald" ] 	= "Jado"
GameText.TargetText.Spanish		[ "emerald" ] 	= "Jado"
GameText.TargetText.Ithkuil     [ "emerald" ]   = "Żp'al"
GameText.TargetText.French		[ "emerald" ] 	= "Émeraude"

GameText.TargetText.English		[ "ruby" ] 		= "Ruby"
GameText.TargetText.Esperanto	[ "ruby" ] 		= "Rubeno"
GameText.TargetText.Ido			[ "ruby" ] 		= "Jado"
GameText.TargetText.Spanish		[ "ruby" ] 		= "Jado"
GameText.TargetText.Ithkuil     [ "ruby" ]  = "Ktél xt'al"
GameText.TargetText.French		[ "ruby" ] 		= "Rubis"

GameText.TargetText.English		[ "copper" ] 	= "Copper"
GameText.TargetText.Esperanto	[ "copper" ] 	= "Kupro"
GameText.TargetText.Ido			[ "copper" ] 	= "Kupra"
GameText.TargetText.Spanish		[ "copper " ] 	= "Kupra"
GameText.TargetText.Ithkuil     [ "copper" ]    = "Xhtal"
GameText.TargetText.French		[ "copper" ] 	= "Cuivre"

GameText.TargetText.English		[ "silver" ] 	= "Silver"
GameText.TargetText.Esperanto	[ "silver" ] 	= "Arĝento"
GameText.TargetText.Ido			[ "silver" ] 	= "Arĝenta"
GameText.TargetText.Spanish		[ "silver" ] 	= "Arĝenta"
GameText.TargetText.Ithkuil     [ "silver" ]   = "Rqal"
GameText.TargetText.French		[ "silver" ] 	= "Argent"

GameText.TargetText.English		[ "gold" ] 		= "Gold"
GameText.TargetText.Esperanto	[ "gold" ] 		= "Oro"
GameText.TargetText.Ido			[ "gold" ] 		= "Ora"
GameText.TargetText.Spanish		[ "gold" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "gold" ]     = "Xral"
GameText.TargetText.French		[ "gold" ] 	= "Or"

GameText.TargetText.English		[ "ladder" ] 	= "Ladder"
GameText.TargetText.Esperanto	[ "ladder" ] 	= "Ŝtupetaro"
GameText.TargetText.Ido			[ "ladder" ] 	= "Ora"
GameText.TargetText.Spanish		[ "ladder" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "ladder" ]   = "Otnal"
GameText.TargetText.French		[ "ladder" ] 	= "Échelle"

GameText.TargetText.English		[ "Game Over" ] 	= "Game Over"
GameText.TargetText.Esperanto	[ "Game Over" ] 	= "Ludfino"
GameText.TargetText.Ido			[ "Game Over" ] 	= "Ora"
GameText.TargetText.Spanish		[ "Game Over" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "Game Over" ]     = "Upšákt’"
GameText.TargetText.French		[ "Game Over" ] 	= "Fin de la partie"

GameText.HelperText.English		[ "Game Over" ] 	= "Game Over"
GameText.HelperText.Esperanto	[ "Game Over" ] 	= "Ludfino"
GameText.HelperText.Ido			[ "Game Over" ] 	= "Ora"
GameText.HelperText.Spanish		[ "Game Over" ] 	= "Ora"
GameText.HelperText.Ithkuil     [ "Game Over" ]     = "Upšákt’"
GameText.HelperText.French		[ "Game Over" ] 	= "Fin de la partie"

GameText.TargetText.English		[ "miner-begin" ] 	= "Mine for treasure and stay alive!"
GameText.TargetText.Esperanto	[ "miner-begin" ] 	= "Minu trezoron kaj daŭru vivi!"
GameText.TargetText.Ido			[ "miner-begin" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-begin" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-begin" ]   = "Ko rq'il ômrar. Ka uglawelir"
GameText.TargetText.French		[ "miner-begin" ] 	= "Mine à la recherche de trésors et reste en vie !"

GameText.TargetText.English		[ "miner-move-north" ] 	= "You walk north."
GameText.TargetText.Esperanto	[ "miner-move-north" ] 	= "Vi marŝas norden."
GameText.TargetText.Ido			[ "miner-move-north" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-north" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-move-north" ]  = "Ku gwal osroar"
GameText.TargetText.French		[ "miner-move-north" ] 	= "Tu marches vers le nord."

GameText.TargetText.English		[ "miner-move-south" ] 	= "You walk south."
GameText.TargetText.Esperanto	[ "miner-move-south" ] 	= "Vi marŝas suden."
GameText.TargetText.Ido			[ "miner-move-south" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-south" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-move-south" ]  = "Ku gwal ösroar"
GameText.TargetText.French		[ "miner-move-south" ] 	= "Tu marches vers le sud."

GameText.TargetText.English		[ "miner-move-east" ] 	= "You walk east."
GameText.TargetText.Esperanto	[ "miner-move-east" ] 	= "Vi marŝas orienten."
GameText.TargetText.Ido			[ "miner-move-east" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-east" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-move-east" ]   = "Ku gwal öcmoar"
GameText.TargetText.French		[ "miner-move-east" ] 	= "Tu marches vers l'est."

GameText.TargetText.English		[ "miner-move-west" ] 	= "You walk west."
GameText.TargetText.Esperanto	[ "miner-move-west" ] 	= "Vi marŝas okcidenten."
GameText.TargetText.Ido			[ "miner-move-west" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-west" ] 	= "Ora"
GameText.TargetText.Ithkuil		[ "miner-move-west" ] 	= ""
GameText.TargetText.French		[ "miner-move-west" ] 	= "Tu marches vers l'ouest."

GameText.TargetText.English		[ "miner-mine" ] 		= "You swing your pick."
GameText.TargetText.Esperanto	[ "miner-mine" ] 		= "Vi svingas vian pioĉon."
GameText.TargetText.Ido			[ "miner-mine" ] 		= "asdf"
GameText.TargetText.Spanish		[ "miner-mine" ] 		= "asdf"
GameText.TargetText.Ithkuil     [ "miner-mine" ]        = "Čel obval kî ko"
GameText.TargetText.French		[ "miner-mine" ] 		= "Tu donnes un coup de pioche."

GameText.TargetText.English		[ "miner-eat-sandwich" ] 	= "You eat the cave sandwich."
GameText.TargetText.Esperanto	[ "miner-eat-sandwich" ] 	= "Vi manĝas la kavernan sandviĉon."
GameText.TargetText.Ido			[ "miner-eat-sandwich" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-eat-sandwich" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-eat-sandwich" ]    = "Čmel gral ko"
GameText.TargetText.French		[ "miner-eat-sandwich" ] 	= "Tu manges le sandwich des cavernes."

-- collects
GameText.TargetText.English		[ "miner-collect-copper" ] 	= "You pick up copper."
GameText.TargetText.Esperanto	[ "miner-collect-copper" ] 	= "Vi kolektas kupron."
GameText.TargetText.Ido			[ "miner-collect-copper" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-copper" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-copper" ]  = "Xhtel ômrar ko"
GameText.TargetText.French		[ "miner-collect-copper" ] 	= "Tu as ramassé du cuivre."

GameText.TargetText.English		[ "miner-collect-silver" ] 	= "You pick up silver."
GameText.TargetText.Esperanto	[ "miner-collect-silver" ] 	= "Vi kolektas arĝenton."
GameText.TargetText.Ido			[ "miner-collect-silver" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-silver" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-silver" ]  = "Rqel ômrar ko"
GameText.TargetText.French		[ "miner-collect-silver" ] 	= "Tu as ramassé de l'argent."

GameText.TargetText.English		[ "miner-collect-gold" ] 	= "You pick up gold."
GameText.TargetText.Esperanto	[ "miner-collect-gold" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-gold" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-gold" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-gold" ]    = "Xrel ômrar ko"
GameText.TargetText.French		[ "miner-collect-gold" ] 	= "Tu as ramassé de l'or."

GameText.TargetText.English		[ "miner-collect-amethyst" ] 	= "You pick up amethyst."
GameText.TargetText.Esperanto	[ "miner-collect-amethyst" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-amethyst" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-amethyst" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-amethyst" ]    = "Ktél khwal ômrar ko"
GameText.TargetText.French		[ "miner-collect-amethyst" ] 	= "Tu as ramassé une améthyste."

GameText.TargetText.English		[ "miner-collect-sapphire" ] 	= "You pick up sapphire."
GameText.TargetText.Esperanto	[ "miner-collect-sapphire" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-sapphire" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-sapphire" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-sapphire" ]    = "Ktél přal ômrar ko"
GameText.TargetText.French		[ "miner-collect-sapphire" ] 	= "Tu as ramassé un saphir."

GameText.TargetText.English		[ "miner-collect-diamond" ] 	= "You pick up diamond."
GameText.TargetText.Esperanto	[ "miner-collect-diamond" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-diamond" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-diamond" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-diamond" ]     = "Strel ômrar ko"
GameText.TargetText.French		[ "miner-collect-diamond" ] 	= "Tu as ramassé un diamant."

GameText.TargetText.English		[ "miner-collect-emerald" ] 	= "You pick up emerald."
GameText.TargetText.Esperanto	[ "miner-collect-emerald" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-emerald" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-emerald" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-emerald" ]     = "Żp'al ômrar ko"
GameText.TargetText.French		[ "miner-collect-emerald" ] 	= "Tu as ramassé une émeraude."

GameText.TargetText.English		[ "miner-collect-ruby" ] 	= "You pick up ruby."
GameText.TargetText.Esperanto	[ "miner-collect-ruby" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-ruby" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-ruby" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-ruby" ]    = "Ktél xtal ômrar ko"
GameText.TargetText.French		[ "miner-collect-ruby" ] 	= "Tu as ramassé un rubis."

-- attacking
GameText.TargetText.English		[ "miner-attack-snail" ] 	= "You attack the snail."
GameText.TargetText.Esperanto	[ "miner-attack-snail" ] 	= "Vi atakas la helikon."
GameText.TargetText.Ido			[ "miner-attack-snail" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-snail" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-snail" ]    = "Âļnel fřál ko"
GameText.TargetText.French		[ "miner-attack-snail" ] 	= "Tu attaques l'escargot."

GameText.TargetText.English		[ "miner-attack-mole" ] 	= "You attack the mole."
GameText.TargetText.Esperanto	[ "miner-attack-mole" ] 	= "Vi atakas la talpon."
GameText.TargetText.Ido			[ "miner-attack-mole" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-mole" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-mole" ]     = "Çqhwel fřál ko"
GameText.TargetText.French		[ "miner-attack-mole" ] 	= "Tu attaques la taupe."

GameText.TargetText.English		[ "miner-attack-mushroom" ] 	= "You attack the mushroom."
GameText.TargetText.Esperanto	[ "miner-attack-mushroom" ] 	= "Vi atakas la fungon."
GameText.TargetText.Ido			[ "miner-attack-mushroom" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-mushroom" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-mushroom" ]     = "Cnelek fřál ko"
GameText.TargetText.French		[ "miner-attack-mushroom" ] 	= "Tu attaques le champignon."

GameText.TargetText.English		[ "miner-attack-bat" ] 		= "You attack the bat."
GameText.TargetText.Esperanto	[ "miner-attack-bat" ] 		= "Vi atakas la vesperton."
GameText.TargetText.Ido			[ "miner-attack-bat" ] 		= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-bat" ] 		= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-bat" ]  = "Ftçel fřál ko"
GameText.TargetText.French		[ "miner-attack-bat" ] 		= "Tu attaques la chauve-souris."

GameText.TargetText.English		[ "miner-attack-rabbit" ] 	= "You attack the rabbit."
GameText.TargetText.Esperanto	[ "miner-attack-rabbit" ] 	= "Vi atakas la kuniklon."
GameText.TargetText.Ido			[ "miner-attack-rabbit" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-rabbit" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-rabbit" ]   = "Lxwel fřál ko"
GameText.TargetText.French		[ "miner-attack-rabbit" ] 	= "Tu attaques le lapin."

GameText.TargetText.English		[ "miner-attack-snake" ] 	= "You attack the snake."
GameText.TargetText.Esperanto	[ "miner-attack-snake" ] 	= "Vi atakas la serpenton."
GameText.TargetText.Ido			[ "miner-attack-snake" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-snake" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-snake" ]    = "Knel fřál ko"
GameText.TargetText.French		[ "miner-attack-snake" ] 	= "Tu attaques le serpent."

GameText.TargetText.English		[ "miner-attack-moose" ] 	= "You attack the moose."
GameText.TargetText.Esperanto	[ "miner-attack-moose" ] 	= "Vi atakas la alkon."
GameText.TargetText.Ido			[ "miner-attack-moose" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-moose" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-moose" ]    = "Ndwel fřál ko"
GameText.TargetText.French		[ "miner-attack-moose" ] 	= "Tu attaques l'élan."

GameText.TargetText.English		[ "miner-attack-skeleton" ] 	= "You attack the skeleton."
GameText.TargetText.Esperanto	[ "miner-attack-skeleton" ] 	= "Vi atakas la skeleton."
GameText.TargetText.Ido			[ "miner-attack-skeleton" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-skeleton" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-skeleton" ]     = "Urp'al eqel fřál ko"
GameText.TargetText.French		[ "miner-attack-skeleton" ] 	= "Tu attaques le squelette."

-- Shop

GameText.TargetText.English		[ "Do you want to buy a tool?" ] 	= "Do you want to buy a tool?"
GameText.TargetText.Esperanto	[ "Do you want to buy a tool?" ] 	= "Ĉu vi volas aĉeti ilon?"
GameText.TargetText.Ido			[ "Do you want to buy a tool?" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Do you want to buy a tool?" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Do you want to buy a tool?" ]    = "Ebawul ki čeil?"
GameText.TargetText.French		[ "Do you want to buy a tool?" ] 	= "Est-ce que tu veux acheter un outil ?"

GameText.TargetText.English		[ "Potion" ] 	= "Potion"
GameText.TargetText.Esperanto	[ "Potion" ] 	= "Pocio"
GameText.TargetText.Ido			[ "Potion" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Potion" ] 	= "asdf."
GameText.TargetText.Ithkuil 	[ "Potion" ]    = "Ôgral kâ"
GameText.TargetText.French		[ "Potion" ] 	= "Potion"

GameText.TargetText.English		[ "PotionDescription" ] 	= "Restores all of your health."
GameText.TargetText.Esperanto	[ "PotionDescription" ] 	= "Redoni ĉiom da via sano."
GameText.TargetText.Ido			[ "PotionDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "PotionDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil		[ "PotionDescription" ] 	= "asdf."
GameText.TargetText.French		[ "PotionDescription" ] 	= "Restaure toute ta santé."

GameText.TargetText.English		[ "Earthquake" ] 	= "Earthquake"
GameText.TargetText.Esperanto	[ "Earthquake" ] 	= "Sismo"
GameText.TargetText.Ido			[ "Earthquake" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Earthquake" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Earthquake" ]    = "pErţkwaekpar"
GameText.TargetText.French		[ "Earthquake" ] 	= "Séisme"

GameText.TargetText.English		[ "EarthquakeDescription" ] 	= "Breaks all rocks."
GameText.TargetText.Esperanto	[ "EarthquakeDescription" ] 	= "Rompi ĉiujn ŝtonojn."
GameText.TargetText.Ido			[ "EarthquakeDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "EarthquakeDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "EarthquakeDescription" ]     = ""
GameText.TargetText.French		[ "EarthquakeDescription" ] 	= "Casse tous les rochers."

GameText.TargetText.English		[ "Dynamite" ] 	= "Dynamite"
GameText.TargetText.Esperanto	[ "Dynamite" ] 	= "Dinamito"
GameText.TargetText.Ido			[ "Dynamite" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Dynamite" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Dynamite" ]  = "Xčálrak"
GameText.TargetText.French		[ "Dynamite" ] 	= "Dynamite"

GameText.TargetText.English		[ "DynamiteDescription" ] 	= "Descend down one floor."
GameText.TargetText.Esperanto	[ "DynamiteDescription" ] 	= "Subiri unu nivelon."
GameText.TargetText.Ido			[ "DynamiteDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "DynamiteDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil 	[ "DynamiteDescription" ]   = "Jal"
GameText.TargetText.French		[ "DynamiteDescription" ] 	= "Fait descendre d'un étage."

GameText.TargetText.English		[ "Rope" ] 	= "Rope"
GameText.TargetText.Esperanto	[ "Rope" ] 	= "Ŝnuro"
GameText.TargetText.Ido			[ "Rope" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Rope" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Rope" ]  = "Öxpál"
GameText.TargetText.French		[ "Rope" ] 	= "Corde"

GameText.TargetText.English		[ "RopeDescription" ] 	= "Climb up one floor."
GameText.TargetText.Esperanto	[ "RopeDescription" ] 	= "Supreniri unu nivelon."
GameText.TargetText.Ido			[ "RopeDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "RopeDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "RopeDescription" ]   = "Jal"
GameText.TargetText.French		[ "RopeDescription" ] 	= "Fait monter d'un étage."

GameText.TargetText.English		[ "Blizzard" ] 	= "Blizzard"
GameText.TargetText.Esperanto	[ "Blizzard" ] 	= "Neĝoŝtormo"
GameText.TargetText.Ido			[ "Blizzard" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Blizzard" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Blizzard" ]  = "Uţwálûk"
GameText.TargetText.French		[ "Blizzard" ] 	= "Blizzard"

GameText.TargetText.English		[ "BlizzardDescription" ] 	= "Freeze all the enemies."
GameText.TargetText.Esperanto	[ "BlizzardDescription" ] 	= "Frostigi ĉiujn malamikojn."
GameText.TargetText.Ido			[ "BlizzardDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "BlizzardDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "BlizzardDescription" ]   = "Tel îdhal"
GameText.TargetText.French		[ "BlizzardDescription" ] 	= "Gèle tous les ennemis."

GameText.TargetText.English		[ "Price" ] 	= "Price:"
GameText.TargetText.Esperanto	[ "Price" ] 	= "Prezo:"
GameText.TargetText.Ido			[ "Price" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Price" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Price" ]     = "Îmsawur"
GameText.TargetText.French		[ "Price" ] 	= "Prix :"

-- ladder
GameText.TargetText.English		[ "miner-go-down-ladder" ] 		= "You descend the ladder."
GameText.TargetText.Esperanto	[ "miner-go-down-ladder" ] 		= "Vi malsupreniras per la ŝtupetaro.."
GameText.TargetText.Ido			[ "miner-go-down-ladder" ] 		= "asdf."
GameText.TargetText.Spanish		[ "miner-go-down-ladder" ] 		= "asdf."
GameText.TargetText.Ithkuil     [ "miner-go-down-ladder" ]  = "Jal"
GameText.TargetText.French		[ "miner-go-down-ladder" ] 		= "Tu descends l'échelle."
	
end


