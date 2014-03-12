//
//  Knight.m
//  CowardlyRogue
//
//  Created by David Dovel on 3/11/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import "Knight.h"
#import "cocos2d.h"

@implementation Knight

- (void)move:(CGPoint)directions
{
	self.position = ccpAdd(self.position, directions);
}

@end
