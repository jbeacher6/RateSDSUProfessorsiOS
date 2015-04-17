//
//  CommentsTableViewController.h
//  Assignent 5
//
//  Created by Jon on 11/20/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfessorComments.h"
#import "ProfessorInfo.h"
#import "TableViewController.h"
#import "DetailTabViewController.h"

@interface CommentsTableViewController : UITableViewController


@property (strong, nonatomic) NSMutableArray* propertyProfessorCommentIDs;
@property (strong, nonatomic) NSMutableArray* propertyProfessorRatingDates;
@property (strong, nonatomic) NSMutableArray* propertyProfessorRatingCommentTexts;

@property (nonatomic, strong) NSMutableArray* propertyProfessorNamesArray;
@property (nonatomic, strong) NSMutableArray* propertyJsonNamesArray;
@property (nonatomic, strong) NSNumber* propertyNumberProfessors;
@property (nonatomic, strong) NSNumber* propertyProfessorID;

@property (nonatomic, strong) NSMutableArray* propertyProfessorCommentsArray;


@property (nonatomic, strong) ProfessorInfo *propertyCurrentProfessor;

- (void) recieveCommentsData;
- (void) initNumberOfProfessors:(int) numProfessors andCurrentProfessor: (ProfessorInfo*) currentProfessor andProfessorID: (NSNumber*) professorID;

@end
