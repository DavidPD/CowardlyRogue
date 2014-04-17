//
//  EntityAction.h
//  CowardlyRogue
//
//  Created by David Dovel on 4/12/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entity;

typedef enum
{
	kEntityActionTypeNone,
	kEntityActionTypeMove,
	kEntityActionTypeAttack
}EntityActionType;

@interface EntityAction : NSObject

@property (nonatomic) EntityActionType actionType;
@property (nonatomic) CGPoint startPosition;
@property (nonatomic) CGPoint targetPosition;
@property (nonatomic, strong) Entity *target;

- (id)initWithActionType:(EntityActionType)type startPosition:(CGPoint)startPosition targetPosition:(CGPoint)targetPosition target:(Entity*)target;

- (id)initWithActionType:(EntityActionType)type target:(Entity*)target;

- (id)initWithStartPosition:(CGPoint)startPosition targetPosition:(CGPoint)targetPosition;

@end
