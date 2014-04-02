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

- (id)initWithPosition:(CGPoint)position
{
	if ((self = [super init]))
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
