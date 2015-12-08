//
//  PostfinalgradesController.h
//  openSiS
//
//  Created by os4ed on 11/23/15.
//  Copyright (c) 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostfinalgradesController : UIViewController
{    
    NSString *str_s,*assign_change;
}
-(void)setCourseperiodtextfielddata:(NSString*)str;
-(NSString *)getCourseperiodtextfielddata;
-(void)loaddata;
@end
