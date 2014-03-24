//
//  GameScene.h
//  CowardlyRogue
//
//  Created by David Dovel on 3/14/14.
//  Copyright 2014 QBobble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameScene : CCScene

+ (CCScene *)scene;

@property (nonatomic, strong) NSMutableArray *targets;

@end
