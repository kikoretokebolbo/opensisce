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

#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"
#import "SettingsMenu.h"
#import "Month1ViewController.h"
#import "SettingsMenu.h"
#import "msg1.h"
#import "TeacherDashboardViewController.h"



@interface ChangePassword ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *text_currentpass;
@property (strong, nonatomic) IBOutlet UITextField *text_newpass;
@property (strong, nonatomic) IBOutlet UITextField *text_confirmpas;

@end

@implementation ChangePassword
{
    NSString *curpas,*newpas,*confpas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dodesignforTextFields:self.text_confirmpas];
    [self dodesignforTextFields:self.text_currentpass];
    [self dodesignforTextFields:self.text_newpass];
    // Do any additional setup after loading the view.
}

- (IBAction)actionSave:(id)sender {
    
    
    curpas = self.text_currentpass.text;
    newpas = self.text_newpass.text;
    confpas = self.text_confirmpas.text;
    
    if (curpas.length > 0 && newpas.length > 0 && confpas.length > 0) {
        if ([newpas isEqualToString:confpas]) {
            [self savedataongroups];
        }
        else
        {
            [self alertmsg:@"New Password doesn't match with Confirm Password"];
        }
    }
    else
    {
        [self alertmsg:@"No field can be empty"];
    }

    
    
    
}


- (void)savedataongroups
{
   
    
  //  http://107.170.94.176/openSIS_CE6_Mobile/webservice/teacher_update_pwd.php?staff_id=2&school_id=1&syear=2015&current=teacher&new=teacher&verify=teacher
    
    
//    
//    NSMutableArray *mail_detail = [[NSMutableArray alloc]init];
//    
//    
//    NSString * str111;// = [Base64 encode:data];
//    str111=[mail_detail JSONRepresentation];
//    
//    
//    
//    NSLog(@"----String To Post To Server ---%@",str111);
    
    
    
    // NSMutableDictionary    *dict=[[NSMutableDictionary alloc]init];
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    
    //NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    NSString *STAFF_ID_K=[DF objectForKey:@"iphone"];
    
    
    NSString *school_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    // [AFJSONResponseSerializer serializer];
    NSString *year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    //NSString *mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    
    
    //    http://107.170.94.176/openSIS_CE6_Mobile/webservice/send_mail.php?staff_id=2&school_id=1&syear=2015&mail_details=
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    
    NSString *urlStr = [NSString stringWithFormat:@"/teacher_update_pwd.php"];
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,urlStr];
    //
    //    NSLog(@"----%@",url12);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url12]];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    //  patameter image
    // school_id=1&syear=2015&staff_id=2&cpv_id=24&mp_id=16&values=
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"staff_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[STAFF_ID_K dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"school_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[school_id dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"syear\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[year_id dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"current\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[curpas dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"new\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[newpas dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"verify\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[confpas dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    // close form
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    NSLog(@"request...%@",request);
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"======%@",returnData);
    //   NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSMutableDictionary  *datadic=[[NSMutableDictionary alloc]init];
    datadic = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:NULL];
    NSLog(@"datadic-------%@",datadic);
    [self alertmsg:[NSString stringWithFormat:@"%@",[datadic objectForKey:@"msg"]]];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self action_cancel:nil];
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
