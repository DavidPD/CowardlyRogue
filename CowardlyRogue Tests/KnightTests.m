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

- (void)testInitialPosition
{
	Knight *knight = [[Knight alloc] initWithPosition: ccp(4, 13)];
	XCTAssertTrue(CGPointEqualToPoint(knight.position, ccp(4, 13)), @"knight's position (%f,%f) is incorrect (should be 4,13)",
				   knight.position.x, knight.position.y);
}

- (void)testInitialStrength
{
	Knight *knight = [[Knight alloc] init];
	
	XCTAssertEqual(2, knight.strength, @"Knight expected to start with 2 strength, had %d instead", knight.strength);
}

- (void)testMove
{
	Knight *knight = self.knight;
	
	[knight move:ccp(1,0)];
	XCTAssertTrue(CGPointEqualToPoint(knight.position, ccp(1,0)),
				   @"Knight position (%f,%f) should have moved to 1,0",
				   knight.position.x, knight.position.y);
}

@end
