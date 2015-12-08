//
//  GeneralController.m
//  openSiS
//
//  Created by os4ed on 11/5/15.
//  Copyright © 2015 openSiS. All rights reserved.
//

#import "GeneralController.h"
#import "ip_url.h"
#import "AFNetworking.h"

@interface GeneralController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scroll_main;

@end

@implementation GeneralController
{
    int currentwidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   }

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
   
}

#pragma mark - designs

-(void)design:(UIView*)obj
{
    
    obj.layer.borderWidth =  1.0f;
    obj.backgroundColor = [UIColor whiteColor];
    obj.layer.borderColor = [[UIColor lightGrayColor]CGColor];//[[UIColor colorWithRed:0.808f green:0.808f blue:0.808f alpha:1.00f]CGColor];
    [obj.layer setCornerRadius:3.5f];
    obj.clipsToBounds = YES;
    
}





- (IBAction)action_switch:(id)sender {
    
}

- (IBAction)action_saveNnext:(id)sender {
}
@end
