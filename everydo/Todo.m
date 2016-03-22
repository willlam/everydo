//
//  Todo.m
//  everydo
//
//  Created by William Lam on 2016-03-22.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title
				  description:(NSString *)todoDescription
					 priority:(NSInteger)priority
			   andIsCompleted:(BOOL)isCompleted
{
	self = [super init];
	if (self) {
		_title = title;
		_todoDescription = todoDescription;
		_priority = priority;
		_isCompleted = NO;
	}
	return self;
}

@end
