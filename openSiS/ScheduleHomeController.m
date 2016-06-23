//
//  ScheduleHomeController.m
//  openSiS
//
//  Created by os4ed on 12/3/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import "ScheduleHomeController.h"
#import "TeacherDashboardViewController.h"
#import "SlideViewController.h"
#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"

@interface ScheduleHomeController ()
{
    SlideViewController *slide;
   // NSString *courseperiodnamestr;
    IBOutlet UIView *baseView;
}


@property (strong, nonatomic) IBOutlet UIView *view_content;

@end

@implementation ScheduleHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    slide = [[SlideViewController alloc]init];
    [slide setrect:self.view];
    [slide setparentobject:self parentname:@"schedulehome"];
    
    
    [self dodesign];
    
    
    UISwipeGestureRecognizer *swipeleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
    swipeleft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeleft.numberOfTouchesRequired = 1;
    [baseView addGestureRecognizer:swipeleft];
    UISwipeGestureRecognizer *swiperight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(open)];
    swiperight.direction = UISwipeGestureRecognizerDirectionRight;
    swiperight.numberOfTouchesRequired = 1;
    [baseView addGestureRecognizer:swiperight];

    
}

#pragma mark SideBarOpenFunction

-(void)open
{
    [slide open:self.view];
    
}
-(void)close
{
    [slide close:nil];
    
    
}

#pragma mark---Settings

-(IBAction)settings:(id)sender
{
    
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    SettingsMenu *obj = [sb instantiateViewControllerWithIdentifier:@"SettingsMenu"];
    
    
    [self.navigationController pushViewController:obj animated:YES];
    
}

#pragma mark - Do Design

- (void) dodesign
{
    [self.view_content.layer setBorderColor:[[UIColor colorWithRed:0.808f green:0.808f blue:0.808f alpha:1.00f] CGColor]];
    [self.view_content.layer setBorderWidth:1.0f];
    [self.view_content.layer setCornerRadius:2.0f];
    self.view_content.clipsToBounds = YES;
}


- (IBAction)action_click:(id)sender {
    
    
    [self open];
    
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


#pragma mark -- calendar
-(IBAction)calendar:(id)sender
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"schoolinfo"bundle:nil];
    Month1ViewController *obj = [sb instantiateViewControllerWithIdentifier:@"month1"];
    [self.navigationController pushViewController:obj animated:YES];
}

@end
