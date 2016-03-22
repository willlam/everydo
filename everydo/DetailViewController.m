//
//  DetailViewController.m
//  everydo
//
//  Created by William Lam on 2016-03-22.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	        
	    // Update the view.
	    [self configureView];
	}
}

- (void)configureView {
	// Update the user interface for the detail item.
	if (self.detailItem) {
		self.titleLabel.text = self.detailItem.title;
		self.descriptionLabel.text = self.detailItem.todoDescription;
		// self.priorityLabel.text = /*@(todo.priority).stringValue */;
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
