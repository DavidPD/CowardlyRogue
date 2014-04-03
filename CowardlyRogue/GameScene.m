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
#import "Dwarf.h"
#import "DwarfSprite.h"

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
		self.targets = [NSMutableArray array];
		self.entities = [NSMutableArray array];
		
		self.userInteractionEnabled = TRUE;
		
        self.tileMap = [CCTiledMap tiledMapWithFile:@"Level.tmx"];
		
		[self addChild:self.tileMap];
		
		self.player = [[Knight alloc] initWithPosition:ccp(2, 13)];
		[self.entities addObject:self.player];
//		[self.player move:ccp(1, 1)];
		self.knightSprite = [[KnightSprite alloc] initWithKnight:self.player tileMap:self.tileMap];
		
		Dwarf *dwarf = [[Dwarf alloc] initWithPosition:ccp(7, 13)];
		DwarfSprite *sp = [[DwarfSprite alloc] initWithDwarf:dwarf tileMap:self.tileMap];
		[self.entities addObject:dwarf];
		
		[self.tileMap addChild:self.knightSprite];
		[self.tileMap addChild:sp];
		
		self.scale = 3.0;
		
		[self generateTargets];
	}
	
	return self;
}

- (void)generateTargets
{
	CGPoint adjacents[] = {ccp(1,0), ccp(0,-1), ccp(-1,0), ccp(0,1)};
	for (int i = 0; i < 4; i++)
	{
		CGPoint tile = ccpAdd(self.player.position, adjacents[i]);
		CGPoint pos = [[self.tileMap layerNamed:@"Game"] positionAt:tile];
		CCSprite *target = [CCSprite spriteWithImageNamed:@"target.png"];
		target.texture.antialiased = false;
		target.position = pos;
		target.anchorPoint = CGPointZero;
		target.opacity = 0;
		[target runAction:[CCActionFadeIn actionWithDuration:0.2]];
		[self.tileMap addChild:target];
		[self.targets addObject:target];
	}
}

- (void)clearTargets
{
	CCActionFiniteTime *remove = [CCActionSequence actions:[CCActionFadeOut actionWithDuration:0.2f], [CCActionRemove action], nil];
	[self.targets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		[obj runAction:[remove copy]];
	}];
	[self.targets removeAllObjects];
}

- (void)resetTargets
{
	[self clearTargets];
	[self generateTargets];
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
		[self resetTargets];
	}
}

@end
