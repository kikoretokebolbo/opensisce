//
//  AdvancedStudentScheduleController.m
//  openSiS
//
//  Created by os4ed on 12/7/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import "AdvancedStudentScheduleController.h"

@interface AdvancedStudentScheduleController ()



@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UISwitch *switch_includeInactive;
@property (weak, nonatomic) IBOutlet UIButton *button_save;
- (IBAction)action_save:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *view_comments;
@property (strong, nonatomic) IBOutlet UIView *view_birthdayFrom;
@property (strong, nonatomic) IBOutlet UIView *view_birthdayTo;
@property (strong, nonatomic) IBOutlet UIView *view_HeaderMedical;
@property (strong, nonatomic) IBOutlet UIView *view_MedicalDate;
@property (strong, nonatomic) IBOutlet UIView *view_DoctorsNote;
@property (strong, nonatomic) IBOutlet UIView *view_HeaderImmunization;
@property (strong, nonatomic) IBOutlet UIView *view_Immunization_type;
@property (strong, nonatomic) IBOutlet UIView *view_Immunization_date;
@property (strong, nonatomic) IBOutlet UIView *view_Immunization_Comments;
@property (strong, nonatomic) IBOutlet UIView *view_MedicalAlert_date;
@property (strong, nonatomic) IBOutlet UIView *view_HeaderMedicalAlert;
@property (strong, nonatomic) IBOutlet UIView *view_MedicalAlert_alert;
@property (strong, nonatomic) IBOutlet UIView *view_Nursevisit_date;
@property (strong, nonatomic) IBOutlet UIView *view_Nursevisit_reason;
@property (strong, nonatomic) IBOutlet UIView *view_Nursevisit_result;
@property (strong, nonatomic) IBOutlet UIView *view_Nursevisit_Comments;
@property (strong, nonatomic) IBOutlet UIView *view_HeaderNurseVisit;


@property (weak, nonatomic) IBOutlet UITextField *text_comments,*text_birthdayFrom,*text_birthdayTo,*text_MedicalDate,*text_DoctorsNote,*text_Immunization_type,*text_Immunization_date,*text_Immunization_Comments,*text_MedicalAlert_date,*text_MedicalAlert_alert, *text_Nursevisit_date, *text_Nursevisit_reason, *text_Nursevisit_result, *text_Nursevisit_Comments, *text_HeaderNurseVisit;



@end

@implementation AdvancedStudentScheduleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.scroll setContentSize:CGSizeMake(self.scroll.frame.size.width, self.button_save.frame.origin.y + 80)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self dodesignsforTextViews:self.view_birthdayFrom];
    [self dodesignsforTextViews:self.view_birthdayTo];
    [self dodesignsforTextViews:self.view_comments];
    
    
    [self dodesignsforTextViews:self.view_DoctorsNote];
    [self dodesignsforTextViews:self.view_Immunization_Comments];
    [self dodesignsforTextViews:self.view_Immunization_date];
    
    
    [self dodesignsforTextViews:self.view_Immunization_type];
    [self dodesignsforTextViews:self.view_MedicalAlert_alert];
    [self dodesignsforTextViews:self.view_MedicalAlert_date];
    
    
    [self dodesignsforTextViews:self.view_MedicalDate];
    
    [self dodesignsforTextViews:self.view_Nursevisit_Comments];
    [self dodesignsforTextViews:self.view_Nursevisit_date];
    [self dodesignsforTextViews:self.view_Nursevisit_reason];
    [self dodesignsforTextViews:self.view_Nursevisit_result];
    
    
    [self dodesignforHeaders:self.view_HeaderImmunization];
    [self dodesignforHeaders:self.view_HeaderMedical];
    [self dodesignforHeaders:self.view_HeaderMedicalAlert];
    [self dodesignforHeaders:self.view_HeaderNurseVisit];
    


    
}



- (IBAction)action_back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}





- (void)dodesignsforTextViews:(UIView *)disview
{
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.620f green:0.620f blue:0.620f alpha:1.00f] CGColor]];
    [disview.layer setBorderWidth:1.0f];
    [disview.layer setCornerRadius:1.5f];
    disview.clipsToBounds = YES;
}

- (void)dodesignforHeaders:(UIView *)disview
{
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.816f green:0.816f blue:0.816f alpha:1.00f]CGColor]];
    [disview.layer setBorderWidth:1.0f];
    
}


- (IBAction)action_save:(id)sender
{
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
