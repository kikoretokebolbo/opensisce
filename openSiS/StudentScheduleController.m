//
//  StudentScheduleController.m
//  openSiS
//
//  Created by os4ed on 12/3/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import "StudentScheduleController.h"
#import "TeacherDashboardViewController.h"

@interface StudentScheduleController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *text_lastname, *text_firstname, *text_studentid, *text_altid, *text_streetaddress, *text_city, *text_state, *text_postcode, *text_grade, *text_activity;

@property (weak, nonatomic) IBOutlet UISwitch *switch_includeInactive;
@property (weak, nonatomic) IBOutlet UIButton *button_save;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (weak, nonatomic) IBOutlet UIView *view_lastname, *view_firstname, *view_studentid, *view_altid, *view_streetaddress, *view_city, *view_state, *view_postcode, *view_grade, *view_activity;


- (IBAction)action_save:(id)sender;

@end

@implementation StudentScheduleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.scroll setContentSize:CGSizeMake(self.scroll.frame.size.width, self.button_save.frame.origin.y + 80)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self dodesignsforTextViews:self.view_activity];
    [self dodesignsforTextViews:self.view_altid];
    [self dodesignsforTextViews:self.view_city];

    
    [self dodesignsforTextViews:self.view_firstname];
    [self dodesignsforTextViews:self.view_grade];
    [self dodesignsforTextViews:self.view_lastname];
    
    
    [self dodesignsforTextViews:self.view_postcode];
    [self dodesignsforTextViews:self.view_state];
    [self dodesignsforTextViews:self.view_streetaddress];
    
    
    [self dodesignsforTextViews:self.view_studentid];
    
}

#pragma mark - Designs

- (void)dodesignsforTextViews:(UIView *)disview
{
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.620f green:0.620f blue:0.620f alpha:1.00f] CGColor]];
    [disview.layer setBorderWidth:1.0f];
    [disview.layer setCornerRadius:2.0f];
    disview.clipsToBounds = YES;
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

- (IBAction)action_back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)action_save:(id)sender
{
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)advancedSearch:(id)sender
{
    
}

@end
