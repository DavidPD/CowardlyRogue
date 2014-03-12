//
//  KnightTests.m
//  CowardlyRogue
//
//  Created by David Dovel on 3/11/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Knight.h"
#import "cocos2d.h"

@interface KnightTests : XCTestCase
@property (nonatomic, strong) Knight *knight;
@end

@implementation KnightTests

- (void)setUp
{
    [super setUp];
	self.knight = [[Knight alloc] init];
}

- (void)tearDown
{
	self.knight = nil;
    [super tearDown];
}

- (void)testMove
{
	Knight *knight = self.knight;
	
	[knight move:ccp(1,0)];
	XCTAssertEqual(knight.position, ccp(1,0),
				   @"Knight position (%f,%f) should have moved to 1,0",
				   knight.position.x, knight.position.y);
}

@end
