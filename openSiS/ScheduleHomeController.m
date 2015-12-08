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

@end
