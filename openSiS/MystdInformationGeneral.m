//
//  MyInformationGeneral.m
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
#import "enroll.h"
#import "comment.h"
#import "stdadd.h"
#import "parents.h"
#import "goal.h"
@interface MystdInformationGeneral ()
{
    
    IBOutlet UIView *VIEW_MAP;
    UIDatePicker *datepicker1;

    
}


@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lbl_TopTitle;
@property (weak, nonatomic) IBOutlet UILabel *common_name;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segment_menu;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_viewforSegment;
@property (weak, nonatomic) IBOutlet UILabel *alernative_id;

@end

@implementation MystdInformationGeneral




#pragma mark---Settings

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
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Student" bundle:[NSBundle mainBundle]];
        goal *mia = [storyBoard instantiateViewControllerWithIdentifier:@"goal"];
        mia.studentID=self.studentID;
        mia.studentName=self.studentName;
        [self.navigationController pushViewController:mia animated:YES];
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

-(IBAction)back:(id)sender
{
    
    NSArray *ary = [self.navigationController viewControllers];
    
    [self.navigationController popToViewController:[ary objectAtIndex:3] animated:YES];
    
}

-(IBAction)OPENMAP:(id)sender
{
    
    
    NSString *str_address=[NSString stringWithFormat:@"%@ %@ %@ %@",add.text,city.text,stae.text,zip.text];
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"schoolinfo" bundle:nil];
    mapkitViewController *obj = [sb instantiateViewControllerWithIdentifier:@"map"];
    obj.str_address=str_address;
    obj.str_name=sname.text;
    [self.navigationController pushViewController:obj animated:YES];
    
    NSLog(@"HELLOW");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.segment_menu.selectedSegmentIndex=0;
    [self loaddata];
    
    [self.scroll_viewforSegment setContentSize:CGSizeMake(self.segment_menu.frame.size.width, self.scroll_viewforSegment.frame.size.height)];
    
    
    
    
    UITapGestureRecognizer *mising= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OPENMAP:)];
    mising.numberOfTapsRequired = 1;
    
    //[self.view addGestureRecognizer:tapmainview];
    [VIEW_MAP addGestureRecognizer:mising];
    view_schoolname.layer.borderWidth = 1.0f;
    view_schoolname.layer.backgroundColor=[[UIColor lightGrayColor]CGColor ];
    view_schoolname.clipsToBounds = YES;
    [self courseperiod123];
    ary_data=[[NSMutableArray alloc]init ];
    ary_data_title=[[NSMutableArray alloc]init];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    ary_data=[appDelegate.dic objectForKey:@"School_list"];
    NSLog(@"ary data---%@",ary_data);
    
    
    NSMutableDictionary *dic16q=[[NSMutableDictionary alloc]init];
    NSString *strtq=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    
    
    for (int i=0; i<[ary_data count]; i++) {
        
        
        if ([strtq isEqual:[[ary_data objectAtIndex:i]objectForKey:@"id"]]) {
            dic16q=[ary_data objectAtIndex:i];
            
            NSLog(@"dic16---%@",dic16q);
            
            
            s=true;
            break;
        }
        
        else
        {
            //            txt_schoolname.text=[NSString stringWithFormat:@"%@",[[ary_data objectAtIndex:0]objectForKey:@"title" ]];
            //             school_id=[NSString stringWithFormat:@"%@",[[ary_data objectAtIndex:0]objectForKey:@"id"]];
        }
        
    }
    
    if (s==true) {
        txt_schoolname.text=[NSString stringWithFormat:@"%@",[dic16q objectForKey:@"title"]];
        
        school_id=[NSString stringWithFormat:@"%@",[dic16q objectForKey:@"id"]];
        
    }
    else
    {
        
        txt_schoolname.text=[NSString stringWithFormat:@"%@",[[ary_data objectAtIndex:0]objectForKey:@"title" ]];
        school_id=[NSString stringWithFormat:@"%@",[[ary_data objectAtIndex:0]objectForKey:@"id"]];
        
        
    }
    
    
    
    // school_year=[[dic objectForKey:@"Schoolyear_list"]mutableCopy];
    
    if ([ary_data count]>0) {
        ary_data_title = [[NSMutableArray alloc] init];
        ary_data_id= [[NSMutableArray alloc] init];
        for (int i = 0; i<[ary_data count]; i++) {
            NSDictionary *dic15 = [ary_data objectAtIndex:i];
            [ary_data_title  addObject:[dic15 objectForKey:@"title"]];
            [ary_data_id addObject:[dic15 objectForKey:@"id"]];
            
        }
        
    }
    else {
        NSLog(@"No  list");
    }
    
    
    
    // Do any additional setup after loading the view.
}

-(void)courseperiod123{
    
    
    
    
    
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker  .delegate = self;
    
    selectcustomerpicker .dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=6;
    txt_schoolname.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked1)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    txt_schoolname.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 1;
    
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    
    
    
    
    return ary_data_title.count;
    
    
    
    
    
    
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
    return [ary_data_title objectAtIndex:row];
    
}



- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    
    
    
    
    if (pickerView.tag==6) {
        
        
        
        
        
        inbox_data =(NSString *)[ary_data_title objectAtIndex:row];
        NSString *strC =(NSString *)[ary_data_title objectAtIndex:row];
        school_id= [ary_data_id objectAtIndex:[ary_data_title indexOfObjectIdenticalTo:strC]];
        flag=@"1";
        
        
    }
    
    
}

-(void)loaddata1
{
    
  //  http://107.170.94.176/openSIS_CE6_Mobile/webservice/student_info.php?staff_id=2&school_id=1&syear=2015&student_id=13
    // NSString *inbox=@"inbox";
    // http://107.170.94.176/openSIS_CE6_Mobile/webservice/teacher_info_tabs.php?staff_id=2&school_id=1&syear=2015
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //   NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
        NSString *STAFF_ID_K=[DF objectForKey:@"iphone"];
        NSString *school_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
        NSString *year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/student_info.php?staff_id=%@&school_id=%@&syear=%@&student_id=%@",STAFF_ID_K,school_id1,year_id,self.studentID];
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
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"general_info_success"]];
        NSLog(@"str_123-----%@",str_123);
       NSMutableArray  *sinfo=[[NSMutableArray alloc]init];
        sinfo=[dictionary1 objectForKey:@"general_info"];
        NSLog(@"sinfo----%@",sinfo);
        self.lbl_TopTitle.text = [NSString stringWithFormat:@"%@",self.studentName];
        if([str_123 isEqualToString:@"1"])
        {            
           
           sname.text= [self nullChecker:[NSString stringWithFormat:@"%@ %@", [[sinfo objectAtIndex:0] objectForKey:@"FIRST_NAME"], [[sinfo objectAtIndex:0] objectForKey:@"LAST_NAME"]]];
            add.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STUDENT_ID"]]];
            self.alernative_id.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"ALTERNATE_ID"]]];
             base.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"PHONE"]]];
              self.common_name.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"COMMON_NAME"]]];
            stae.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"GENDER"]]];
            tel.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"ETHNICITY"]]];
            website.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"GRADE_NAME"]]];
            email.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"EMAIL"]]];
            prin.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"PRIMARY_LANGUAGE"]]];
            zip.text=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"BIRTHDATE"]]];
            
          NSString *img1=[self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"PHOTO"]]];
            
            NSString * urlString =[img1 stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
            NSLog(@"urlstring...%@",urlString);
            NSURL *imageurl = [NSURL URLWithString:urlString];
            NSData  *data1=[[NSData  alloc] initWithContentsOfURL:imageurl];
            NSLog(@"imagedata..%@",data1);
            self.img.image=[UIImage imageWithData:data1];
            
            

          //  base.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"SECOND_LANGUAGE_ID"]]];
            
            
        }
        
        
        else
        {
            //   NSString *str_msg=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"error_msg"]];
            //   lbl_show.hidden=NO;
            //    mtable.hidden=YES;
            //  NSString *str_msg=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"error_msg"]];
            //  lbl_show.text=[NSString stringWithFormat:@"%@",str_msg];
            // UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:str_msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            // [alert show];
            
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
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
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            [self performSelector:@selector(loaddata1) withObject:nil afterDelay:1.0];
        });
    });
    
    
}


-(void)pickerDoneClicked1
{
    
    if ([flag isEqualToString:@"1"]) {
        
        txt_schoolname.text=inbox_data;
        NSLog(@"school id-----%@",school_id);
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //[MBProgressHUD hideHUDForView:self.view animated:YES];
                [self performSelector:@selector(loaddata1) withObject:nil afterDelay:1.0];
            });
        });
        
        
        
    }
    else
    {
        
    }
    
    [txt_schoolname resignFirstResponder];
}
#pragma mark - Tabbar



@end
