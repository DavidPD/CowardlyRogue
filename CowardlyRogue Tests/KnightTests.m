//
//  KnightTests.m
//  CowardlyRogue
//
//  Created by David Dovel on 3/11/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Knight.h"

@interface KnightTests : XCTestCase
@property (nonatomic, strong) Knight *knight;
@end

@implementation KnightTests

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

- (void)testMove
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
