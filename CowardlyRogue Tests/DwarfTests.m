//
//  DwarfTests.m
//  CowardlyRogue
//
//  Created by David Dovel on 4/3/14.
//  Copyright (c) 2014 QBobble. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dwarf.h"

@interface DwarfTests : XCTestCase

@end

@implementation DwarfTests

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

- (void)testInitialMaxHealth
{
	Dwarf *dwarf = [[Dwarf alloc] init];
	
	XCTAssertEqual(3, dwarf.maxHealth, @"The dwarf's max health should be 3");
}

- (void)testInitialHealth
{
	Dwarf *dwarf = [[Dwarf alloc] init];
	
	XCTAssertEqual(3, dwarf.health, @"Dwarf's health should be 3");
}

@end
