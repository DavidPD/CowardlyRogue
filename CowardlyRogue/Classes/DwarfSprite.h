//
//  DwarfSprite.h
//  CowardlyRogue
//
//  Created by David Dovel on 4/3/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Dwarf.h"

@interface DwarfSprite : CCNode

@property (nonatomic, strong) Dwarf *dwarf;
@property (nonatomic, strong) CCTiledMap *tileMap;

- (id)initWithDwarf:(Dwarf *)dwarf;
- (id)initWithDwarf:(Dwarf *)dwarf tileMap:(CCTiledMap *)tileMap;

- (void)update;

@end
