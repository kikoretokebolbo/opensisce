//
//  TeacherDashboardViewController.h
//  openSiS
//
//  Created by EjobIndia on 17/08/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface attendencedetail: UIViewController<UIGestureRecognizerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
    BOOL   c_ap,t;
    IBOutlet  UILabel *nodata;
   
    
    IBOutlet UILabel *lbl_date,*show_title;
    NSInteger   selectedIndexpath;
    
    NSString *total_msg,*staff_id,*SYEAR,*CURRENT_SCHOOL_ID;
    NSMutableArray *ary_data;
    IBOutlet UIImageView *img_profile;
    IBOutlet UIView *newView,*baseView, *topView, *labelView, *bottomView;
    IBOutlet UIButton *Xbutton;
    int  slidewidth,slideheight;
    int flag,k,change,incdecheight,scroller;
    float z;
    IBOutlet UITextField *currentSchool,*schoolYear,*term,*subject,*course,*coursePeriod, *courseperiodName;
    IBOutlet UIImageView *profileImage;
    IBOutlet UILabel *lbl_username, *lbl_useremail, *lbl_currentDate, *lbl_lvlview_drop, *lbl_notification1,*lbl_notification2,*lbl_cell_date;
 
     UIPickerView *selectcustomerpicker;
    
    NSMutableArray *c_school,*c_school_title,*c_school_id,*school_year,*school_year_title,*school_year_id,*marking_period,*marking_period_title,*marking_period_id,*subject_ary,*subject_title,*subject_id,*course_ary,*course_title,*course_id,*course_period_ary,*course_period_title,*course_period_id,*ary_data1,*atten_id,*state_code,*arr_data_code;
    
    NSString *str_c_school_id123,*school_year123,*period123,*sub123,*cou123,*coperiod;
    IBOutlet UITableView *mtable;
    
    IBOutlet UIImageView *img;
    IBOutlet UILabel *lbl;
   
    IBOutlet UITextField *lbl_hidden;
    
    IBOutlet UILabel *notofi,*msg_count;
    IBOutlet UIView *transparentView;
    
    IBOutlet UILabel *msg_count_tab;
    IBOutlet UIPickerView *pick12;
    IBOutlet UIView *view1236;
    
   NSArray * sortedArray;
}

@property(strong,nonatomic)NSString *str_date,*cpv_id,*staff_id,*school_id,*STR_TITLE;


@property(strong,nonatomic)NSMutableDictionary *dic,*dic_techinfo,*allvalue;
@property(retain,nonatomic) NSMutableArray *arr_data,*ary_data1,*data12,*stu_id,*atten_code;
@property(strong,nonatomic) IBOutlet UIImageView *img_profile;
-(IBAction)click:(id)sender;
-(IBAction)close:(id)sender;
-(IBAction)ok:(id)sender;
-(IBAction)logout:(id)sender;
-(IBAction)alertOK:(id)sender;
@end
