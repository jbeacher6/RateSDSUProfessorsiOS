//
//  TableViewController.h
//  Assignent 5
//
//  Created by Jon on 11/14/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfessorInfo.h"
#import "RatingsTabViewController.h"

@interface TableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray* jsonNamesArray;
@property (nonatomic, strong) NSMutableArray* jsonDetailsArray;
@property (nonatomic, strong) NSDictionary* jsonDetailsDictionary;
@property (nonatomic, strong) NSMutableArray* professorNamesArray;
@property (nonatomic, strong) NSMutableArray* professorDetailArray;
//@property (nonatomic, strong) NSDictionary* professorDetailDictionary;

@property (nonatomic, strong) ProfessorInfo *professor;

-(void) retrieveNamesData;
-(void) retrieveDetailData;

@end
