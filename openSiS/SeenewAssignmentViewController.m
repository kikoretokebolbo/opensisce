//
//  SeenewAssignmentViewController.m
//  openSiS
//
//  Created by os4ed on 11/4/15.
//  Copyright © 2015 openSiS. All rights reserved.
//

#import "SeenewAssignmentViewController.h"
#import "TeacherDashboardViewController.h"
#import "AppDelegate.h"
#import "EditNewAssignmentViewController.h"
#import "AFNetworking.h"
#import "ClassWorkViewController.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"


@interface SeenewAssignmentViewController ()
@property (strong, nonatomic) IBOutlet UILabel *msg_count_tab;
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;
@property (strong, nonatomic) IBOutlet UIView *view_title;
@property (strong, nonatomic) IBOutlet UITextField *text_title;
@property (strong, nonatomic) IBOutlet UIView *view_points;
@property (strong, nonatomic) IBOutlet UITextField *text_points;
@property (strong, nonatomic) IBOutlet UIView *view_assignmenttypes;
@property (strong, nonatomic) IBOutlet UITextField *text_assignmenttypes;
@property (strong, nonatomic) IBOutlet UILabel *lbl_points;
@property (strong, nonatomic) IBOutlet UIView *view_assignDate;
@property (strong, nonatomic) IBOutlet UITextField *text_assigndate;
@property (strong, nonatomic) IBOutlet UILabel *lbl_assigndate;
@property (strong, nonatomic) IBOutlet UIView *view_duedate;
@property (strong, nonatomic) IBOutlet UITextField *text_duedate;
@property (strong, nonatomic) IBOutlet UIView *view_description;
@property (strong, nonatomic) IBOutlet UITextView *textview_description;
@property (strong, nonatomic) IBOutlet UILabel *lbl_description;
@property (strong, nonatomic) IBOutlet UILabel *lbl_duedate;
@property (strong, nonatomic) IBOutlet UIButton *button_save;
@property (strong, nonatomic) IBOutlet UILabel *lbl_assignmenttype;
@property (strong, nonatomic) IBOutlet UILabel *lbl_MainTitle;
@property (strong, nonatomic) IBOutlet UIView *view_applytoall;
@property (strong, nonatomic) IBOutlet UITextField *text_applytoall;
@property (strong, nonatomic) IBOutlet UIView *view_more;
- (IBAction)action_edit:(id)sender;
- (IBAction)action_delete:(id)sender;
- (IBAction)action_more:(id)sender;

@end

@implementation SeenewAssignmentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    
    
    self.msg_count_tab.text=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"message_count"]];
    _view_more.hidden = YES;
    
    
    [self dodesign];
    [self callgetdata];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
   
}
-(void)dodesign
{
    [self design:self.view_assignDate];
    [self design:self.view_assignmenttypes];
    [self design:self.view_description];
    [self design:self.view_duedate];
    [self design:self.view_points];
    [self design:self.view_title];
    [self design:self.view_applytoall];
    [self design_hidden];
}

- (IBAction)action_back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)action_more:(id)sender {
    if (_view_more.hidden) {
        _view_more.hidden = NO;
    }
    else
    {
        _view_more.hidden = YES;
    }
}

#pragma mark - design

-(void)design_hidden
{
    _view_more.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _view_more.layer.borderWidth = 1.5f;
    [_view_more.layer setCornerRadius:2.0f];
    [_view_more.layer setShadowOffset:CGSizeMake(4, 1)];
    [_view_more.layer setShadowOpacity:0.7f];
    [_view_more.layer setShadowRadius:3.0f];
    [_view_more.layer setShadowColor:[[UIColor darkGrayColor] CGColor]];
        //_view_more.clipsToBounds = YES;
}

-(void)design:(UIView*)obj
{
    
    obj.layer.borderWidth =  1.0f;
    obj.backgroundColor = [UIColor whiteColor];
    obj.layer.borderColor = [[UIColor whiteColor]CGColor];//[[UIColor colorWithRed:0.808f green:0.808f blue:0.808f alpha:1.00f]CGColor];
    [obj.layer setCornerRadius:3.5f];
    obj.clipsToBounds = YES;
    
}



#pragma mark - Tabbar

-(IBAction)home:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    TeacherDashboardViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"dash"];
    
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
#pragma mark—Settings
-(IBAction)settings:(id)sender{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Settings"bundle:nil];
    SettingsMenu *obj = [sb instantiateViewControllerWithIdentifier:@"SettingsMenu"];
    [self.navigationController pushViewController:obj animated:YES];
}

#pragma mark -- calendar
-(IBAction)calendar:(id)sender
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"schoolinfo"bundle:nil];
    Month1ViewController *obj = [sb instantiateViewControllerWithIdentifier:@"month1"];
    [self.navigationController pushViewController:obj animated:YES];
}



- (IBAction)action_edit:(id)sender {
    [self action_more:nil];
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditNewAssignmentViewController *obj = [[EditNewAssignmentViewController alloc]init];
    obj = [sb instantiateViewControllerWithIdentifier:@"editassignment"];
    obj.dict_main = self.dict_main;
    //obj.dataDIC = [arr_asstypes objectAtIndex:currentIndex.row];
    [self.navigationController pushViewController:obj animated:YES];
    

    
}

- (IBAction)action_delete:(id)sender {
    [self action_more:nil];
//  NSString *assignmentid = [[arr_assignment objectAtIndex:currentIndex.row] objectForKey:@"ASSIGNMENT_ID"];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    
    NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    NSString *STAFF_ID_K=[DF objectForKey:@"iphone"];
    
    
    NSString *school_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    // [AFJSONResponseSerializer serializer];
    NSString *year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    NSString *mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    
 [self deletefromClassWorkwithStaffID:STAFF_ID_K schoolID:school_id year:year_id mpID:mp_id cpvID:cpv_id1 assignmentID:ASSIGNMENT_ID school_id:school_id];

    
    
}

#pragma mark - Data Handlers
-(void)deletefromClassWorkwithStaffID:(NSString *)staffID schoolID:(NSString*)schoolID year:(NSString*)year mpID:(NSString*)mpID cpvID:(NSString *)cpvID assignmentID:(NSString *)assgnmentID school_id:(NSString*)school_id
{
    
    static NSString *success;
    success = [NSString stringWithFormat:@"0"];
    
    ip_url *ipurl = [[ip_url alloc]init];
    NSString *baseurl = [ipurl ipurl];
    
    NSString *thisurl = [NSString stringWithFormat:@"%@/assignments.php?type=delete&staff_id=%@&school_id=%@&syear=%@&mp_id=%@&cpv_id=%@&assignment_id=%@&school_id=%@",baseurl,staffID,schoolID,year,mpID,cpvID,assgnmentID,school_id];
    NSLog(@"value in DELETE THISURL in Model Assignment-------%@",thisurl);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:thisurl]];
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    // operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];// Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"yeayayayaay");
        NSMutableDictionary *  dictionary1=[[NSMutableDictionary alloc]init];
        dictionary1 = (NSMutableDictionary *)responseObject;
        // dict = [[NSDictionary alloc]init];
        // dict = dictionary1;
        
        NSLog(@"dictinary-------%@",dictionary1);
        NSString *successStr = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"success"]];
        NSString *errstring = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"err_msg"]];
        if ([successStr isEqualToString:@"1"]) {
            
           // [self performSelector:@selector(callgetdata) withObject:self afterDelay:.3f];
            NSUserDefaults*df=[NSUserDefaults standardUserDefaults];
          
            [df setObject: _lbl_MainTitle.text forKey:@"title123"];
            UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ClassWorkViewController *obj = [sb instantiateViewControllerWithIdentifier:@"classwork"];
            
            [self.navigationController pushViewController:obj animated:YES];
            

            
        }
        else
        {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message: errstring delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            
            
        }
        
        NSLog(@"value is dictionary1 in Model Assignment-------%@",dictionary1); // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //   transparentView.hidden=NO;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:[NSString stringWithFormat:@"%@",error] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        NSLog(@"Model Assignment failed with error: %@----",error);
        //  [self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
}





-(void)callgetdata
{
    //NSUserDefaults*df=[NSUserDefaults standardUserDefaults];
    //NSString *str_assign_id=[df objectForKey:@"iphone_id"];
    
    
    NSString *str_assgnID = [self.dict_main objectForKey:@"ASSIGNMENT_ID"];
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    
    NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    NSString *STAFF_ID_K=[DF objectForKey:@"iphone"];
    
    NSString *school_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];

    NSString *mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    
    
    [self getdataonloadwithStaffid:STAFF_ID_K mp_ID:mp_id CPV_ID:cpv_id1 Assignment_id:str_assgnID school_id:school_id];
    
    
}

-(void)getdataonloadwithStaffid:(NSString*)staffID  mp_ID:(NSString*)mp_ID CPV_ID:(NSString *)cpvID Assignment_id:(NSString *)assID school_id:(NSString*)school_id

{
    
    ip_url *ipurl = [[ip_url alloc]init];
    NSString *baseurl = [ipurl ipurl];
    
    NSString *thisurl = [NSString stringWithFormat:@"%@/assignments.php?type=view_selected&staff_id=%@&mp_id=%@&cpv_id=%@&assignment_id=%@&school_id=%@",baseurl,staffID,mp_ID,cpvID,assID,school_id];
    NSLog(@"value in THISURL in Model CLASSWork-------%@",thisurl);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:thisurl]];
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    // operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];// Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"yeayayayaay");
        NSMutableDictionary *  dictionary1=[[NSMutableDictionary alloc]init];
        dictionary1 = (NSMutableDictionary *)responseObject;
        // dict = [[NSDictionary alloc]init];
        // dict = dictionary1;
        
        
        NSLog(@"datavalue----%@",dictionary1);
        NSString *successStr = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"success"]];
        NSString *errstring = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"err_msg"]];
        if ([successStr isEqualToString:@"1"]) {
            
            NSString *str_apply = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"APPLY_TO_ALL"]];
            if ([str_apply isEqualToString:@"Y"]) {
                _text_applytoall.text = @"YES";
            }
            else
            {
                _text_applytoall.text = @"NO";
            }
            NSString *str_assigndate = [self changeDate:[NSString stringWithFormat:@"%@", [dictionary1 objectForKey:@"ASSIGNED_DATE"]]];
            NSString *str_duedate = [self changeDate:[NSString stringWithFormat:@"%@", [dictionary1 objectForKey:@"DUE_DATE"]]];
            _text_assigndate.text = str_assigndate;
            _text_duedate.text = str_duedate;
            _lbl_MainTitle.text = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"TITLE"]];
            _text_title.text = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"TITLE"]];
            _text_points.text = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"POINTS"]];
            
            NSString *c_d= [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"DESCRIPTION"]];
            if ([c_d isEqualToString:@"<null>"]) {
                _textview_description.text=@"";
            }
            
            else
            {
                _textview_description.text = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"DESCRIPTION"]];
            }

         //   _textview_description.text = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"DESCRIPTION"]];
            _text_assignmenttypes.text = [NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"ASSIGNMENT_TYPE_TITLE"]];
            ASSIGNMENT_ID=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"ASSIGNMENT_ID"]];
            
            NSLog(@"Array Data on CLASSWORK ----- %@ ", dictionary1);
            
            
        }
        else
        {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message: errstring delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            
            
        }
        
        NSLog(@"value is dictionary1 in Model CLASSWORK-------%@",dictionary1); // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //   transparentView.hidden=NO;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:[NSString stringWithFormat:@"%@",error] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        NSLog(@"Model CLASSWORK failed with error: %@----",error);
        //  [self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
   // [self.tablev reloadData];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    //return dict;
}



#pragma mark - Date Format Changer

-(NSString *)changeDate:(NSString *)date
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *d = [[NSDate alloc]init];
    d = [df dateFromString:date];
    [df setDateFormat:@"MMM dd, yyyy"];
    NSString *datestr = [df stringFromDate:d];
    NSLog(@"DATE STRING ON CHANGE CLASSWORK: %@",datestr);
    
    return datestr;
    
}


@end
