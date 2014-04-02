//
//  Entity.h
//  
//
//  Created by David Dovel on 3/27/14.
//
//

@interface Entity : NSObject

@property (nonatomic)CGPoint position;

- (id)initWithPosition:(CGPoint)position;

- (void)move:(CGPoint)direction;

@end
