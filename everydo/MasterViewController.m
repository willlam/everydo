//
//  MasterViewController.m
//  everydo
//
//  Created by William Lam on 2016-03-22.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TableViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSMutableArray *todoObjects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	[self prepareTodoObjects];
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
	if (!self.objects) {
	    self.objects = [[NSMutableArray alloc] init];
	}
	[self.objects insertObject:[NSDate date] atIndex:0];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Preparation


// 1.

- (void) prepareTodoObjects {
	Todo *todo1 = [[Todo alloc] initWithTitle:@"Pick up milk" description:@"Pick up lactose free milk" priority:3 andIsCompleted:NO];
	Todo *todo2 = [[Todo alloc] initWithTitle:@"Finish taxes" description:@"Complete by April 30, 2016 - talk to Amitabh" priority:1 andIsCompleted:NO];
	Todo *todo3 = [[Todo alloc] initWithTitle:@"Finish EveryDo Assignment!" description:@"An assignment on how to do tableviews" priority:1 andIsCompleted:NO];
	
	self.todoObjects = [[NSMutableArray alloc] init];
	
	[self.todoObjects addObjectsFromArray:@[todo1, todo2, todo3]];
	
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDate *object = self.objects[indexPath.row];
	    DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
	    [controller setDetailItem:object];
	}
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// 2

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.todoObjects.count;
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// get object associated with row
	
	Todo *todo = self.todoObjects[indexPath.row];
	
	
	// get cell using identifier
	TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell"];

	// NSDate *object = self.todoObjects[indexPath.row];
	
	// customize the cell
	
	cell.titleLabel.text = todo.title;
	cell.descriptionLabel.text = todo.todoDescription;
	cell.priorityLabel.text = @(todo.priority).stringValue;
	// cell.isCompletedLabel.text = @(todo.priority).boolValue;
	
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
	    [self.objects removeObjectAtIndex:indexPath.row];
	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	}
}





@end
