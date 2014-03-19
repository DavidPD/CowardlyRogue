//
//  Knight.h
//  CowardlyRogue
//
//  Created by David Dovel on 3/11/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Knight : NSObject

@property (nonatomic)CGPoint position;

- (id)initWithPosition:(CGPoint)position;

- (void)move:(CGPoint)direction;


@end
