MinerMap = Core.class()

function MinerMap:init( options )
	-- Load tiles & characters
	self.textures = {
			ground = Texture.new( "Content/Games/Miner/Tiles/ground_dirt.png" ),
			wall = Texture.new( "Content/Games/Miner/Tiles/ground_cobblestone.png" ),
			ceiling = Texture.new( "Content/Games/Miner/Tiles/ground_darkstone.png" ),
			
			rock = Texture.new( "Content/Games/Miner/Tiles/rock.png" ),
			ladder = Texture.new( "Content/Games/Miner/Tiles/ladder_down.png" ),
			star = Texture.new( "Content/Graphics/Tiles/treasure_star.png" ),
			mushroom = Texture.new( "Content/Games/Miner/Characters/enemy_mushroom.png" ),
			bat = Texture.new( "Content/Games/Miner/Characters/enemy_bat.png" ),
			snail = Texture.new( "Content/Games/Miner/Characters/enemy_snail.png" ),
			rabbit = Texture.new( "Content/Games/Miner/Characters/enemy_rabbit.png" ),
			snake = Texture.new( "Content/Games/Miner/Characters/enemy_snake.png" ),
			mole = Texture.new( "Content/Games/Miner/Characters/enemy_mole.png" ),
			skeleton = Texture.new( "Content/Games/Miner/Characters/enemy_skeleton.png" ),
			moose = Texture.new( "Content/Games/Miner/Characters/enemy_moose.png" ),
			
			copper = Texture.new( "Content/Games/Miner/Tiles/treasure_copper.png" ),
			silver = Texture.new( "Content/Games/Miner/Tiles/treasure_silver.png" ),
			gold = Texture.new( "Content/Games/Miner/Tiles/treasure_gold.png" ),
			amethyst = Texture.new( "Content/Games/Miner/Tiles/treasure_amethyst.png" ),
			sapphire = Texture.new( "Content/Games/Miner/Tiles/treasure_sapphire.png" ),
			diamond = Texture.new( "Content/Games/Miner/Tiles/treasure_diamond.png" ),
			emerald = Texture.new( "Content/Games/Miner/Tiles/treasure_emerald.png" ),
			ruby = Texture.new( "Content/Games/Miner/Tiles/treasure_ruby.png" ),
			sandwich = Texture.new( "Content/Games/Miner/Tiles/sandwich.png" ),
		}
		
	self.tileWidth = self.textures.ground:getWidth()
	self.floor = 1
	self.lastFloor = 20
	self.mapWidth = 10
	self.mapHeight = 14
		
	self.tiles = {}
	
	self.player = MinerPlayer.new( { moveAmount = self.tileWidth } )
end

function MinerMap:GetPlayerCoordinates()
	return self.player:getPosition()
end

function MinerMap:GoDownstairs()
	self.floor = self.floor + 1
	self:Generate()
end

function MinerMap:ClearMap()
	-- Remove existing tiles
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			if ( self.tiles[x] ~= nil and self.tiles[x][y] ~= nil ) then
			
				if ( self.tiles[x][y].bitmap ~= nil and stage:contains( self.tiles[x][y].bitmap ) ) then 	
					stage:removeChild( self.tiles[x][y].bitmap )		
				end
				
				if ( self.tiles[x][y].object ~= nil and stage:contains( self.tiles[x][y].object ) ) then 
					stage:removeChild( self.tiles[x][y].object ) 
				end
				
				self.tiles[x][y] = nil
			end
		end
	end
	
	for x = 0, self.mapWidth do
		self.tiles[x] = {}
		for y = 0, self.mapHeight do
			self.tiles[x][y] = {}
		end
	end
end

function MinerMap:Generate()
	self:ClearMap()
	-- Initialize entire map as wall
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			self.tiles[x][y].type = "ceiling"
			self.tiles[x][y].bitmap = Bitmap.new( self.textures[ self.tiles[x][y].type ] )
			self.tiles[x][y].bitmap:setPosition( x * self.tileWidth, y * self.tileWidth )
		end
	end
		
	-- Generate paths
	local tileCount = math.random( 100, 120 )
	
	local startX = 0
	local startY = math.random( 0, self.mapHeight )
	self.tiles[startX][startY].objectType = "player"
	
	local endX = self.mapWidth - 1
	local endY = math.random( 0, self.mapHeight )
	if ( self.floor < self.lastFloor ) then
		self.tiles[endX][endY].objectType = "ladder"
	else
		self.tiles[endX][endY].objectType = "star"	
	end
	
	-- Traverse Map
	local x = startX
	local y = startY
	
	local roomPoints = {}
	table.insert( roomPoints, { x = endX, y = endY } )
	for i = 0, math.random( 5, 10 ) do
		local room = { x = math.random( 1, self.mapWidth - 1 ), y = math.random( 1, self.mapHeight - 1 ) }
		table.insert( roomPoints, room )
	end
	
	-- Add paths between each room
	for key, point in pairs( roomPoints ) do
		endX = point.x
		endY = point.y
		
		while ( x ~= endX or y ~= endY ) do
			self.tiles[x][y].type = "ground"
			self.tiles[x][y].bitmap:setTexture( self.textures[ self.tiles[x][y].type ] )
			self.tiles[x][y].generalType = "none"
			
			local xOrY = math.random( 1, 2 )
			if ( xOrY == 1 ) then
				if ( endX < x ) then				x = x - 1
				elseif ( endX > x ) then		x = x + 1
				end
			else
				if ( endY < y ) then				y = y - 1
				elseif ( endY > y ) then		y = y + 1
				end
			end -- if ( xOrY == 1 ) then
		end -- while ( x ~= endX or y ~= endY ) do
	end
	
	-- last tile
	self.tiles[x][y].type = "ground"
	self.tiles[x][y].bitmap:setTexture( self.textures[ self.tiles[x][y].type ] )
	
	-- add ceilings: CEILING, WALL, FLOOR
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			if ( self.tiles[x][y].type == "ground" ) then
				if ( self.tiles[x][y - 1] ~= nil and self.tiles[x][y - 1].type == "ceiling" 
					and ( ( self.tiles[x][y - 2] ~= nil and self.tiles[x][y - 2].type == "ceiling" ) or self.tiles[x][y - 2] == nil ) ) then
				self.tiles[x][y - 1].type = "wall"
				self.tiles[x][y - 1].bitmap:setTexture( self.textures[ self.tiles[x][y - 1].type ] )
				
				elseif ( self.tiles[x][y - 1] ~= nil and self.tiles[x][y - 1].type == "ceiling" and self.tiles[x][y - 2] ~= nil and self.tiles[x][y - 2].type == "ground" ) then
				self.tiles[x][y - 1].type = "ground"
				self.tiles[x][y - 1].bitmap:setTexture( self.textures[ self.tiles[x][y - 1].type ] )
				end
			end
		end
	end
	
	local enemyCount = math.floor( self.floor / 4 ) + 1
	for e = 0, enemyCount do
		local x, y		
		local isValidPlace = false
		
		while ( isValidPlace == false ) do
			x = math.random( 0, self.mapWidth )
			y = math.random( 0, self.mapHeight )
			isValidPlace = ( self.tiles[x][y].type == "ground" and self.tiles[x][y].objectType == nil )
		end
		
		self.tiles[x][y].dead = false
		self.tiles[x][y].generalType = "enemy"
		self.tiles[x][y].objectDirection = "none"
		
		local enemyType = math.random( 1, 2 )
		if ( enemyType == 1 and self.floor > 0 and self.floor <= 4 ) then
			self.tiles[x][y].objectType = "mushroom"
			self.tiles[x][y].objectDirection = "east"
		elseif ( enemyType == 1 and self.floor > 4 and self.floor <= 8 ) then
			self.tiles[x][y].objectType = "bat"
			self.tiles[x][y].objectDirection = "west"
		elseif ( enemyType == 1 and self.floor > 8 and self.floor <= 12 ) then
			self.tiles[x][y].objectType = "snail"
			self.tiles[x][y].objectDirection = "west"
		elseif ( enemyType == 1 and self.floor > 12 and self.floor <= 16 ) then
			self.tiles[x][y].objectType = "rabbit"
			self.tiles[x][y].objectDirection = "east"
		elseif ( enemyType == 2 and self.floor > 2 and self.floor <= 6 ) then
			self.tiles[x][y].objectType = "snake"
			self.tiles[x][y].objectDirection = "east"
		elseif ( enemyType == 2 and self.floor > 6 and self.floor <= 10 ) then
			self.tiles[x][y].objectType = "mole"
			self.tiles[x][y].objectDirection = "north"
		elseif ( enemyType == 2 and self.floor > 10 and self.floor <= 14 ) then
			self.tiles[x][y].objectType = "skeleton"
			self.tiles[x][y].objectDirection = "south"
		elseif ( enemyType == 2 and self.floor > 14 and self.floor <= 20 ) then
			self.tiles[x][y].objectType = "moose"
			self.tiles[x][y].objectDirection = "north"
		end
	end
	
	local rockCount = math.floor( self.floor / 2 ) + 1
	for r = 0, rockCount do
		local x, y		
		local isValidPlace = false
		
		while ( isValidPlace == false ) do
			x = math.random( 0, self.mapWidth )
			y = math.random( 0, self.mapHeight )
			isValidPlace = ( self.tiles[x][y].type == "ground" and self.tiles[x][y].objectType == nil )
		end
		
		self.tiles[x][y].objectType = "rock"
		self.tiles[x][y].generalType = "rock"
	end	
	
	-- Set up Object bitmaps
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			if ( self.tiles[x][y].objectType == "player" ) then
				self.player:setPosition( x * self.tileWidth, y * self.tileWidth )
			
			elseif ( self.tiles[x][y].objectType ~= nil and self.tiles[x][y].objectType ~= "none" ) then
			
				self.tiles[x][y].object = Bitmap.new( self.textures[self.tiles[x][y].objectType] )
				self.tiles[x][y].object:setPosition( x * self.tileWidth, y * self.tileWidth )
				
				self.tiles[x][y].label = TextField.new( GameMinerState.fonts.overhead, GameText:Get( "target", self.tiles[x][y].objectType ) )
				if ( self.tiles[endX][endY].objectType == "ladder" ) then
					self.tiles[x][y].label:setPosition( x * self.tileWidth, y * self.tileWidth )
				else
					self.tiles[x][y].label:setPosition( x * self.tileWidth - 10, y * self.tileWidth )
				end
				self.tiles[x][y].label:setTextColor( 0xFFFFFF )
				
			end
		end
	end
	
end

function MinerMap:GetHudActions()	
	-- What is on any given side of the player?
	local top, bottom, left, right
	
	local tileX, tileY = self.player:getPosition()
	tileX = tileX / self.tileWidth
	tileY = tileY / self.tileWidth
	
	--						1					2					3					4
	local tx = { tileX, 			tileX, 			tileX + 1, 	tileX - 1}
	local ty = { tileY + 1, 	tileY - 1, 	tileY, 			tileY }
	
	for i = 1, 4 do
		local x = tx[i]
		local y = ty[i]
		
		local value = "none"
	
		if ( self.tiles[x] ~= nil and self.tiles[x][y] ~= nil ) then		
			if ( self.tiles[x][y].objectType == "rock" ) then	
				value = "mine"
			elseif ( self.tiles[x][y].dead == false and 
					( self.tiles[x][y].objectType == "mushroom" or self.tiles[x][y].objectType == "bat"
					or self.tiles[x][y].objectType == "snail" or self.tiles[x][y].objectType == "rabbit"
					or self.tiles[x][y].objectType == "snake" or self.tiles[x][y].objectType == "mole"
					or self.tiles[x][y].objectType == "skeleton" or self.tiles[x][y].objectType == "moose" ) ) then
				value = "attack"
			elseif ( self.tiles[x][y].type == "ground" or self.tiles[x][y].dead == true ) then
				value = "move"
			end
		end
		
		if ( i == 1 ) then				bottom = value
		elseif ( i == 2 ) then		top = value
		elseif ( i == 3 ) then		right = value
		elseif ( i == 4 ) then		left = value
		end
	end
	
	return top, bottom, left, right
end

function MinerMap:Draw()
	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			stage:addChild( self.tiles[x][y].bitmap )	
			if ( self.tiles[x][y].object ~= nil ) then 	stage:addChild( self.tiles[x][y].object ) end
			if ( self.tiles[x][y].label ~= nil ) then		stage:addChild( self.tiles[x][y].label ) end
		end
	end
	
	self.player:Draw()
end

function MinerMap:GetTileCoordsInDirection( origX, origY, direction )
	local tileX = origX / self.tileWidth
	local tileY = origY / self.tileWidth
	local tx = tileX
	local ty = tileY
	
	if ( direction == "north" ) then			ty = tileY - 1	
	elseif ( direction == "south" ) then	ty = tileY + 1
	elseif ( direction == "west" ) then	tx = tileX - 1
	elseif ( direction == "east" ) then		tx = tileX + 1
	end
	
	return tx, ty
end

function MinerMap:UseSword( direction )
	self.player:Face( direction )
	local playerX, playerY = self.player:getPosition()
	local tileX, tileY = self:GetTileCoordsInDirection( playerX, playerY, direction )
	
	local x, y = self.tiles[tileX][tileY].object:getPosition()
	self.tiles[tileX][tileY].object:setColorTransform( 1, 0.5, 0.5, 0.5 )
	self.tiles[tileX][tileY].object:setRotation( 180 )
	self.tiles[tileX][tileY].object:setPosition( x + self.tileWidth, y + self.tileWidth )
	self.tiles[tileX][tileY].dead = true
	self.tiles[tileX][tileY].generalType = "none"
	
	return self.tiles[tileX][tileY].objectType
end

function MinerMap:UsePick( direction ) 
	self.player:Face( direction )
	local playerX, playerY = self.player:getPosition()
	local x, y = self:GetTileCoordsInDirection( playerX, playerY, direction )
	
	-- Choose what kind of item this is
	local itemType = math.random( 1, 3 )
	if ( itemType == 1 and self.floor > 0 and self.floor <= 4 ) then
		self.tiles[x][y].objectType = "copper"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 2 and self.floor > 2 and self.floor <= 6 ) then
		self.tiles[x][y].objectType = "silver"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 1 and self.floor > 4 and self.floor <= 8 ) then
		self.tiles[x][y].objectType = "gold"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 2 and self.floor > 6 and self.floor <= 10 ) then
		self.tiles[x][y].objectType = "amethyst"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 1 and self.floor > 8 and self.floor <= 12 ) then
		self.tiles[x][y].objectType = "sapphire"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 2 and self.floor > 10 and self.floor <= 14 ) then
		self.tiles[x][y].objectType = "diamond"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 1 and self.floor > 12 and self.floor <= 16 ) then
		self.tiles[x][y].objectType = "emerald"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 2 and self.floor > 14 and self.floor <= 20 ) then
		self.tiles[x][y].objectType = "ruby"
		self.tiles[x][y].generalType = "collectable"
	elseif ( itemType == 3 ) then
		-- Sandwich
		self.tiles[x][y].objectType = "sandwich"
		self.tiles[x][y].generalType = "collectable"
	end
	
	print( "Unveil object: ", self.tiles[x][y].objectType )
	self.tiles[x][y].object:setTexture( self.textures[self.tiles[x][y].objectType] )
	self.tiles[x][y].label:setText( GameText:Get( "target", self.tiles[x][y].objectType ) )
end

function MinerMap:MovePlayer( direction, amount )
	self.player:Move( direction, self.tileWidth )
	
	-- is the player touching a pickup item?
	local x, y = self.player:getPosition()
	x = x / self.tileWidth
	y = y / self.tileWidth
	
	local objectType = self.tiles[x][y].objectType
	
	local points = 0
	if 		( self.tiles[x][y].objectType == "copper" ) then
		points = 5
	elseif 	( self.tiles[x][y].objectType == "silver" ) then
		points = 10
	elseif 	( self.tiles[x][y].objectType == "gold" ) then
		points = 20
	elseif 	( self.tiles[x][y].objectType == "amethyst" ) then
		points = 50
	elseif 	( self.tiles[x][y].objectType == "sapphire" ) then
		points = 100
	elseif 	( self.tiles[x][y].objectType == "diamond" ) then
		points = 200
	elseif 	( self.tiles[x][y].objectType == "ruby" ) then
		points = 400
	elseif ( self.tiles[x][y].objectType == "sandwich" ) then
		self.player:AddHealth( 20 )
	end
	
	if ( points > 0 or self.tiles[x][y].objectType == "sandwich" ) then
		self.tiles[x][y].objectType = "none"
		stage:removeChild( self.tiles[x][y].object )
		stage:removeChild( self.tiles[x][y].label )
	end
	
	self:UpdateLighting()
	return points, objectType
end

function MinerMap:UpdateLighting()
	local playerX, playerY = self.player:getPosition()

	for y = 0, self.mapHeight do
		for x = 0, self.mapWidth do
			local r, g, b, a = self.tiles[x][y].bitmap:getColorTransform()
			local tileX, tileY = self.tiles[x][y].bitmap:getPosition()
			local distance = math.floor( self:GetDistance( tileX, tileY, playerX, playerY ) / 36 )

			r = 1 - ( 0.25 * ( distance - 1 ) )
			g = 1 - ( 0.25 * ( distance - 1 ) )
			b = 1 - ( 0.25 * ( distance - 1 ) )
			a = 1
			
			self.tiles[x][y].bitmap:setColorTransform( r, g, b, a )
			if ( self.tiles[x][y].label ~= nil ) then 		self.tiles[x][y].label:setColorTransform( r, g, b, a ) 			end
			if ( self.tiles[x][y].object ~= nil ) then 		self.tiles[x][y].object:setColorTransform( r, g, b, a ) 		end
			
		end
	end
end

function MinerMap:GetDistance( x1, y1, x2, y2 )
	local xd = x1 - x2
	local yd = y1 - y2
	return math.sqrt( xd * xd + yd * yd )
end

function MinerMap:Handle_EnterFrame()
	self.player:Update()
end

function MinerMap:TurnBasedUpdate()
	-- Move each enemy based on their behavior.
end

function MinerMap:SwapObjects( sx, sy, dx, dy )
	print( "Swap objects at ", sx, sy, " - ", dx, dy )
	
	self.tiles[dx][dy].object = self.tiles[sx][sy].object
	self.tiles[dx][dy].objectType = self.tiles[sx][sy].objectType
	self.tiles[dx][dy].generalType = self.tiles[sx][sy].generalType
	self.tiles[dx][dy].label = self.tiles[sx][sy].label
	
	self.tiles[sx][sy].object = nil
	self.tiles[sx][sy].objectType = nil
	self.tiles[sx][sy].generalType = nil
	self.tiles[sx][sy].label = nil
end

