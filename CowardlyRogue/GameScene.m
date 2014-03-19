//
//  GameScene.m
//  CowardlyRogue
//
//  Created by David Dovel on 3/14/14.
//  Copyright 2014 QBobble. All rights reserved.
//

#import "GameScene.h"
#import "Knight.h"
#import "KnightSprite.h"

@interface GameScene ()

@property (nonatomic, strong) CCTiledMap *tileMap;
@property (nonatomic, strong) Knight *player;
@property (nonatomic, strong) KnightSprite *knightSprite;

@end

@implementation GameScene

+ (CCScene *)scene
{
	return [[GameScene alloc] init];
}

- (id)init
{
	if ((self = [super init]))
	{
		self.userInteractionEnabled = TRUE;
		
        self.tileMap = [CCTiledMap tiledMapWithFile:@"Level.tmx"];
		
		[self addChild:self.tileMap];
		
		self.player = [[Knight alloc] initWithPosition:ccp(2, 13)];
//		[self.player move:ccp(1, 1)];
		self.knightSprite = [[KnightSprite alloc] initWithKnight:self.player tileMap:self.tileMap];
		
		[self.tileMap addChild:self.knightSprite];
		
		self.scale = 3.0;
	}
	
	return self;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint location = [touch locationInNode:self.tileMap];
	
	CGPoint tile = ccp(floorf(location.x / self.tileMap.tileSize.width),
					   floorf(self.tileMap.mapSize.height - location.y / self.tileMap.tileSize.height));
	
	if (ccpDistance(self.player.position, tile) <= 1.0)
	{
		[self.player move:ccpSub(tile, self.player.position)];
		[self.knightSprite update];
	}
}

@end
