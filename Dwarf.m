//
//  Dwarf.m
//  CowardlyRogue
//
//  Created by David Dovel on 4/3/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import "Dwarf.h"

@implementation Dwarf

- (id)init
{
	if ((self = [super init]))
	{
        self.maxHealth = self.health = 3;
	}
	
	return self;
}

@end
