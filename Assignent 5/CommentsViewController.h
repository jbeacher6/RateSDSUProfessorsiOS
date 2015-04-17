//
//  CommentsViewController.h
//  Assignent 5
//
//  Created by Jon on 11/16/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfessorInfo.h"
#import "TableViewController.h"


@interface CommentsViewController : UIViewController

@property (nonatomic, strong) NSMutableArray* commentsArray;
@property (copy) TableViewController* professor;
@property(nonatomic, strong) ProfessorInfo *currentProfessor;
- (void) recieveData;

@end
