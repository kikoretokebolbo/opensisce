//
//  AddAssignmentViewController.m
//  openSiS
//
//  Created by os4ed on 10/27/15.
//  Copyright © 2015 openSiS. All rights reserved.
//
#import "AssignmentTableViewCell.h"
#import "AddAssignmentViewController.h"
#import "TeacherDashboardViewController.h"
#import "MBProgressHUD.h"
#import "SBJSON.h"
#import "NSString+SBJSON.h"
#import "NSObject+SBJSON.h"
#import "Base64.h"
#import "AppDelegate.h"
#import "ip_url.h"
@interface AddAssignmentViewController ()

@property (strong, nonatomic) IBOutlet UITextField *text_title;
@property (strong, nonatomic) IBOutlet UITextField *text_final_grade;
@property (strong, nonatomic) IBOutlet UIView *view_title;
@property (strong, nonatomic) IBOutlet UIView *view_finalgrade;
@property(strong,nonatomic)IBOutlet UILabel *percent_grade;
@property(strong,nonatomic)IBOutlet UILabel *percent_total,*percent_lbl;

@property(strong,nonatomic)IBOutlet UIView *view_line,*view_line1;


@property (strong, nonatomic)NSString *weight_value;
- (IBAction)action_save:(id)sender;
- (IBAction)action_back:(id)sender;

@end

@implementation AddAssignmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *df=[NSUserDefaults standardUserDefaults];
    self.weight_value=[df objectForKey:@"weight1"];
    NSLog(@"weight value-------%@",self.weight_value);
    if ([self.weight_value isEqualToString:@"Y"])
    {
        
//        self.view_finalgrade.hidden=YES;
//        self.percent_grade.hidden=YES;
//        self.percent_total.hidden=YES;
//        self.percent_lbl.hidden=YES;
//        self.view_line1.hidden=YES;
//        
//        save_btn.hidden=NO;
//        save_btn1.hidden=YES;
//        NSLog(@"ok");
        
        save_btn.hidden=YES;
        save_btn1.hidden=NO;
        NSLog(@"false");

        
    }
    
    
    
    
    
    else
    {
        
        self.view_finalgrade.hidden=YES;
        self.percent_grade.hidden=YES;
        self.percent_total.hidden=YES;
        self.percent_lbl.hidden=YES;
        self.view_line1.hidden=YES;
        
        save_btn.hidden=NO;
        save_btn1.hidden=YES;
        NSLog(@"ok");

           }
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    self.text_final_grade.inputAccessoryView = numberToolbar;
    
    [self design:self.view_title];
    [self design:self.view_finalgrade];
    
    // Do any additional setup after loading the view.
}

-(IBAction)btn_save:(id)sender
{
    
    
    if ([self.text_title.text length]<1) {
        [self alertmsg:@"Enter title"];
    }
    
    
    else
        
    {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //[MBProgressHUD hideHUDForView:self.view animated:YES];
                [self performSelector:@selector(savedata) withObject:nil afterDelay:2];
            });
        });
        
        
        
    }
    
    
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
    
}

-(void)cancelNumberPad{
    [self.text_final_grade resignFirstResponder];
    self.text_final_grade.text=@"";
}

-(void)doneWithNumberPad{
    // NSString *numberFromTheKeyboard = phone_num.text;
    
    [self.text_final_grade resignFirstResponder];
    
    
}

-(void)design:(UIView*)obj
{
    
    obj.layer.borderWidth =  1.0f;
    obj.layer.borderColor = [[UIColor colorWithRed:0.808f green:0.808f blue:0.808f alpha:1.00f]CGColor];
    [obj.layer setCornerRadius:3.5f];
    obj.clipsToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)alertmsg:(NSString*)msg
{
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)action_save:(id)sender {
    
    
    if ([self.text_title.text length]<1) {
        [self alertmsg:@"Enter title"];
    }
    
    else if ([self.text_final_grade.text length]<1)
    {
        [self alertmsg:@"Enter percent of final grade"];
    }
    
    else
        
    {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //[MBProgressHUD hideHUDForView:self.view animated:YES];
                [self performSelector:@selector(savedata) withObject:nil afterDelay:2];
            });
        });
        
        
        
    }
}


-(void)savedata
{
    
    
    //http://107.170.94.176/openSIS_CE6_Mobile/webservice/assignment_types.php?type=add_submit&staff_id=2&cpv_id=1&assignment_type=[{"TITLE":"test title","FINAL_GRADE_PERCENT":"12"}]
    NSMutableDictionary    *dict=[[NSMutableDictionary alloc]init];
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    

    NSString *cpv_id1=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserCoursePeriodVar"]];
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    NSString *STAFF_ID_K=[DF objectForKey:@"iphone"];
    
    NSMutableArray *arrData=[[NSMutableArray alloc]init];
    
    // [AFJSONResponseSerializer serializer];
    NSString *title_text1=[NSString stringWithFormat:@"%@",self.text_title.text];
    NSString *title_grade=[NSString stringWithFormat:@"%@",self.text_final_grade.text];
    NSString *school_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    
    [dict setValue:title_text1 forKey:@"TITLE"];
    [dict setValue:title_grade forKey:@"FINAL_GRADE_PERCENT"];
    
    NSLog(@"%@",dict);
    [arrData addObject:dict];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arrData];
    NSString * str111 = [Base64 encode:data];
    str111=[arrData JSONRepresentation];
    
    NSLog(@"----String To Post To Server ---%@",str111);
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    
    NSString *post = [NSString stringWithFormat:@"assignment_type=%@",str111];
    
    NSLog(@"post = %@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    //NSString *urlStr = [NSString stringWithFormat:@"http://localhost/tanay/customer_information.php?id=%d",[self.strCustomer_ID  intValue]];
    NSString *urlStr = [NSString stringWithFormat:@"/assignment_types.php?type=add_submit&staff_id=%@&cpv_id=%@&school_id=%@",STAFF_ID_K,cpv_id1,school_id];
    
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,urlStr];
    
    NSLog(@"----%@",url12);
    [request setURL:[NSURL URLWithString:url12]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    // NSLog(@"url Data.....%@",urlData);
    
    NSString *retVal=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    retVal = [retVal stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"retval...%@",retVal);
    
    NSDictionary *dicvv=[retVal JSONValue];
    
    
    
    
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"assignment"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    //   TeacherDashboardViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"dash"];
    // vc.dic=dic;
    //  vc.dic_techinfo=dic_techinfo;
    
    
    // [self.navigationController pushViewController:vc animated:NO];
    
    
    
    
}
- (IBAction)action_back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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
