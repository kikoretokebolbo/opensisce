//
//  ChangePassword.m
//  openSiS
//
//  Created by os4ed on 1/13/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import "ChangePassword.h"
#import "AppDelegate.h"
#import "TeacherDashboardViewController.h"
#import "ip_url.h"
#import "SBJSON.h"
#import "MBProgressHUD.h"
#import "NSString+SBJSON.h"
#import "NSObject+SBJSON.h"
#import "ABOUT.h"

#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"

@interface ABOUT()<UITextFieldDelegate>


@end

@implementation ABOUT
{
    NSString *curpas,*newpas,*confpas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
}




- (void)dodesignforTextFields:(UITextField *)disview
{
    // [disview.layer setBorderColor:[[UIColor colorWithRed:0.816f green:0.816f blue:0.816f alpha:1.00f]CGColor]];
    //[disview.layer setBorderWidth:1.0f];
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.620f green:0.620f blue:0.620f alpha:1.00f] CGColor]];
    [disview.layer setBorderWidth:1.0f];
    [disview.layer setCornerRadius:1.5f];
    
}

-(void)alertmsg:(NSString*)msg
{
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:msg message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (IBAction)action_cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - Tabbar
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
