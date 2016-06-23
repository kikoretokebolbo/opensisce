//
//  WeekViewController.h
//  openSiS
//
//  Created by os4ed on 12/14/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeekViewController : UIViewController
{
    IBOutlet UILabel *label_nodata;
    IBOutlet UILabel *label_titleforthisPage;
}

@property (strong) NSString *studentID;
@property (strong) NSString *studentName;
@end
