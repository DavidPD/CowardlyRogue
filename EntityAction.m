//
//  EntityAction.m
//  CowardlyRogue
//
//  Created by David Dovel on 4/12/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import "EntityAction.h"

@implementation EntityAction

- (id)initWithActionType:(EntityActionType)type startPosition:(CGPoint)startPosition targetPosition:(CGPoint)targetPosition target:(Entity *)target
{
	if ((self = [super init]))
	{
        self.actionType = type;
		self.startPosition = startPosition;
		self.targetPosition = targetPosition;
		self.target = target;
	}
	
	return self;
}

- (id)initWithActionType:(EntityActionType)type target:(Entity *)target
{
	return [self initWithActionType:type startPosition:CGPointZero targetPosition:CGPointZero target:target];
}

- (id)initWithStartPosition:(CGPoint)startPosition targetPosition:(CGPoint)targetPosition
{
	//defaults to move
	return [self initWithActionType:kEntityActionTypeMove startPosition:startPosition targetPosition:targetPosition target:nil];
}

@end
