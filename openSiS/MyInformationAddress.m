//
//  MyInformationAddress.m
//  openSiS
//
//  Created by os4ed on 1/11/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import "MyInformationAddress.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "ip_url.h"
#import <MapKit/MapKit.h>
#import "mapkitViewController.h"
#import "MyInformationGeneral.h"

#import "TeacherDashboardViewController.h"
#import "MyInformationAddress.h"
#import "MyInformationGeneral.h"
#import "MyInformationSchoolInfo.h"
#import "MyInformationCertification.h"
#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"

@interface MyInformationAddress ()
{
    IBOutlet UIView *VIEW_MAP;
}
@property (weak, nonatomic) IBOutlet UILabel *lbl_TopTitle;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emergencyEmail;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emergencyMobilePhone;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emergencyWorkPhone;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emergencyHomePhone;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emergencyRelatoion;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emergencyLastName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emergencyFirstName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ContactPersonalEmail;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ContactWorkEmail;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ContactOfficePhone;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ContactMobilePhone;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ContactHomePhone;
@property (strong, nonatomic) IBOutlet UILabel *lbl_MailingZip;
@property (strong, nonatomic) IBOutlet UILabel *lbl_MailingState;
@property (strong, nonatomic) IBOutlet UILabel *lbl_MailingCity;
@property (strong, nonatomic) IBOutlet UILabel *lbl_MailingAddress2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_MailingAddress1;
@property (strong, nonatomic) IBOutlet UISwitch *switch_sameashomeAddress;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Homezip;
@property (strong, nonatomic) IBOutlet UILabel *lbl_state;
@property (strong, nonatomic) IBOutlet UILabel *lbl_city;
@property (strong, nonatomic) IBOutlet UILabel *lbl_street2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_street1;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_content;



@property (strong, nonatomic) IBOutlet UISegmentedControl *segment_menu;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_viewforSegment;



@end

@implementation MyInformationAddress

- (IBAction)action_segment:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Settings" bundle:[NSBundle mainBundle]];
        MyInformationGeneral *mia = [storyBoard instantiateViewControllerWithIdentifier:@"MyInformationGeneral"];
        [self.navigationController pushViewController:mia animated:YES];
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Settings" bundle:[NSBundle mainBundle]];
        MyInformationAddress *mia = [storyBoard instantiateViewControllerWithIdentifier:@"MyInformationAddress"];
        [self.navigationController pushViewController:mia animated:YES];
    }
    else if (sender.selectedSegmentIndex == 2)
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Settings" bundle:[NSBundle mainBundle]];
        MyInformationCertification *mia = [storyBoard instantiateViewControllerWithIdentifier:@"MyInformationCertification"];
        [self.navigationController pushViewController:mia animated:YES];
    }
    else if (sender.selectedSegmentIndex == 3)
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Settings" bundle:[NSBundle mainBundle]];
        MyInformationSchoolInfo *mia = [storyBoard instantiateViewControllerWithIdentifier:@"MyInformationSchoolInfo"];
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
    
    [self loaddata];
    
    [self.scroll_viewforSegment setContentSize:CGSizeMake(self.segment_menu.frame.size.width, self.scroll_viewforSegment.frame.size.height)];
    
    [self.scroll_content setContentSize:CGSizeMake(self.scroll_content.frame.size.width, self.lbl_emergencyEmail.frame.origin.y + 70)];
    
    
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
    NSString*str_checklogin=[NSString stringWithFormat:@"/teacher_info_tabs.php?staff_id=%@&school_id=%@&syear=%@",STAFF_ID_K,school_id1,year_id];
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
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"Address&Contactssucess"]];
        NSLog(@"str_123-----%@",str_123);
        self.lbl_TopTitle.text = [NSString stringWithFormat:@"%@ %@",[[[dictionary1 objectForKey:@"General_Info"] objectAtIndex:0] objectForKey:@"FIRST_NAME"], [[[dictionary1 objectForKey:@"General_Info"] objectAtIndex:0] objectForKey:@"LAST_NAME"] ];
        if([str_123 isEqualToString:@"1"])
        {
            NSArray  *sinfo=[dictionary1 objectForKey:@"Address_Contacts"];
            self.lbl_city.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_CITY_PRIMARY"]]];
            self.lbl_ContactHomePhone.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_HOME_PHONE"]]];
            
            self.lbl_ContactMobilePhone.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_MOBILE_PHONE"]]];
            
            self.lbl_ContactOfficePhone.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_WORK_PHONE"]]];
            
            self.lbl_ContactPersonalEmail.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_PERSONAL_EMAIL"]]];
            
            self.lbl_ContactWorkEmail.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_WORK_EMAIL"]]];
            
            self.lbl_emergencyEmail.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_EMERGENCY_EMAIL"]]];
            
            self.lbl_emergencyFirstName.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_EMERGENCY_FIRST_NAME"]]];
            
            self.lbl_emergencyHomePhone.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_EMERGENCY_HOME_PHONE"]]];
            
            self.lbl_emergencyLastName.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_EMERGENCY_LAST_NAME"]]];
            
            self.lbl_emergencyMobilePhone.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_EMERGENCY_MOBILE_PHONE"]]];
            
            self.lbl_emergencyRelatoion.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_EMERGENCY_RELATIONSHIP"]]];
            
            self.lbl_emergencyWorkPhone.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_EMERGENCY_WORK_PHONE"]]];
            
            self.lbl_Homezip.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_ZIP_PRIMARY"]]];
            
            self.lbl_MailingAddress1.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_ADDRESS1_MAIL"]]];
            
            self.lbl_MailingAddress2.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_ADDRESS2_MAIL"]]];
            
            self.lbl_MailingCity.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_CITY_MAIL"]]];
            
            self.lbl_MailingState.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_STATE_MAIL"]]];
            
            self.lbl_MailingZip.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_ZIP_MAIL"]]];
            
            self.lbl_state.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_STATE_PRIMARY"]]];
            
            self.lbl_street1.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_ADDRESS1_PRIMARY"]]];
            
            self.lbl_street2.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[sinfo objectAtIndex:0] objectForKey:@"STAFF_ADDRESS2_PRIMARY"]]];
            
            
            
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









@end
