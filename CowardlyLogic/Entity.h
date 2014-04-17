//
//  Entity.h
//  
//
//  Created by David Dovel on 3/27/14.
//
//

#import <Foundation/Foundation.h>

@class Entity;
@class EntityAction;

@interface Entity : NSObject

@property (nonatomic)CGPoint position;
@property (nonatomic)int health;
@property (nonatomic)int maxHealth;
@property (nonatomic)EntityAction *prevAction;

@property (nonatomic)BOOL alive;

@property (nonatomic)int strength; //Controls how much melee damage the entity does upon attacking.

- (id)initWithPosition:(CGPoint)position;

- (void)move:(CGPoint)direction;

- (void)attackEntity:(Entity *)entity;

- (void)takeDamage:(int)damage;

- (void)die;


@end
