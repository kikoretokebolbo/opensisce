//
//  WeekViewController.h
//  openSiS
//
//  Created by os4ed on 12/14/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthViewController.h"
@interface MonthViewController: UIViewController
{
    IBOutlet UILabel *label_nodata;
    IBOutlet UIView *view1;
    NSString *date_value;
}

@property (strong) NSString *studentID;

@end
