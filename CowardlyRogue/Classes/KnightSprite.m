//
//  KnightSprite.m
//  CowardlyRogue
//
//  Created by David Dovel on 3/12/14.
//  Copyright 2014 QBobble. All rights reserved.
//

#import "KnightSprite.h"
#import "Knight.h"

@interface KnightSprite ()

@property (nonatomic, strong) CCSprite *sprite;

@end

@implementation KnightSprite

- (id)initWithKnight:(Knight *)knight
{
	return [self initWithKnight:knight tileMap:nil];
}

- (id)initWithKnight:(Knight *)knight tileMap:(CCTiledMap *)tileMap
{
	if ((self = [super init]))
	{
        self.knight = knight;
		self.tileMap = tileMap;
		self.position = [self convertKnightTilePosition];
		
		self.sprite = [CCSprite spriteWithImageNamed:@"Knight.png"];
		self.sprite.texture.antialiased = false;
		self.sprite.anchorPoint = CGPointZero;
		[self addChild:self.sprite];
	}
	
	return self;
}

- (void)update
{
	[self runAction:[CCActionMoveTo actionWithDuration:0.14 position:[self convertKnightTilePosition]]];
}

- (CGPoint)convertKnightTilePosition
{
	if (self.tileMap)
//		return ccpMult(ccp(self.knight.position.x, (self.tileMap.mapSize.height - self.knight.position.y - 1)), 16);
		return [[self.tileMap layerNamed:@"Game"] positionAt:self.knight.position];
	else
		return ccpMult(self.knight.position, 16);
}

@end
