//
//  EntityTest.m
//  CowardlyRogue
//
//  Created by David Dovel on 3/27/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "cocos2d.h"
#import "Entity.h"

@interface EntityTest : XCTestCase

@end

@implementation EntityTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitialPosition
{
	Entity *entity = [[Entity alloc] initWithPosition: ccp(4, 13)];
	XCTAssertTrue(CGPointEqualToPoint(entity.position, ccp(4, 13)), @"Entity's position (%f,%f) is incorrect (should be 4,13)",
				  entity.position.x, entity.position.y);
}

- (void)testMove
{
	Entity *entity = [[Entity alloc] init];
	
	[entity move:ccp(1,0)];
	XCTAssertTrue(CGPointEqualToPoint(entity.position, ccp(1,0)),
				  @"Entity position (%f,%f) should have moved to 1,0",
				  entity.position.x, entity.position.y);
}


@end
