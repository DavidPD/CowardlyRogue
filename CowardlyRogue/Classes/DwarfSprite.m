//
//  DwarfSprite.m
//  CowardlyRogue
//
//  Created by David Dovel on 4/3/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import "DwarfSprite.h"

@interface DwarfSprite ()

@property (nonatomic, strong) CCSprite *sprite;

@end


@implementation DwarfSprite

- (id)initWithDwarf:(Dwarf *)dwarf
{
	return [self initWithDwarf:dwarf tileMap:nil];
}

- (id)initWithDwarf:(Dwarf *)dwarf tileMap:(CCTiledMap *)tileMap
{
	if ((self = [super init]))
	{
        self.dwarf = dwarf;
		self.tileMap = tileMap;
		self.position = [self convertDwarfTilePosition];
		
		self.sprite = [CCSprite spriteWithImageNamed:@"Dwarf1.png"];
		self.sprite.texture.antialiased = false;
		self.sprite.anchorPoint = CGPointZero;
		[self addChild:self.sprite];
	}
	
	return self;
}

- (void)update
{
	if (self.dwarf.alive)
		[self runAction:[CCActionMoveTo actionWithDuration:0.14 position:[self convertDwarfTilePosition]]];
	else
		[self runAction:[CCActionSequence actionOne:[CCActionFadeOut actionWithDuration:0.1] two:[CCActionRemove action]]];
}

- (CGPoint)convertDwarfTilePosition
{
	if (self.tileMap)
		//		return ccpMult(ccp(self.knight.position.x, (self.tileMap.mapSize.height - self.knight.position.y - 1)), 16);
		return [[self.tileMap layerNamed:@"Game"] positionAt:self.dwarf.position];
	else
		return ccpMult(self.dwarf.position, 16);
}

@end
