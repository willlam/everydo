//
//  Todo.h
//  everydo
//
//  Created by William Lam on 2016-03-22.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic) NSInteger priority;
@property (nonatomic) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title
				  description:(NSString *)todoDescription
					 priority:(NSInteger)priority
			   andIsCompleted:(BOOL)isCompleted;

@end
