//
//  MyInformationSchoolInfo.m
//  openSiS
//
//  Created by os4ed on 1/11/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import "MyInformationSchoolInfo.h"
#import "MyInformationCertification.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "ip_url.h"

#import "TeacherDashboardViewController.h"
#import "MyInformationAddress.h"
#import "MyInformationGeneral.h"
#import "MyInformationSchoolInfo.h"
#import "MyInformationSchoolInfoCell.h"
#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"



@interface MyInformationSchoolInfo ()
@property (weak, nonatomic) IBOutlet UILabel *lbl_category;
@property (weak, nonatomic) IBOutlet UILabel *lbl_jobtitle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_joiningdate;

@property (weak, nonatomic) IBOutlet UILabel *lbl_TopTitle;
@property (weak, nonatomic) IBOutlet UITableView *table_cert;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment_menu;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_viewforSegment;
@end

@implementation MyInformationSchoolInfo
{
    NSMutableArray *array_cert;
}
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


- (void)viewDidLoad {
    [super viewDidLoad];
    array_cert = [[NSMutableArray alloc]init];
    [self loaddata];
    
    [self.scroll_viewforSegment setContentSize:CGSizeMake(self.segment_menu.frame.size.width, self.scroll_viewforSegment.frame.size.height)];
    
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
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"SchoolInfosuccess"]];
        NSLog(@"str_123-----%@",str_123);
        self.lbl_TopTitle.text = [NSString stringWithFormat:@"%@ %@",[[[dictionary1 objectForKey:@"General_Info"] objectAtIndex:0] objectForKey:@"FIRST_NAME"], [[[dictionary1 objectForKey:@"General_Info"] objectAtIndex:0] objectForKey:@"LAST_NAME"] ];
        if([str_123 isEqualToString:@"1"])
        {
            self.lbl_category.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[[dictionary1 objectForKey:@"School_Info"] objectAtIndex:0] objectForKey:@"CATEGORY"]]];
            self.lbl_jobtitle.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[[dictionary1 objectForKey:@"School_Info"] objectAtIndex:0] objectForKey:@"JOB_TITLE"]]];
            self.lbl_joiningdate.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[[dictionary1 objectForKey:@"School_Info"] objectAtIndex:0] objectForKey:@"JOINING_DATE"]]];
            
            array_cert = [[[dictionary1 objectForKey:@"School_Info"] objectAtIndex:0] objectForKey:@"school_Details"];
            [self.table_cert reloadData];
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

#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array_cert.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInformationSchoolInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyInformationSchoolInfoCell"];
    
    cell.lbl_schoolname.text = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:indexPath.row] objectForKey:@"TITLE"]]];
    
    cell.lbl_profile.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:indexPath.row] objectForKey:@"PROFILE"]]];
    cell.lbl_startdate.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:indexPath.row] objectForKey:@"START_DATE"]]];
    
    
   // cell.lbl_activeornot.text  = [self nullChecker:[NSString stringWithFormat:@"%@",[[array_cert objectAtIndex:indexPath.row] objectForKey:@"STAFF_CERTIFICATION_DATE"]]];
    
    return cell;
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



@end

