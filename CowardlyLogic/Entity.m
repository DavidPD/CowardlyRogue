//
//  Entity.m
//  
//
//  Created by David Dovel on 3/27/14.
//
//

#import "Entity.h"
#import "cocos2d.h"

@implementation Entity

- (id)init
{
	if ((self = [super init]))
	{
		self.health = 5;
		self.maxHealth = 5;
	}
	
	return self;
}

- (id)initWithPosition:(CGPoint)position
{
	if ((self = [self init]))
	{
        self.position = position;
	}
	
	return self;
}

- (void)move:(CGPoint)directions
{
	self.position = ccpAdd(self.position, directions);
}

@end
