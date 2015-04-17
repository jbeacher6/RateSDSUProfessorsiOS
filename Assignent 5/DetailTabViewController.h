//
//  DetailTabViewController.h
//  Assignent 5
//
//  Created by Jon on 11/16/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfessorInfo.h"
#import "TableViewController.h"

/*
@class DetailTabViewController;
@protocol DetailTabViewControllerDelegate <NSObject>

-(void) controller: (DetailTabViewController*) controller andNumberOfProfessors:(int) numProfessors andCurrentProfessor: (ProfessorInfo*) currentProfessor;
@end

#pragma mark Delegate
 
 */

@interface DetailTabViewController : UIViewController 

 /*
 {
    __strong id<DetailTabViewControllerDelegate> detailTabViewDelegate;
}
@property (strong, nonatomic) id<DetailTabViewControllerDelegate> detailTabViewDelegate;
*/

@property(nonatomic, strong) IBOutlet UILabel *emailLabel;
@property(nonatomic, strong) IBOutlet UILabel *fullNameLabel;
@property(nonatomic, strong) IBOutlet UILabel *idLabel;
@property(nonatomic, strong) IBOutlet UILabel *officeLabel;
@property(nonatomic, strong) IBOutlet UILabel *phoneLabel;
@property(nonatomic, strong) IBOutlet UILabel *averageRatingLabel;
@property(nonatomic, strong) IBOutlet UILabel *totalRatingLabel;
//@property (copy) TableViewController* professor;
@property(nonatomic, strong) ProfessorInfo *currentProfessor;
@property(nonatomic, strong) NSNumber* numberProfessors;

#pragma mark Methods
//-(void)getProfessor:(id)professorObject;
//-(void) getNumberProfessors:(id)numProfessors;

-(void) initNumberProfessors:(id)numProfessors andProfessor:(id)professorObject;

@end
