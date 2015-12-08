//
//  ScheduleViewController.m
//  openSiS
//
//  Created by os4ed on 9/8/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import "attendetail.h"

#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "ip_url.h"

#import "SlideViewController.h"


@interface attendetail ()
{
    
    SlideViewController *slide;
    IBOutlet UILabel *label_nodatafound;
    
}


@property (strong, nonatomic) IBOutlet UIView *view_topBar;
@property (strong, nonatomic) IBOutlet UIView *view_markingperiod;
@property (strong, nonatomic) IBOutlet UITextField *text_markingperiod;
- (IBAction)button_back:(id)sender;
//////////////////////////////////sidebarlabels


///////////////////////////////////

@property (strong, nonatomic) IBOutlet UIView *view_topline;

@end

@implementation attendetail
//@synthesize staff_id,school_id,str_date,cpv_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    ary=[[NSMutableArray alloc]init];
    ary_days=[[NSMutableArray alloc]init];
    ary_period_list=[[NSMutableArray alloc]init];
    ary_days=[[NSMutableArray alloc]init];
    [self loaddata];
    [self styleborder:_view_markingperiod];
    
    
    slide = [[SlideViewController alloc]init];
    [slide setrect:self.view];
    [slide setparentobject:self parentname:@"attendetail"];
    
    [label_nodatafound setHidden:YES];
    
    UISwipeGestureRecognizer *swipeleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
    swipeleft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeleft.numberOfTouchesRequired = 1;
    [baseView addGestureRecognizer:swipeleft];
    UISwipeGestureRecognizer *swiperight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(open)];
    swiperight.direction = UISwipeGestureRecognizerDirectionRight;
    swiperight.numberOfTouchesRequired = 1;
    [baseView addGestureRecognizer:swiperight];
       
    
    //table.userInteractionEnabled = YES;
    //[table addGestureRecognizer:tapmainview];
    //newView.userInteractionEnabled = NO;

    
    //[Xbutton setFrame:CGRectMake(213, 0, 46, 30)];
    
    //[newView addSubview:Xbutton];
    // Do any additional setup after loading the view.
//    UITapGestureRecognizer *tapmainview = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close:)];
//    tapmainview.numberOfTapsRequired = 1;
//    tapmainview.delegate = self;
//    //[self.view addGestureRecognizer:tapmainview];
//    [baseView addGestureRecognizer:tapmainview];
//
//    UISwipeGestureRecognizer *swipeleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(close:)];
//    swipeleft.direction = UISwipeGestureRecognizerDirectionLeft;
//    swipeleft.numberOfTouchesRequired = 1;
//    [baseView addGestureRecognizer:swipeleft];
//    UISwipeGestureRecognizer *swiperight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
//    swiperight.direction = UISwipeGestureRecognizerDirectionRight;
//    swiperight.numberOfTouchesRequired = 1;
//    [baseView addGestureRecognizer:swiperight];
//    //table.userInteractionEnabled = YES;
//    //[table addGestureRecognizer:tapmainview];
//    //newView.userInteractionEnabled = NO;
//    swipeup = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(goup:)];
//    swipeup.direction = UISwipeGestureRecognizerDirectionUp;
//    swipeup.numberOfTouchesRequired = 1;
//    [baseView addGestureRecognizer:swipeup];
//    
//    swipedown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(godown:)];
//    swipedown.direction = UISwipeGestureRecognizerDirectionDown;
//    swipedown.numberOfTouchesRequired = 1;
//    [baseView addGestureRecognizer:swipedown];
    
    
    flag =0;k=0;z=0;change =0;
    
   
    
    
    if (self.view.frame.size.height == 568) {
        incdecheight = 30;
    }
    else if (self.view.frame.size.height == 667)
    {
        incdecheight = 35;
    }
    else if (self.view.frame.size.height == 736)
    {
        incdecheight = 39;
    }
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ary.count;
}
- (CellTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Cell";
    
    //static NSString *cellid = @"cell";
    //UITableViewCell *cell;
    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (CellTableViewCell*)[[[NSBundle mainBundle] loadNibNamed:@"CellTableViewCell" owner:self options:nil] objectAtIndex:0];
        
        
    }
//    ary_days=[[ary objectAtIndex:indexPath.row]objectForKey:@"DAYS"];
//    NSLog(@"---ARYDAYS--%@",ary_days);
//    NSString *str_day=[NSString stringWithFormat:@"%@",[[ary_days objectAtIndex:indexPath.row]objectForKey:@"status"]];
//    if ([str_day isEqualToString:@"1"]) {
//        cell.day1.backgroundColor=[UIColor colorWithRed:255.000f green:102.000f blue:0.000f alpha:1.00f];
//    }
//    
//    else
//    {
//    
//    
//    }
    
    cell.lbl_title.text=[NSString stringWithFormat:@"%@",[[ary objectAtIndex:indexPath.row]objectForKey:@"COURSE"]];
    cell.lbl_period.text=[NSString stringWithFormat:@"%@",[[ary objectAtIndex:indexPath.row]objectForKey:@"PERIOD"]];
    cell.lbl_room.text=[NSString stringWithFormat:@"%@",[[ary objectAtIndex:indexPath.row]objectForKey:@"ROOM"]];
    cell.lbl_term.text=[NSString stringWithFormat:@"%@",[[ary objectAtIndex:indexPath.row]objectForKey:@"TERM"]];
    
    NSString *timestr = [NSString stringWithFormat:@"%@",[[ary objectAtIndex:indexPath.row]objectForKey:@"DURATION"]];

    NSRange rr = [timestr rangeOfString:@","];
    
    if (rr.length == 0) {
        cell.lbl_time.text= timestr;
        cell.lbl_time2.text = @"";
    }
    else
    {
        cell.lbl_time.text = [timestr substringToIndex:rr.location];
        cell.lbl_time2.text = [timestr substringFromIndex:rr.location+1];
    }
    
    NSArray *array_days = [[NSArray alloc]init];
    array_days = [[ary objectAtIndex:indexPath.row] objectForKey:@"DAYS"];
    
    NSString *status = [NSString stringWithFormat:@"%@", [[array_days objectAtIndex:0] objectForKey:@"status"]];
    
    if ([status isEqualToString:@"1"]) {
        cell.day1.textColor = [UIColor colorWithRed:1.000f green:0.400f blue:0.000f alpha:1.00f];
    }
    else
    {
        cell.day1.textColor = [UIColor colorWithRed:0.792f green:0.792f blue:0.792f alpha:1.00f];
    }
    
    status = [NSString stringWithFormat:@"%@", [[array_days objectAtIndex:1] objectForKey:@"status"]];
    
    if ([status isEqualToString:@"1"]) {
        cell.day2.textColor = [UIColor colorWithRed:1.000f green:0.400f blue:0.000f alpha:1.00f];
    }
    else
    {
        cell.day2.textColor = [UIColor colorWithRed:0.792f green:0.792f blue:0.792f alpha:1.00f];
    }

    status = [NSString stringWithFormat:@"%@", [[array_days objectAtIndex:2] objectForKey:@"status"]];
    
    if ([status isEqualToString:@"1"]) {
        cell.day3.textColor = [UIColor colorWithRed:1.000f green:0.400f blue:0.000f alpha:1.00f];
    }
    else
    {
        cell.day3.textColor = [UIColor colorWithRed:0.792f green:0.792f blue:0.792f alpha:1.00f];
    }

    status = [NSString stringWithFormat:@"%@", [[array_days objectAtIndex:3] objectForKey:@"status"]];
    
    if ([status isEqualToString:@"1"]) {
        cell.day4.textColor = [UIColor colorWithRed:1.000f green:0.400f blue:0.000f alpha:1.00f];
    }
    else
    {
        cell.day4.textColor = [UIColor colorWithRed:0.792f green:0.792f blue:0.792f alpha:1.00f];
    }

    status = [NSString stringWithFormat:@"%@", [[array_days objectAtIndex:4] objectForKey:@"status"]];
    
    if ([status isEqualToString:@"1"]) {
        cell.day5.textColor = [UIColor colorWithRed:1.000f green:0.400f blue:0.000f alpha:1.00f];
    }
    else
    {
        cell.day5.textColor = [UIColor colorWithRed:0.792f green:0.792f blue:0.792f alpha:1.00f];
    }

    status = [NSString stringWithFormat:@"%@", [[array_days objectAtIndex:5] objectForKey:@"status"]];
    
    if ([status isEqualToString:@"1"]) {
        cell.day6.textColor = [UIColor colorWithRed:1.000f green:0.400f blue:0.000f alpha:1.00f];
    }
    else
    {
        cell.day6.textColor = [UIColor colorWithRed:0.792f green:0.792f blue:0.792f alpha:1.00f];
    }

    status = [NSString stringWithFormat:@"%@", [[array_days objectAtIndex:6] objectForKey:@"status"]];
    
    if ([status isEqualToString:@"1"]) {
        cell.day7.textColor = [UIColor colorWithRed:1.000f green:0.400f blue:0.000f alpha:1.00f];
    }
    else
    {
        cell.day7.textColor = [UIColor colorWithRed:0.792f green:0.792f blue:0.792f alpha:1.00f];
    }

    
    
    
    
 
    return cell;
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
  //  http://107.170.94.176/openSIS_CE6_Mobile/webservice/teacher_schedule.php?staff_id=2&syear=2015&school_id=1
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString *school_id123456=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    NSString *str_school_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    
       NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    NSString *STAFF_ID_K=[DF objectForKey:@"iphone"];
 
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/teacher_schedule.php?staff_id=%@&syear=%@&school_id=%@",STAFF_ID_K,str_school_year,school_id123456];
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
        if([str_123 isEqualToString:@"1"])
            
            
            
        {
            
            [table setHidden:NO ];
            [label_nodatafound setHidden:YES];
           
            ary=[dictionary1 objectForKey:@"schedule"];
            for (int i=0; i<ary.count; i++) {
             //   ary_days=[[ary objectAtIndex:i]objectForKey:@"DAYS"];
                
            }
            
            
            
            NSLog(@"ary------%@",ary);
            ary_period_list=[dictionary1 objectForKey:@"marking_periods_list"];
            
            [table reloadData];
        
        
        }
        
        
        else
        {
          //  NSString *str_msg=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"error_msg"]];
          //  lbl_show.hidden=NO;
//  mtable.hidden=YES;
            //  NSString *str_msg=[NSString stringWithFormat:@"%@",[dictionary1 objectForKey:@"error_msg"]];
          //  lbl_show.text=[NSString stringWithFormat:@"%@",str_msg];
            // UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:str_msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            // [alert show];
            
            [table setHidden:YES];
            [label_nodatafound setHidden:NO];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
      
    }];
    
    
    [operation start];
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
    
    
    
    
    
    
    
}



-(void)styleborder:(UIView *)view
{
    view.layer.borderWidth = 1.0f;
    view.clipsToBounds = YES;
    view.layer.borderColor = [[UIColor colorWithRed:0.200f green:0.600f blue:0.851f alpha:1.00f]CGColor];
}


#pragma mark TopViewAnimation

-(IBAction)goup:(id)sender
{
    
    if (flag == 0) {
        [UIView animateWithDuration:0.5f animations:^{
            _view_topBar.frame =
            CGRectMake(_view_topBar.frame.origin.x,
                       _view_topBar.frame.origin.y - incdecheight,
                       _view_topBar.frame.size.width,
                       _view_topBar.frame.size.height);
            _view_topline.frame =
            CGRectMake(_view_topline.frame.origin.x,
                       _view_topline.frame.origin.y - incdecheight,
                       _view_topline.frame.size.width,
                       _view_topline.frame.size.height);
            table.frame =
            CGRectMake(table.frame.origin.x,
                       table.frame.origin.y - incdecheight ,
                       table.frame.size.width,
                       table.frame.size.height + incdecheight);
        }];
        flag = 1;
        
    }
}

-(IBAction)godown:(id)sender
{
    if (flag == 1) {
        [UIView animateWithDuration:0.5f animations:^{
            _view_topBar.frame =
            CGRectMake(_view_topBar.frame.origin.x,
                       _view_topBar.frame.origin.y + incdecheight,
                       _view_topBar.frame.size.width,
                       _view_topBar.frame.size.height);
            _view_topline.frame =
            CGRectMake(_view_topline.frame.origin.x,
                       _view_topline.frame.origin.y + incdecheight,
                       _view_topline.frame.size.width,
                       _view_topline.frame.size.height);
            table.frame =
            CGRectMake(table.frame.origin.x,
                       table.frame.origin.y + incdecheight,
                       table.frame.size.width,
                       table.frame.size.height- incdecheight);
            
        }];
        flag = 0;
        
    }
    
}
-(void)setoffforscroll:(float)y
{
    if (y > z && z == 0) {
        k = 1;
        z = y;
    }
    else if ( y > z && change == 0 )
    {
        k=0;
        z = y;
    }
    else if ( y > z && change == 1 )
    {
        k=1;
        z = y;
    }
    else if (y < z )
    {
        change = 1;
        k = -1;
        z = y;
    }
    else if ( y < z)
    {
        k = 0;
        z = y;
    }
    
    //    else if (y == 0) {
    //        k = -1;
    //        z = y;
    //    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    
    [self setoffforscroll:scrollView.contentOffset.y];
    
    
    
    
    if (k == 1) {
        [self goup:nil];
        
    }
    else if ( k == -1 ){
        [self godown:nil];
        
    }
    
    //NSLog(@"x offset:  %f", scrollView.contentOffset.x);
    //NSLog(@"y offset:  %f", scrollView.contentOffset.y);
}


- (IBAction)button_back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



-(IBAction)click:(id)sender
{
    
    [self open];
}


- (void)tableView:(UITableView *)tableView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ok");

}
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -100; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


#pragma mark SideBar  Open____Close  Function

-(void)open
{
    [slide open:self.view];
    
}
-(void)close
{
    [slide close:nil];
    
    
}

#pragma mark - TabBar

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



@end
