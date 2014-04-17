//
//  Entity.m
//  
//
//  Created by David Dovel on 3/27/14.
//
//

#import "Entity.h"
#import "cocos2d.h"
#import "EntityAction.h"

@implementation Entity

- (id)init
{
	if ((self = [super init]))
	{
		self.alive = true;
		self.health = 5;
		self.maxHealth = 5;
		self.strength = 1;
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
	CGPoint pos = self.position;
	self.position = ccpAdd(pos, directions);
	
	self.prevAction = [[EntityAction alloc] initWithStartPosition:pos targetPosition:self.position];
	self.prevAction.actionType = kEntityActionTypeMove;
}

- (void)takeDamage:(int)damage
{
	self.health = MAX(self.health - damage, 0);
	
	if (self.health == 0) [self die];
}

- (void)attackEntity:(Entity *)entity
{
	[entity takeDamage:self.strength];
	
	self.prevAction = [[EntityAction alloc] initWithActionType:kEntityActionTypeAttack startPosition:self.position targetPosition:entity.position target:entity];
}

- (void)die
{
	self.alive = false;
}

@end
