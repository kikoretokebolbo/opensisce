//
//  WeekViewController.h
//  openSiS
//
//  Created by os4ed on 12/14/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Month1ViewController.h"
@interface Month1ViewController: UIViewController
{
    
    NSString *flag_i;
    IBOutlet UILabel *label_nodata;
    IBOutlet UIView *view1;
    IBOutlet UILabel *label_titleforthisPage;
    NSString *date_value;
    
    IBOutlet UIView *view_cal,*view_assign;
    IBOutlet UITextField *txt_cal,*txt_assign;
    NSMutableArray *ary_data,*ary_data_title,*ary_data_id,*ary_assign;
    UIPickerView *  selectcustomerpicker;
    NSString *flag,*school_id;
    NSString *inbox_data;
    int flag1;
    NSString *assignment_data,*calendar_id;
    
    
}
@property (strong) NSString *studentName;
@property (strong) NSString *studentID;

@end
