//
//  CourseManagerSubject.m
//  openSiS
//
//  Created by os4ed on 1/12/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import "CourseManagerSubject.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "ip_url.h"
#import "TeacherDashboardViewController.h"
#import "CourseManagerSubjectCell.h"
#import "CourseManagerCourse.h"
#import "SlideViewController.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"

@interface CourseManagerSubject ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table_v;
@property (strong, nonatomic) IBOutlet UILabel *lbl_subtitle;
@property (strong, nonatomic) IBOutlet UIView *view_blue_sub;
@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UITextField *text_blueheader;

@end

@implementation CourseManagerSubject
{
    NSMutableArray *array_subjects;
    SlideViewController *slide;
    UIPickerView *selectcustomerpicker;
    NSString *str_selectedgroupID;
    NSMutableArray *array_quaters;
}
@synthesize baseView;

- (void)viewDidLoad {
    [super viewDidLoad];
    slide = [[SlideViewController alloc]init];
    [slide setrect:self.view];
    [slide setparentobject:self parentname:@"coursemanager"];
    [self dodesigns:self.view_blue_sub];
    
    array_quaters = [[NSMutableArray alloc]init];
    
    array_subjects = [[NSMutableArray alloc] init];
    [self loaddata];
    self.table_v.tableFooterView = [[UIView alloc]init];
    UISwipeGestureRecognizer *swiperight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(open)];
    swiperight.direction = UISwipeGestureRecognizerDirectionRight;
    swiperight.numberOfTouchesRequired = 1;
    [baseView addGestureRecognizer:swiperight];
    [self accessingtheAppDelegateDictionary];
    [self courseperiod123];
}
-(IBAction)back:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(NSString *)getCourseperiodtextfielddata
{
    return self.text_blueheader.text;
}
-(void)accessingtheAppDelegateDictionary
{
    AppDelegate *appd = [[UIApplication sharedApplication] delegate];
    array_quaters = [appd.dic objectForKey:@"marking_period_list"];
    
    for (int i = 0; i < array_quaters.count; ++i) {
        NSString *s = [[array_quaters objectAtIndex:i] objectForKey:@"id"];
        if ([s isEqualToString:[appd.dic objectForKey:@"UserMP"]]) {
            self.text_blueheader.text = [[array_quaters objectAtIndex:i] objectForKey:@"title"];
        }
    }
    
    NSLog(@"dictionary: %@", appd.dic);
    [selectcustomerpicker reloadAllComponents];
}



- (void)dodesigns:(UIView *)view_design
{
    [view_design.layer setBorderColor:[[UIColor darkGrayColor]CGColor]];
    [view_design.layer setBorderWidth:1.0f];
    [view_design.layer setCornerRadius:2.0f];
    view_design.clipsToBounds = YES;
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
-(void)open
{
    [slide open:self.view];
}

-(void)loaddata1
{
    // NSString *inbox=@"inbox";
  
    
  //  http://107.170.94.176/openSIS_CE6_Mobile/webservice/course_manager.php?staff_id=2&school_id=1&syear=2015&mp_id=17&view_type=subject&subject_id=&course_id=&cp_id=
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //   NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF = [NSUserDefaults standardUserDefaults];
    NSString *STAFF_ID_K = [DF objectForKey:@"iphone"];
    NSString *school_id1 = [NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    NSString *year_id = [NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    NSString *mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    
    NSString*str_checklogin=[NSString stringWithFormat:@"/course_manager.php?staff_id=%@&school_id=%@&syear=%@&mp_id=%@&view_type=subject&subject_id=&course_id=&cp_id=",STAFF_ID_K,school_id1,year_id,mp_id];
    
    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    
    NSString *url12 = [NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
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
        
        if([str_123 isEqualToString:@"1"])
        {
            array_subjects = [dictionary1 objectForKey:@"subjects"];
            self.lbl_subtitle.text = [NSString stringWithFormat:@"Subjects (%lu)", (unsigned long)array_subjects.count];
            [self.table_v reloadData];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array_subjects.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseManagerSubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CourseManagerSubjectCell"];
    cell.lbl_subName.text = [self nullChecker:[NSString stringWithFormat:@"%@", [[array_subjects objectAtIndex:indexPath.row] objectForKey:@"TITLE"]]];
    cell.lbl_count.text = [self nullChecker:[NSString stringWithFormat:@"%@", [[array_subjects objectAtIndex:indexPath.row] objectForKey:@"COURSE_COUNT"]]];    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"schoolinfo" bundle:[NSBundle mainBundle]];
    CourseManagerCourse *obj  = [sb instantiateViewControllerWithIdentifier:@"CourseManagerCourse"];
    obj.subject_id = [self nullChecker:[NSString stringWithFormat:@"%@", [[array_subjects objectAtIndex:indexPath.row] objectForKey:@"SUBJECT_ID"]]];
    [self.navigationController pushViewController:obj animated:YES];
    
}



- (NSString *)nullChecker:(NSString *)strToCheck
{
    if ([strToCheck isEqualToString:@"(null)"] || [strToCheck isEqualToString:@"<null>"] || [strToCheck isEqualToString:@"null"]) {
        return @" ";
    }
    return strToCheck;
}

- (IBAction)click:(id)sender
{
    [self open];
}

#pragma mark - picker
-(void)courseperiod123{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker  .delegate = self;
    
    selectcustomerpicker .dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag =  60;
    self.text_blueheader.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked1)];
    
    [barItems addObject:doneBtn];
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    self.text_blueheader.inputAccessoryView = mypickerToolbar;
    
}


-(void)pickerDoneClicked1
{
    [self.text_blueheader resignFirstResponder];
    AppDelegate *appdel = (AppDelegate*)[[UIApplication sharedApplication]delegate] ;
    NSMutableDictionary *dic = [appdel.dic mutableCopy];
    [dic setObject:str_selectedgroupID forKey:@"UserMP"];
    appdel.dic = [dic mutableCopy];
    [self loaddata];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    if (pickerView == selectcustomerpicker) {
        return array_quaters.count;
        
    }
       return 0;
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    if (pickerView == selectcustomerpicker) {
        return [[array_quaters objectAtIndex:row] objectForKey:@"title"];
    }
    
    return nil;
}


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    if (pickerView == selectcustomerpicker) {
        self.text_blueheader.text =(NSString*)[[array_quaters objectAtIndex:row] objectForKey:@"title"];
        str_selectedgroupID = (NSString*)[[array_quaters objectAtIndex:row] objectForKey:@"id"];
    }
    
}
#pragma mark - Tabbar

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


@end
