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
@property (nonatomic, strong) Knight *knight;
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
        self.tileMap = [CCTiledMap tiledMapWithFile:@"Level.tmx"];
		
	}
	
	return self;
}

@end
