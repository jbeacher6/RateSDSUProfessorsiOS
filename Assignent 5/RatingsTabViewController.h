//
//  RatingsTabViewController.h
//  Assignent 5
//
//  Created by Jon on 11/21/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "ProfessorInfo.h"
#import "AFNetworking.h"
#import <UIKit/UIKit.h>

@interface RatingsTabViewController : UIViewController
@property (nonatomic, strong) NSNumber* propertyNumberProfessors;
@property (nonatomic, strong) NSNumber* propertyProfessorID;
@property (nonatomic, strong) ProfessorInfo *propertyCurrentProfessor;
@property (weak, nonatomic) IBOutlet UITextView *ratingTextField;
- (IBAction)postRatingButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *ratingPosted;
@property (weak, nonatomic) IBOutlet UISegmentedControl *starRating;

- (void) initNumberOfProfessors:(int) numProfessors andCurrentProfessor: (ProfessorInfo*) currentProfessor andProfessorID: (NSNumber*) professorID;

- (void) postRatingWithProfessorID: (int) n andRatingValue:(int) k;
- (void) postCommentWithProfessorID: (int) n andComment: (NSString*) commentString;

-(IBAction) backgroundTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityBar;


@end
