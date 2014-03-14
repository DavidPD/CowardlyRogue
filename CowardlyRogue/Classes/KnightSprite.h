//
//  KnightSprite.h
//  CowardlyRogue
//
//  Created by David Dovel on 3/12/14.
//  Copyright 2014 QBobble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Knight;

@interface KnightSprite : CCNode

@property (nonatomic, strong) Knight *knight;

- (id)initWithKnight:(Knight *)knight;

- (void)update;

@end
