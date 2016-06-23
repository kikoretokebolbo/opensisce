//
//  MyInformationCertification.m
//  openSiS
//
//  Created by os4ed on 1/11/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//
#import "AdvancedStudentScheduleController.h"
#import "Student.h"
#import "TeacherDashboardViewController.h"
#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"
#import "Advancedstd.h"
#import "MystdInformationGeneral.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "ip_url.h"
#import <MapKit/MapKit.h>
#import "mapkitViewController.h"
#import "MyInformationAddress.h"
#import "MyInformationCertification.h"
#import "MyInformationSchoolInfo.h"
#import "TeacherDashboardViewController.h"
#import "SettingsMenu.h"
#import "parents.h"
#import "MyInformationCertification.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "ip_url.h"

#import "TeacherDashboardViewController.h"
#import "MyInformationAddress.h"
#import "MyInformationGeneral.h"
#import "MyInformationSchoolInfo.h"
#import "MyInformationCertificationCell.h"
#import "enroll.h"
#import "comment.h"
#import "stdadd.h"
#import "NSString+SBJSON.h"
#import "NSObject+SBJSON.h"
#import "goal.h"
#import "goaledit.h"
#import "prog.h"
#import "progedit.h"
@interface progedit()
<UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

{
    
    UIPickerView *picker1, *picker2,*picker3;
    NSString *goal_id1,*p_id,*p_scale_id;
    NSString  *end_date;
    IBOutlet UILabel *LBL_TITLE;
    IBOutlet UIButton *btn_cancel,*btn_update;
    UIDatePicker *datePicker1,*datePicker2;
    NSString *date_string,*assign_flag;
    int multiheight;
    IBOutlet  UIView *view_info;
    NSString *end_date_flag;
    NSIndexPath *currentIndex;
    NSString *GOAL_NAME,*CP_NAME,*SCALE;
    NSString *FLAG_G,*FLAG_CP,*FLAG_S;
    NSMutableArray *goal_ary,*cp_ary,*p_scale123;

}
@property (weak, nonatomic) IBOutlet UITextField *P_SCALE;
@property (weak, nonatomic) IBOutlet UITextField *PP_NAME;
@property (weak, nonatomic) IBOutlet UITextField *COURSE_PERIOD;
@property (strong, nonatomic) IBOutlet UIView *view_onlongpress;
@property (weak, nonatomic) IBOutlet UILabel *lbl_TopTitle;
@property (weak, nonatomic) IBOutlet UITableView *table_cert;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment_menu;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_viewforSegment;
@property (strong, nonatomic) IBOutlet UITextField *date_value;
@property (strong, nonatomic) IBOutlet UITextView *txt_view;
@property (strong, nonatomic) IBOutlet UITextField *GOAL_TITLE;
@property (strong, nonatomic) IBOutlet UIView *VIEW_STARTDATE;
@property (strong, nonatomic) IBOutlet UIView *view_enddate;
@property (strong, nonatomic) IBOutlet UITextField *end_date;
@property (strong, nonatomic) IBOutlet UILabel *nodatafound;
@property (strong, nonatomic) IBOutlet UILabel *goal_name123;

@end

@implementation progedit
{
    NSMutableArray *array_cert;
}

-(void)loadPicker1{
    
    picker1 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    picker1  .delegate = self;
    picker1 .dataSource = self;
    
    [ picker1  setShowsSelectionIndicator:YES];
     picker1.tag=1;
    self.GOAL_TITLE.inputView = picker1;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismisspicker5)];
    
    [barItems addObject:doneBtn];
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    self.GOAL_TITLE.inputAccessoryView = mypickerToolbar;
    
}
-(void)loadPicker2{
    
    picker2 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    picker2  .delegate = self;
    picker2 .dataSource = self;
    
    [ picker2  setShowsSelectionIndicator:YES];
     picker2.tag=2;
    self.COURSE_PERIOD.inputView = picker2;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismisspicker6)];
    
    [barItems addObject:doneBtn];
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    self.COURSE_PERIOD.inputAccessoryView = mypickerToolbar;
    
}

-(void)loadPicker3{
    
    picker2 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    picker2  .delegate = self;
    picker2 .dataSource = self;
    
    [ picker2  setShowsSelectionIndicator:YES];
    picker2.tag=3;
    self.P_SCALE.inputView = picker2;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismisspicker7)];
    
    [barItems addObject:doneBtn];
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    self.P_SCALE.inputAccessoryView = mypickerToolbar;
    
}


- (void)dismisspicker5
{
    if ([FLAG_G isEqualToString:@"1"]) {
        self.GOAL_TITLE.text=GOAL_NAME;
        NSLog(@"ID-----%@",goal_id1);
    }
    else
    {
        
    }
    [self.GOAL_TITLE resignFirstResponder];
    
}
- (void)dismisspicker6
{
    if ([FLAG_CP isEqualToString:@"1"]) {
        self.COURSE_PERIOD.text=CP_NAME;
        NSLog(@"ID-----%@",p_id);
    }
    else
    {
       
    }
     [self.COURSE_PERIOD resignFirstResponder];
    
}


- (void)dismisspicker7
{
    if ([FLAG_S isEqualToString:@"1"]) {
        self.P_SCALE.text=SCALE;
        NSLog(@"ID-----%@",p_scale_id);
    }
    else
    {
        
    }
    [self.P_SCALE resignFirstResponder];
    
}
- (IBAction)dhongsho:(id)sender {
    
    NSLog(@"Button ta kintu click hocche");
    [self uptable];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{


    [textField resignFirstResponder];
    return YES;

}
-(void)viewWillAppear:(BOOL)animated
{
    if (self.view.frame.size.height == 568) {
        multiheight = 32;
    }
    else if (self.view.frame.size.height == 667)
    {
        multiheight = 37;
    }
    else if (self.view.frame.size.height == 736)
    {
        multiheight = 41;
    }
    [self.view_onlongpress removeFromSuperview];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50.0f;

}
-(void)uptable
{
    
    [UIView animateWithDuration:0.5f animations:^{
        view_info.frame =
        CGRectMake(view_info.frame.origin.x,
                   view_info.frame.origin.y,
                   view_info.frame.size.width,
                   view_info.frame.size.height - multiheight);
        
    }];
    
    [UIView animateWithDuration:0.5f animations:^{
      _table_cert.frame =
        CGRectMake( _table_cert.frame.origin.x,
                   _table_cert.frame.origin.y - multiheight,
                   _table_cert.frame.size.width,
                   _table_cert.frame.size.height+multiheight);
        
    }];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{


    if (buttonIndex==0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //[MBProgressHUD hideHUDForView:self.view animated:YES];
                [self performSelector:@selector(delete) withObject:nil afterDelay:1.0];
            });
        });

        
    }
    
    else
    {
    
         [self.view_onlongpress removeFromSuperview];
    
    }

}

-(void)delete
{
     [self.view_onlongpress removeFromSuperview];
    // NSString *inbox=@"inbox";
    // http://107.170.94.176/openSIS_CE6_Mobile/webservice/teacher_info_tabs.php?staff_id=2&school_id=1&syear=2015
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //   NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    STAFF_ID_K=[DF objectForKey:@"iphone"];
    NSString *school_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    NSString *year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/student_info.php?staff_id=%@&school_id=%@&syear=%@&student_id=%@&action_type=delete_goal&goal_id=%@",STAFF_ID_K,school_id1,year_id,self.studentID,comment_id];
    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSURL *url = [NSURL URLWithString:url12];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary1=[[NSMutableDictionary alloc]init];
        dictionary1 = (NSMutableDictionary *)responseObject;
        NSLog(@"value is-------%@",dictionary1); // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"success"]];
        NSLog(@"str_123-----%@",str_123);
        self.lbl_TopTitle.text = [NSString stringWithFormat:@"%@",self.studentName];
        
        
        NSMutableArray *ary_data=[[NSMutableArray alloc]init];
        if([str_123 isEqualToString:@"1"])
        {
            [self loaddata];
            
          //  [self.table_cert reloadData];
        }
        
        
        else
        {
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    

    

}
#pragma mark - calendar and picker
-(IBAction)dismissPicker1:(id)sender
{
    
   
    if ([assign_flag isEqualToString:@"1"]) {
        
        
        
    //    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
      //  [dateFormatter setDateFormat:@"MMM dd, yyyy"];
      //  NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
      //  NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
       // [formatter1 setDateFormat:@"yyyy-MM-dd"];
        
        
        
        
        
       // date_string=[NSString stringWithFormat:@"%@",[formatter1 stringFromDate:[NSDate date]]];
      //  self.date_value.text =[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate date]]] ;
        

        NSLog(@"date1-------%@",date_string);
    }
    
    else
    {
    
       NSLog(@"date2-------%@",date_string);
    
    }
   
    [self.date_value resignFirstResponder];
    
    
    
}
#pragma mark - calendar and picker
-(IBAction)dismissPicker12:(id)sender
{
    
    
    if ([end_date_flag isEqualToString:@"1"]) {
        
        
        
        //    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        //  [dateFormatter setDateFormat:@"MMM dd, yyyy"];
        //  NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
        //  NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
        // [formatter1 setDateFormat:@"yyyy-MM-dd"];
        
        
        
        
        
        // date_string=[NSString stringWithFormat:@"%@",[formatter1 stringFromDate:[NSDate date]]];
        //  self.date_value.text =[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate date]]] ;
        
        
        NSLog(@"date1-------%@",end_date);
    }
    
    else
    {
        
        NSLog(@"date2-------%@",end_date);
        
    }
    
    [self.end_date resignFirstResponder];
    
    
    
}

-(IBAction)click_calender:(id)sender
{
    // NSDate *selectedDate = datePicker1.date;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MMM dd, yyyy"];
    //[self.text_assigndate setText:[df stringFromDate:selectedDate]];
    //datestr = [NSString stringWithFormat:@"%@",[df stringFromDate:datePicker1.date]];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd"];
    
    
    
    
    
date_string=[NSString stringWithFormat:@"%@",[formatter1 stringFromDate:datePicker1.date]];
    self.date_value.text =[NSString stringWithFormat:@"%@",[df stringFromDate:datePicker1.date]];;
    assign_flag=@"1";
}

-(IBAction)click_calender1:(id)sender
{
    // NSDate *selectedDate = datePicker1.date;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MMM dd, yyyy"];
    //[self.text_assigndate setText:[df stringFromDate:selectedDate]];
    //datestr = [NSString stringWithFormat:@"%@",[df stringFromDate:datePicker1.date]];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd"];
    
    
    
    
    
   end_date=[NSString stringWithFormat:@"%@",[formatter1 stringFromDate:datePicker2.date]];
    self.end_date.text =[NSString stringWithFormat:@"%@",[df stringFromDate:datePicker2.date]];;
    end_date_flag=@"1";
}

-(void)loadcalender
{
    
    datePicker1 = [[UIDatePicker alloc] init];
    
    datePicker1.datePickerMode =UIDatePickerModeDate;
    datePicker1.date = [NSDate date];
    [datePicker1 addTarget:self action:@selector(click_calender:) forControlEvents:UIControlEventValueChanged]; // method to respond to changes in the picker value
    UIToolbar *datePickerToolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(120, 0, self.view.bounds.size.width, 44)];
    [datePickerToolbar1 setBarStyle:UIBarStyleBlackTranslucent];
    UIBarButtonItem *extraSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton1 = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissPicker1:)]; // method to dismiss the picker when the "Done" button is pressed
    [datePickerToolbar1 setItems:[[NSArray alloc] initWithObjects: extraSpace1, doneButton1, nil]];
    
    
    
    
    self.date_value.inputView = datePicker1;
    
    // Set UITextfield's inputAccessoryView as UIToolbar
    
    self.date_value.inputAccessoryView = datePickerToolbar1;
}



-(void)loadcalender1
{
    
    datePicker2 = [[UIDatePicker alloc] init];
    
    datePicker2.datePickerMode =UIDatePickerModeDate;
    datePicker2.date = [NSDate date];
    [datePicker2 addTarget:self action:@selector(click_calender1:) forControlEvents:UIControlEventValueChanged]; // method to respond to changes in the picker value
    UIToolbar *datePickerToolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(120, 0, self.view.bounds.size.width, 44)];
    [datePickerToolbar1 setBarStyle:UIBarStyleBlackTranslucent];
    UIBarButtonItem *extraSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton1 = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissPicker12:)]; // method to dismiss the picker when the "Done" button is pressed
    [datePickerToolbar1 setItems:[[NSArray alloc] initWithObjects: extraSpace1, doneButton1, nil]];
    
    
    
    
    self.end_date.inputView = datePicker2;
    
    // Set UITextfield's inputAccessoryView as UIToolbar
    
    self.end_date.inputAccessoryView = datePickerToolbar1;
}

- (void)dodesignsforTextViews:(UITextView *)disview
{
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.620f green:0.620f blue:0.620f alpha:1.00f] CGColor]];
    [disview.layer setBorderWidth:1.0f];
    [disview.layer setCornerRadius:1.5f];
    disview.clipsToBounds = YES;
}

- (void)dodesignforHeaders:(UIView *)disview
{
    // [disview.layer setBorderColor:[[UIColor colorWithRed:0.816f green:0.816f blue:0.816f alpha:1.00f]CGColor]];
    //[disview.layer setBorderWidth:1.0f];
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.620f green:0.620f blue:0.620f alpha:1.00f] CGColor]];
    [disview.layer setBorderWidth:1.0f];
    [disview.layer setCornerRadius:1.5f];
    
}
- (void)dodesignforHeaders1:(UITextField *)disview
{
    // [disview.layer setBorderColor:[[UIColor colorWithRed:0.816f green:0.816f blue:0.816f alpha:1.00f]CGColor]];
    //[disview.layer setBorderWidth:1.0f];
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.620f green:0.620f blue:0.620f alpha:1.00f] CGColor]];
    [disview.layer setBorderWidth:1.0f];
    [disview.layer setCornerRadius:1.5f];
    
}


-(IBAction)settings:(id)sender
{
    
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    SettingsMenu *obj = [sb instantiateViewControllerWithIdentifier:@"SettingsMenu"];
    
    
    [self.navigationController pushViewController:obj animated:YES];
    
}


-(IBAction)home:(id)sender
{
    
    //AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    // NSLog(@"dic===========%@",dic);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    TeacherDashboardViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"dash"];
    // vc.dic=dic;
    //vc.dic_techinfo=dic_techinfo;
    // appDelegate.dic=dic;
    //   appDelegate.dic_techinfo=dic_techinfo;
    
    [self.navigationController pushViewController:vc animated:NO];
    
}
-(IBAction)thirdButton:(id)sender
{
    NSLog(@"Third Button");
}

#pragma mark---Msg
-(IBAction)msg:(id)sender
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"msg" bundle:nil];
    msg1*obj = [sb instantiateViewControllerWithIdentifier:@"msg1"];
    [self.navigationController pushViewController:obj animated:YES];
}

#pragma mark -- calendar
-(IBAction)calendar:(id)sender
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"schoolinfo"bundle:nil];
    Month1ViewController *obj = [sb instantiateViewControllerWithIdentifier:@"month1"];
    [self.navigationController pushViewController:obj animated:YES];
}


- (IBAction)action_segment:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        //        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Settings" bundle:[NSBundle mainBundle]];
        //        MystdInformationGeneral *mia = [storyBoard instantiateViewControllerWithIdentifier:@"MyInformationGeneral"];
        //        [self.navigationController pushViewController:mia animated:YES];
        //        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        //        goal *mia = [storyBoard instantiateViewControllerWithIdentifier:@"goal"];
        //        mia.studentID=self.studentID;
        //        mia.studentName=self.studentName;
        //        [self.navigationController pushViewController:mia animated:YES];
        
        NSLog(@"This Page");
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        enroll*mia = [storyBoard instantiateViewControllerWithIdentifier:@"enroll"];
        mia.studentID=self.studentID;
        mia.studentName=self.studentName;
        [self.navigationController pushViewController:mia animated:NO];
    }
    else if (sender.selectedSegmentIndex == 2)
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        stdadd*mia = [storyBoard instantiateViewControllerWithIdentifier:@"stdadd"];
        mia.studentID=self.studentID;
        mia.studentName=self.studentName;
        [self.navigationController pushViewController:mia animated:NO];
        //        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        //        goal *mia = [storyBoard instantiateViewControllerWithIdentifier:@"goal"];
        //        mia.studentID=self.studentID;
        //        mia.studentName=self.studentName;
        //        [self.navigationController pushViewController:mia animated:YES];
        
    }
    else if (sender.selectedSegmentIndex == 3)
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        comment *mia = [storyBoard instantiateViewControllerWithIdentifier:@"comment"];
        mia.studentID=self.studentID;
        mia.studentName=self.studentName;
        [self.navigationController pushViewController:mia animated:YES];
    }
    else if (sender.selectedSegmentIndex == 4)
    {
//        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
//        goal *mia = [storyBoard instantiateViewControllerWithIdentifier:@"goal"];
//        mia.studentID=self.studentID;
//        mia.studentName=self.studentName;
//        [self.navigationController pushViewController:mia animated:YES];
        
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Student" bundle:nil];
        MystdInformationGeneral *slc = [[MystdInformationGeneral alloc]init];
        slc = [sb instantiateViewControllerWithIdentifier:@"MystdInformationGeneral"];
        

    }
    
    
    else
    {
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        parents *mia = [storyBoard instantiateViewControllerWithIdentifier:@"parents"];
        mia.studentID=self.studentID;
        mia.studentName=self.studentName;
        [self.navigationController pushViewController:mia animated:YES];
        
    }
    
}

-(IBAction)addcomment:(id)sender
{
    self.date_value.text=@"";
    self.txt_view.text=@"";
    self.GOAL_TITLE.text=@"";
    [self loaddata];
    view_upper.hidden=NO;
    self.table_cert.frame=CGRectMake(-18, 450, 340,70);
    btn_add.hidden=YES;
    btn_close.hidden=NO;
    btn_cancel.hidden=YES;
    view_info.hidden=YES;
    [btn_update setTitle:@"Add" forState:UIControlStateNormal];

}

-(IBAction)back:(id)sender
{
    
   // NSArray *ary = [self.navigationController viewControllers];
    
   // [self.navigationController popToViewController:[ary objectAtIndex:3] animated:YES];
    //[self.navigationController popViewControllerAnimated:YES];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Student" bundle:nil];
    Student *slc = [[Student alloc]init];
    slc = [sb instantiateViewControllerWithIdentifier:@"tstudentlist"];
   // slc.senderString = [self gettheString];
    
    [self.navigationController pushViewController:slc animated:YES];
}

- (IBAction)click_back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.segment_menu.selectedSegmentIndex=0;
    
    NSLog(@"total value-------%@",self.dic_prog);
    [self loadPicker1];
    [self loadPicker2];
    [self loadPicker3];
    view_upper.hidden=YES;
    btn_close.hidden=YES;
    self.goal_name123.text=[NSString stringWithFormat:@"%@",self.goal_name];
    [self loadcalender1];
//    self.table_cert.frame=CGRectMake(-18, 96, 340, 400);
    [self loadcalender];
    array_cert = [[NSMutableArray alloc]init];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    array_cert=[userDefaults objectForKey:@"progdata"];
  //  [array_cert addObject:self.dic_prog];
   // NSLog(@"heloow----%@",self.dic_prog);
    [self.table_cert reloadData];
    [self loaddata];
    [self dodesignforHeaders1:self.GOAL_TITLE];
     [self dodesignforHeaders1:self.COURSE_PERIOD];
     [self dodesignforHeaders1:self.PP_NAME];
     [self dodesignforHeaders1:self.P_SCALE];
     [self dodesignforHeaders:self.VIEW_STARTDATE];
     [self dodesignforHeaders:self.view_enddate];
    [self dodesignsforTextViews:self.txt_view];
    
    
    [self.scroll_viewforSegment setContentSize:CGSizeMake(self.segment_menu.frame.size.width, self.scroll_viewforSegment.frame.size.height)];
    
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(pressed:)];
    longpress.minimumPressDuration = 1.5;
    longpress.delegate = self;
    [self.table_cert addGestureRecognizer:longpress];
    [self.view_onlongpress setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.6]];
    self.view_onlongpress.opaque = NO;
    
}
-(void)loaddata1
{
    // NSString *inbox=@"inbox";
    //
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //   NSString *cpv_id1=[NSString stringWithFormat:http://107.170.94.176/openSIS_CE6_Mobile/webservice/teacher_info_tabs.php?staff_id=2&school_id=1&syear=2015@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    
   // http://107.170.94.176/openSIS_CE6_Mobile/webservice/student_info.php?staff_id=2&school_id=1&syear=2015&student_id=13&action_type=add_progress_view
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    STAFF_ID_K=[DF objectForKey:@"iphone"];
    NSString *school_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    NSString *year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/student_info.php?staff_id=%@&school_id=%@&syear=%@&student_id=%@&action_type=add_progress_view",STAFF_ID_K,school_id1,year_id,self.studentID];
    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSURL *url = [NSURL URLWithString:url12];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary1=[[NSMutableDictionary alloc]init];
        dictionary1 = (NSMutableDictionary *)responseObject;
        NSLog(@"value is-------%@",dictionary1); // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
      //  NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"goals_success"]];
      //  NSLog(@"str_123-----%@",str_123);
        self.lbl_TopTitle.text = [NSString stringWithFormat:@"%@",self.studentName];
        
        
       // NSMutableArray *ary_data=[[NSMutableArray alloc]init];
      //  if([str_123 isEqualToString:@"1"])
       // {
        
        
        
        goal_ary=[[NSMutableArray alloc]init];
        cp_ary=[[NSMutableArray alloc]init];
        p_scale123=[[NSMutableArray alloc]init];
        goal_ary=[dictionary1 objectForKey:@"goal_data"];
        cp_ary=[dictionary1 objectForKey:@"cp_data"];
        
        p_scale123=[dictionary1 objectForKey:@"prof_data"];
           // self.nodatafound.hidden=YES;
           // array_cert = [dictionary1 //objectForKey:@"goals"];
         //   NSLog(@"tanay---%@",ary_data);
            
            //     calendar_name.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[ary_data objectAtIndex:0]objectForKey:@"CALENDAR"]] ];
            //  rolling.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[ary_data objectAtIndex:0]objectForKey:@"NEXT_SCHOOL"]]];
            
            // array_cert=[[ary_data objectAtIndex:0]objectForKey:@"SCHOOL_INFO"];
            //SCHOOL_INFO
            //[self.table_cert reloadData];
     //   }
        date_string = [self nullChecker:[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"START_DATE"]]];
               // self.txt_view.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:sender.tag] objectForKey:@"COMMENT"]]];
        NSString *str =date_string; /// here this is your date with format yyyy-MM-dd
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ; // here we create NSDateFormatter object for change the Format of date..
        [dateFormatter setDateFormat:@"yyyy-MM-dd"]; //// here set format of date which is in your output date (means above str with format)
        
        NSDate *date = [dateFormatter dateFromString: str]; // here you can fetch date from string with define format
        
        NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init] ;
        [dateFormatter1 setDateFormat:@"dd MMM, yyyy"];// here set format which you want...
        
        NSString *convertedString = [dateFormatter1 stringFromDate:date]; //here convert date in NSString
        NSLog(@"Converted String : %@",convertedString);
        self.date_value.text=convertedString;

        
        self.GOAL_TITLE.text=self.goal_name123.text;
        goal_id1=[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"GOAL_ID"]];
        self.COURSE_PERIOD.text=[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"COURSE_PERIOD"]];
        self.P_SCALE.text=[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"PROFICIENCY"]];
        
        self.txt_view.text=[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"PROGRESS_DESCRIPTION"]];
        self.PP_NAME.text=[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"PROGRESS_NAME"]];
        p_scale_id=[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"PROFICIENCY"]];
        p_id=[NSString stringWithFormat:@"%@",[self.dic_prog objectForKey:@"COURSE_PERIOD_ID"]];
        
       // else
     //   {
            
            
         //   self.nodatafound.hidden=NO;
            //   NSString *str_msg=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"error_msg"]];
            //   lbl_show.hidden=NO;
            //    mtable.hidden=YES;
            //  NSString *str_msg=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"error_msg"]];
            //  lbl_show.text=[NSString stringWithFormat:@"%@",str_msg];
            // UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:str_msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            // [alert show];
            
            
            
     //   }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    

}

#pragma mark - pickerview delegate datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag==1) {
        return goal_ary.count;
    }
 else   if (pickerView.tag==2) {
        return cp_ary.count;
    }
    else
    {
        return p_scale123.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag==1) {
        return [NSString stringWithFormat:@"%@",[[goal_ary objectAtIndex:row]objectForKey:@"GOAL_TITLE"]];
    }
    
 else   if (pickerView.tag==2) {
        return [NSString stringWithFormat:@"%@",[[cp_ary objectAtIndex:row]objectForKey:@"COURSE_PERIOD_NAME"]];
    }
    else
    {
        return [NSString stringWithFormat:@"%@",[[p_scale123 objectAtIndex:row]objectForKey:@"TITLE"]];
    }
    return 0;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    
        [self animateTextField1:self.txt_view up:YES];
    
   
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    
 
        [self animateTextField1:self.txt_view up:NO];
  
}
#pragma mark textview
-(void)animateTextField1:(UITextView*)textview up:(BOOL)up
{
    const int movementDistance = -180; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag==1) {
       GOAL_NAME = [NSString stringWithFormat:@"%@",[[goal_ary objectAtIndex:row]objectForKey:@"GOAL_TITLE"]];
        
       goal_id1 = [NSString stringWithFormat:@"%@",[[goal_ary objectAtIndex:row]objectForKey:@"GOAL_ID"]];
        FLAG_G=@"1";
        
    }
   if (pickerView.tag==2)
    {
       CP_NAME = [NSString stringWithFormat:@"%@",[[cp_ary objectAtIndex:row]objectForKey:@"COURSE_PERIOD_NAME"]];
        p_id= [NSString stringWithFormat:@"%@",[[cp_ary objectAtIndex:row]objectForKey:@"COURSE_PERIOD"]];
        FLAG_CP=@"1";
    }
    
    
    if (pickerView.tag==3)
    {
          SCALE = [NSString stringWithFormat:@"%@",[[p_scale123 objectAtIndex:row]objectForKey:@"TITLE"]];
        p_scale_id= [NSString stringWithFormat:@"%@",[[p_scale123 objectAtIndex:row]objectForKey:@"VALUE"]];
        FLAG_S=@"1";
    }
    
 
}


- (NSString *)nullChecker:(NSString *)strToCheck
{
    if ([strToCheck isEqualToString:@"(null)"] || [strToCheck isEqualToString:@"<null>"] || [strToCheck isEqualToString:@"null"]) {
        return @" ";
    }
    return strToCheck;
}
-(void)loaddata
{
    self.table_cert.tableFooterView=[[UIView alloc]init];

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            [self performSelector:@selector(loaddata1) withObject:nil afterDelay:1.0];
        });
    });
    
    
}

#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array_cert.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInformationCertificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyInformationCertificationCell"];
    
   

    
    cell.lbl_Certname.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:indexPath.row] objectForKey:@"PROGRESS_NAME"]]];
    
//    if ([str_staff_id isEqualToString:STAFF_ID_K]) {
//        
//        
//        cell.edit_btn.hidden=NO;
//        cell.delete_btn.hidden=NO;
//        
//    }
//    
//    else
//    {
//    
//        cell.edit_btn.hidden=YES;
//        cell.delete_btn.hidden=YES;
//        
//    
//    }
//    
//    [cell.edit_btn addTarget:self action:@selector(click_edit:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.delete_btn addTarget:self action:@selector(click_delete:) forControlEvents:UIControlEventTouchUpInside];
    
  //  NSDateFormatter *df = [[NSDateFormatter alloc] init];
   // [df setDateFormat:@"MMM dd, yyyy"];
    
   // [cell.lbl_certDesc sizeToFit];
    
   // cell.lbl_validfrom.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:indexPath.row] objectForKey:@"START_DATE"]]];
   // cell.lbl_validThru.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:indexPath.row] objectForKey:@"END_DATE"]]];
    
    return cell;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)pressed:(UILongPressGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer locationInView:_table_cert];
    
    NSIndexPath *indexPath = [_table_cert indexPathForRowAtPoint:p];
    if (indexPath == nil) {
        NSLog(@"long press on table view but not on a row");
    } else if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"long press on table view at row %ld", (long)indexPath.row);
        [self appearonlongwithIndex:indexPath];
        
    } else {
        NSLog(@"gestureRecognizer.state = %ld", (long)gestureRecognizer.state);
    }
}
-(void)appearonlongwithIndex:(NSIndexPath*)indexPath
{
    
    currentIndex = indexPath;
    LBL_TITLE.text = [[array_cert objectAtIndex:currentIndex.row] objectForKey:@"GOAL_TITLE"];
    
    
  //  [self.view_sublongpress setAlpha:1.0f];
    [self.view addSubview:self.view_onlongpress];
}

-(IBAction)cancel:(id)sender
{
    
    
    self.date_value.text=@"";
    self.txt_view.text=@"";
    view_upper.hidden=YES;
    view_header.hidden=NO;
    self.table_cert.hidden=NO;

}


-(IBAction)view_close:(id)sender
{
    [self.view_onlongpress removeFromSuperview];
}
-(IBAction)close:(id)sender
{
     view_info.hidden=NO;
    self.date_value.text=@"";
    self.txt_view.text=@"";
    self.GOAL_TITLE.text=@"";
    view_info.hidden=NO;
    //self.end_date.text=@"";
    view_upper.hidden=YES;
    self.table_cert.frame=CGRectMake(-18,150, 340,300);
    
    btn_add.hidden=NO;
    btn_close.hidden=YES;
    
}
-(IBAction)click_edit:(UIButton*)sender
{
    
//    edit_flag=@"1";
//    view_header.hidden=YES;
//    view_upper.hidden=NO;
//   
//    self.table_cert.hidden=YES;
//    btn_cancel.hidden=NO;
//    [btn_update setTitle:@"Update" forState:UIControlStateNormal];
//    
    
    self.GOAL_TITLE.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:currentIndex.row]objectForKey:@"GOAL_TITLE"]]];
    date_string = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:currentIndex.row] objectForKey:@"START_DATE"]]];
    end_date=[self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:currentIndex.row] objectForKey:@"END_DATE"]]];
  // self.txt_view.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:sender.tag] objectForKey:@"COMMENT"]]];
    NSString *str =date_string; /// here this is your date with format yyyy-MM-dd
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ; // here we create NSDateFormatter object for change the Format of date..
    [dateFormatter setDateFormat:@"yyyy-MM-dd"]; //// here set format of date which is in your output date (means above str with format)
    
    NSDate *date = [dateFormatter dateFromString: str]; // here you can fetch date from string with define format
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init] ;
    [dateFormatter1 setDateFormat:@"dd MMM, yyyy"];// here set format which you want...
    
    NSString *convertedString = [dateFormatter1 stringFromDate:date]; //here convert date in NSString
    NSLog(@"Converted String : %@",convertedString);
    self.date_value.text=convertedString;
    
     comment_id=[self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:currentIndex.row] objectForKey:@"GOAL_ID"]]];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
    goaledit *mia = [storyBoard instantiateViewControllerWithIdentifier:@"goaledit"];
    
    mia.goal_title=self.GOAL_TITLE.text;
    mia.date_string=[self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:currentIndex.row]objectForKey:@"START_DATE"]]];
    mia.end_date=[self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:currentIndex.row]objectForKey:@"END_DATE"]]];
    mia.GOAL_ID=comment_id;
     mia.studentID=self.studentID;
    mia.studentName=self.studentName;
    mia.str_txt_view=[self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:currentIndex.row] objectForKey:@"GOAL_DESCRIPTION"]]];
    [self.navigationController pushViewController:mia animated:YES];
    

}


-(IBAction)click_delete:(UIButton*)sender
{
    
    comment_id=[self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:sender.tag] objectForKey:@"GOAL_ID"]]];
  //  Are you sure you want to delete that comment?
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Confirm Delete" message:@"Are you sure you want to delete that comment?" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    [alert show];
    
}

- (IBAction)add:(id)sender {
  
    //  Please enter goal title
    if ([self.COURSE_PERIOD.text length]<1) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter Courseperiod Name" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    // Please enter progress assessment
    else    if ([self.date_value.text length]<1) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter begin date" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else     if ([self.txt_view.text length]<1) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter progress assessment" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
    else
    {
        
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //[MBProgressHUD hideHUDForView:self.view animated:YES];
                [self performSelector:@selector(edit_data) withObject:nil afterDelay:1.0];
            });
        });
    }
    
    
}






-(void)add_data
{

    
  //  http://107.170.94.176/openSIS_CE6_Mobile/webservice/student_info.php?staff_id=2&school_id=1&syear=2015&student_id=13&action_type=submit_progress&goal_id=2&progress_details=[{"prog_name":"test progress","prog_begin_date":"2016-01-12","prog_prof_scale":"0-10%","prog_desc":"test progress description","cp_id":"1"}]
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //   NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    STAFF_ID_K=[DF objectForKey:@"iphone"];
    NSString *school_id12=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    NSString *year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
     NSString *mp=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
//    NSString*str_checklogin=[NSString stringWithFormat:@"/student_info.php?staff_id=%@&school_id=%@&syear=%@&student_id=%@",STAFF_ID_K,school_id1,year_id,self.studentID];
//    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
   // http://107.170.94.176/openSIS_CE6_Mobile/webservice/student_info.php?staff_id=2&school_id=1&syear=2015&student_id=13&action_type=submit_progress&goal_id=2&progress_details=[{"prog_name":"test progress","prog_begin_date":"2016-01-12","prog_prof_scale":"0-10%","prog_desc":"test progress description","cp_id":"1"}]
    NSMutableArray *arry_value=[[NSMutableArray alloc]init];
    NSMutableDictionary *dic_value=[[NSMutableDictionary alloc]init];
    [dic_value setObject:self.PP_NAME.text forKey:@"prog_name"];
    [dic_value setObject:date_string forKey:@"prog_begin_date"];
      [dic_value setObject:p_scale_id forKey:@"prog_prof_scale"];
    
    
     [dic_value setObject:self.txt_view.text forKey:@"prog_desc"];
    [dic_value setObject:p_id forKey:@"cp_id"];
    [arry_value addObject:dic_value];
    NSString * str111;// = [Base64 encode:data];
    str111=[arry_value JSONRepresentation];
    
    NSLog(@"----String To Post To Server ---%@",str111);
    
    
    
    // NSMutableDictionary    *dict=[[NSMutableDictionary alloc]init];
    
    
    
  //  NSString *school_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    // [AFJSONResponseSerializer serializer];
  
    
    
    
    //    http://107.170.94.176/openSIS_CE6_Mobile/webservice/send_mail.php?staff_id=2&school_id=1&syear=2015&mail_details=
    
 
    
    NSString *urlStr = [NSString stringWithFormat:@"/student_info.php"];
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,urlStr];
    //
    //    NSLog(@"----%@",url12);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url12]];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    //  patameter image
    // school_id=1&syear=2015&staff_id=2&cpv_id=24&mp_id=16&values=
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"staff_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[STAFF_ID_K dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"school_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[school_id12 dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"syear\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[year_id dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"student_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[self.studentID dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"progress_details\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[str111 dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
  /*  [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"mp_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[mp dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];*/
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"action_type\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *stryyy=@"submit_progress";
    [body appendData:[stryyy dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"goal_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
   
    [body appendData:[goal_id1 dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

    
    
    // close form
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    NSLog(@"request...%@",request);
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"======%@",returnData);
    //   NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    
    
    NSMutableDictionary  *datadic=[[NSMutableDictionary alloc]init];
    datadic = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:NULL];
    NSLog(@"datadic-------%@",datadic);
    
 //   [self alertmsg:[NSString stringWithFormat:@"%@",[datadic objectForKey:@"msg"]]];
    
  //  goal *obj=[[goal alloc]init];
   // [obj loaddata];
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    [self action_cancel:nil];
    
//    self.table_cert.frame=CGRectMake(-18, 92, 340, 420);
    //[self loaddata];
    
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
//    goal *mia = [storyBoard instantiateViewControllerWithIdentifier:@"goal"];
//    [self.navigationController pushViewController:mia animated:NO];
//    prog *mia1 = [storyBoard instantiateViewControllerWithIdentifier:@"prog"];
//    [self.navigationController pushViewController:mia1 animated:YES];
   // view_upper.hidden=YES;
    btn_add.hidden=NO;
    btn_close.hidden=YES;

}

-(void)edit_data
{

    
    //  http://107.170.94.176/openSIS_CE6_Mobile/webservice/student_info.php?staff_id=2&school_id=1&syear=2015&student_id=13&action_type=submit_progress&goal_id=2&progress_details=[{"prog_name":"test progress","prog_begin_date":"2016-01-12","prog_prof_scale":"0-10%","prog_desc":"test progress description","cp_id":"1"}]
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //   NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    STAFF_ID_K=[DF objectForKey:@"iphone"];
    NSString *school_id12=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    NSString *year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    NSString *mp=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    //    NSString*str_checklogin=[NSString stringWithFormat:@"/student_info.php?staff_id=%@&school_id=%@&syear=%@&student_id=%@",STAFF_ID_K,school_id1,year_id,self.studentID];
    //    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    // http://107.170.94.176/openSIS_CE6_Mobile/webservice/student_info.php?staff_id=2&school_id=1&syear=2015&student_id=13&action_type=submit_progress&goal_id=2&progress_details=[{"prog_name":"test progress","prog_begin_date":"2016-01-12","prog_prof_scale":"0-10%","prog_desc":"test progress description","cp_id":"1"}]
    NSMutableArray *arry_value=[[NSMutableArray alloc]init];
    NSMutableDictionary *dic_value=[[NSMutableDictionary alloc]init];
    [dic_value setObject:self.PP_NAME.text forKey:@"prog_name"];
    [dic_value setObject:date_string forKey:@"prog_begin_date"];
    [dic_value setObject:p_scale_id forKey:@"prog_prof_scale"];
    
    
    [dic_value setObject:self.txt_view.text forKey:@"prog_desc"];
    [dic_value setObject:p_id forKey:@"cp_id"];
    [arry_value addObject:dic_value];
    NSString * str111;// = [Base64 encode:data];
    str111=[arry_value JSONRepresentation];
 NSString*   str_prog_id=[self.dic_prog objectForKey:@"PROGRESS_ID"];
    NSLog(@"----String To Post To Server ---%@",str111);
    
    
    
    // NSMutableDictionary    *dict=[[NSMutableDictionary alloc]init];
    
    
    
    //  NSString *school_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    // [AFJSONResponseSerializer serializer];
    
    
    
    
    //    http://107.170.94.176/openSIS_CE6_Mobile/webservice/send_mail.php?staff_id=2&school_id=1&syear=2015&mail_details=
    
    
    
    NSString *urlStr = [NSString stringWithFormat:@"/student_info.php"];
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,urlStr];
    //
    //    NSLog(@"----%@",url12);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url12]];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    //  patameter image
    // school_id=1&syear=2015&staff_id=2&cpv_id=24&mp_id=16&values=
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"staff_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[STAFF_ID_K dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"school_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[school_id12 dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"syear\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[year_id dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"student_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[self.studentID dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"progress_details\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[str111 dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
      [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"progress_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
     
     [body appendData:[str_prog_id dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"action_type\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *stryyy=@"submit_progress";
    [body appendData:[stryyy dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"goal_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[self.goal_id dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    // close form
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    NSLog(@"request...%@",request);
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"======%@",returnData);
    //   NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    
    
    NSMutableDictionary  *datadic=[[NSMutableDictionary alloc]init];
    datadic = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:NULL];
    NSLog(@"datadic-------%@",datadic);
    NSString *succ=[NSString stringWithFormat:@"%@",[datadic objectForKey:@"success"]];
    if ([succ isEqualToString:@"1"]) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        prog *mia = [storyBoard instantiateViewControllerWithIdentifier:@"prog"];
        
        mia.goal_id= [self.dic_prog objectForKey:@"GOAL_ID"];
        ;
        mia.studentID=self.studentID;
        // mia
        mia.studentName=self.studentName;
        //  mia.dic_prog=[[array_cert objectAtIndex:indexPath.row]objectForKey:@"PROGRESS_DATA"];
        mia.goal_name=self.GOAL_TITLE.text;
        [self.navigationController pushViewController:mia animated:YES];    }
    
    else
    {
    
         NSString *msg=[datadic objectForKey:@"msg"];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    
    }
    //   [self alertmsg:[NSString stringWithFormat:@"%@",[datadic objectForKey:@"msg"]]];
    
    //  goal *obj=[[goal alloc]init];
    // [obj loaddata];
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    //    [self action_cancel:nil];
    
    //    self.table_cert.frame=CGRectMake(-18, 92, 340, 420);
    //[self loaddata];
    
    //    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
    //    goal *mia = [storyBoard instantiateViewControllerWithIdentifier:@"goal"];
    //    [self.navigationController pushViewController:mia animated:NO];
    //    prog *mia1 = [storyBoard instantiateViewControllerWithIdentifier:@"prog"];
    //    [self.navigationController pushViewController:mia1 animated:YES];
    // view_upper.hidden=YES;
    
    
   
    
    
    
}





- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row % 2 != 0) {
        cell.backgroundColor = [UIColor colorWithRed:0.957f green:0.957f blue:0.957f alpha:1.00f];
        
    }
    
}

#pragma mark - Tabbar



@end
