//
//  MyInformationCertification.h
//  openSiS
//
//  Created by os4ed on 1/11/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface enroll : UIViewController

{

    IBOutlet UILabel *calendar_name,*rolling;

}
@property(strong,nonatomic)NSString *studentID,*studentName;
@end
