//
//  KnightSprite.m
//  CowardlyRogue
//
//  Created by David Dovel on 3/12/14.
//  Copyright 2014 QBobble. All rights reserved.
//

#import "KnightSprite.h"
#import "Knight.h"

@implementation KnightSprite

- (id)initWithKnight:(Knight *)knight
{
	if ((self = [super init]))
	{
        self.knight = knight;
		self.position = [self convertKnightTilePosition];
	}
	
	return self;
}

- (CGPoint)convertKnightTilePosition
{
	return ccpMult(self.knight.position, 16);
}

@end
