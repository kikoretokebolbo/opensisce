//
//  MyInformationCertification.h
//  openSiS
//
//  Created by os4ed on 1/11/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  comment: UIViewController

{
    NSString *STAFF_ID_K;
    IBOutlet UILabel *calendar_name,*rolling;
    IBOutlet UIView *view_upper;
    NSString *edit_flag;
    
    NSString *comment_id;
    IBOutlet UIButton *btn_add,*btn_close;
    
    IBOutlet UIView *view_header;

}
@property(strong,nonatomic)NSString *studentID,*studentName;
@end
