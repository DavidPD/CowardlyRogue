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
#import "EntityAction.h"

@interface EntityTest : XCTestCase
@property (nonatomic, strong)Entity *entity;
@property (nonatomic, strong)Entity *target;
@end

@implementation EntityTest

- (void)setUp
{
    [super setUp];
	self.entity = [[Entity alloc] init];
	self.target = [[Entity alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark -
#pragma mark Initialization Tests

- (void)testInitialPosition
{
	Entity *entity = [[Entity alloc] initWithPosition: ccp(4, 13)];
	XCTAssertTrue(CGPointEqualToPoint(entity.position, ccp(4, 13)), @"Entity's position (%f,%f) is incorrect (should be 4,13)",
				  entity.position.x, entity.position.y);
}

- (void)testInitialHealth
{
	Entity *entity = [[Entity alloc] init];
	
	XCTAssertEqual(5, entity.health, @"Entity starting health expected to be 5");
}

- (void)testInitialMaxHealth
{
	Entity *entity = [[Entity alloc] init];
	
	XCTAssertEqual(5, entity.maxHealth, @"Entity starting max health expected to be 5");
}

- (void)testInitialStrength
{
	Entity *entity = [[Entity alloc] init];
	
	XCTAssertEqual(1, entity.strength, @"Entity starting strength expected to be 1");
}

- (void)testInitiallyAlive
{
	Entity *entity = [[Entity alloc] init];
	
	XCTAssertTrue(entity.alive, @"Entity expected to be alive initially");
}

#pragma mark -
#pragma mark State Modification Tests

- (void)testMove
{
	Entity *entity = [[Entity alloc] init];
	
	[entity move:ccp(1,0)];
	XCTAssertTrue(CGPointEqualToPoint(entity.position, ccp(1,0)),
				  @"Entity position (%f,%f) should have moved to 1,0",
				  entity.position.x, entity.position.y);
}

- (void)testShouldTakeDamage
{
	Entity *entity = [[Entity alloc] init];
	
	[entity takeDamage:2];
	
	XCTAssertEqual(3, entity.health, @"Entity Health expected to be 3 after taking 2 damage");
}

- (void)testShouldClampHealthAtZero
{
	Entity *entity = [[Entity alloc] init];
	
	[entity takeDamage:6];
	
	XCTAssertEqual(0, entity.health, @"Entity health expected to stop decreasing at 0");
}

- (void)testAttackShouldDealDamage
{
	[self.entity attackEntity:self.target];
	
	XCTAssertEqual(4, self.target.health, @"Attack expected to deal 1 damage to target (%d health), leaving it with 4 health", self.target.health);
}

- (void)testFatalAttackShouldKillTarget
{
	self.entity.strength = 1000;
	
	[self.entity attackEntity:self.target];
	
	XCTAssertTrue(!self.target.alive, @"target should have died from that blow");
}

- (void)testAttackShouldSetPreviousActionTarget
{
	[self.entity attackEntity:self.target];
	
	XCTAssertTrue(self.entity.prevAction.target == self.target, @"Entity's previous action expected to contain 'target' as the target");
}

- (void)testAttackShouldSetPreviousActionType
{
	[self.entity attackEntity:self.target];
	
	XCTAssertTrue(self.entity.prevAction.actionType == kEntityActionTypeAttack, @"Entity's previous action expected to be an attack");
}

- (void)testMoveShouldSetPrevActionPosition
{

}

@end
