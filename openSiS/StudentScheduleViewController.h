//
//  StudentScheduleViewController.h
//  openSiS
//
//  Created by os4ed on 12/10/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentScheduleViewController : UIViewController
{
    IBOutlet UILabel *label_nodata;
    IBOutlet UILabel *label_titleforthisPage;
}

@property (strong) NSString *studentName;
@property (strong) NSString *studentID;

@end
