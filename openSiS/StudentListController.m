//
//  StudentListController.m
//  openSiS
//
//  Created by os4ed on 12/9/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import "StudentListController.h"
#import "StudentListCell.h"
#import "AppDelegate.h"
#import "TeacherDashboardViewController.h"
#import "ip_url.h"
#include "StudentScheduleViewController.h"
#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"

@interface StudentListController ()<UITableViewDataSource,UITableViewDelegate>

{
    IBOutlet UILabel *label_nodata;
}

@property (strong, nonatomic) IBOutlet UITableView *table;

@end

@implementation StudentListController
{
    NSMutableArray *array_studentData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    array_studentData = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
    [self loaddata];
    self.table.tableFooterView = [[UIView alloc]init];
}

//
#pragma mark---Settings

-(IBAction)settings:(id)sender
{
    
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    SettingsMenu *obj = [sb instantiateViewControllerWithIdentifier:@"SettingsMenu"];
    
    
    [self.navigationController pushViewController:obj animated:YES];
    
}

-(void)loaddata
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            [self performSelector:@selector(loaddata1) withObject:nil afterDelay:3.0];
        });
    });
    
    
}
-(void)loaddata1
{
    // http://107.170.94.176/openSIS_CE6_Mobile/webservice/search_student.php?school_id=1&syear=2015&staff_id=2&mp_id=16&cpv_id=1
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString *school_id123456=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    NSString *str_school_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    NSString *STAFF_ID_K=[DF objectForKey:@"iphone"];
    
    NSString *mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/search_student.php?school_id=%@&syear=%@&staff_id=%@&mp_id=%@&cpv_id=%@%@",school_id123456,str_school_year,STAFF_ID_K,mp_id,cpv_id1,self.senderString];
    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSString *urlEncoded = [url12 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"----%@",url12);
    // NSURL *url = [NSURL URLWithString:url12];
    // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest  *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlEncoded]];
    //NSURL *url = [NSURL URLWithString:url12];
   // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary1=[[NSMutableDictionary alloc]init];
        dictionary1 = (NSMutableDictionary *)responseObject;
        NSLog(@"value is-------%@",dictionary1); // ei khanei nslog korle dekhache, blocker baire dekhache na
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"success"]];
        NSLog(@"success is: -----%@",str_123);
        if([str_123 isEqualToString:@"1"])
        {
            [self.table setHidden:NO];
            [label_nodata setHidden:YES];
            array_studentData = [dictionary1 objectForKey:@"student_data"];
            [self.table reloadData];
            
        }
        else
        {
            [self.table setHidden:YES];
            [label_nodata setHidden:NO];
            UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Not Found" message:[dictionary1 objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alrt show];
        }
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.table setHidden:YES];
        [label_nodata setHidden:NO];
    }];
    [operation start];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array_studentData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentlistcell"];
    
    cell.LABEL_NAME.text = [[array_studentData objectAtIndex:indexPath.row] objectForKey:@"FULL_NAME"];
    cell.LABEL_ID.text = [[array_studentData objectAtIndex:indexPath.row] objectForKey:@"STUDENT_ID"];
    cell.label_grade.text = [[array_studentData objectAtIndex:indexPath.row] objectForKey:@"GRADE_ID"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    StudentScheduleViewController *slc = [[StudentScheduleViewController alloc]init];
    slc = [sb instantiateViewControllerWithIdentifier:@"studentscheduleview"];
    slc.studentID = [[array_studentData objectAtIndex:indexPath.row] objectForKey:@"STUDENT_ID"];
    slc.studentName = [[array_studentData objectAtIndex:indexPath.row] objectForKey:@"FULL_NAME"];
    
    [self.navigationController pushViewController:slc animated:YES];
}


- (IBAction)action_back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

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

#pragma mark -- calendar
-(IBAction)calendar:(id)sender
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"schoolinfo"bundle:nil];
    Month1ViewController *obj = [sb instantiateViewControllerWithIdentifier:@"month1"];
    [self.navigationController pushViewController:obj animated:YES];
}



@end
