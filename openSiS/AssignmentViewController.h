//
//  AssignmentViewController.h
//  openSiS
//
//  Created by os4ed on 9/25/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssignmentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

    NSString *cpv_id;
     
}

-(IBAction)click:(id)sender;
-(void)callgetdata;
-(void)tablereload;
@end
