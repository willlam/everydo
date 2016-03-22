//
//  DetailViewController.h
//  everydo
//
//  Created by William Lam on 2016-03-22.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

