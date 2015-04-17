//
//  DetailTabViewController.m
//  Assignent 5
//
//  Created by Jon on 11/16/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//
#import "DetailTabViewController.h"
#import "TableViewController.h"

@interface DetailTabViewController ()

@end

@implementation DetailTabViewController
@synthesize fullNameLabel, emailLabel, idLabel, officeLabel, phoneLabel, averageRatingLabel, totalRatingLabel, numberProfessors;
@synthesize currentProfessor;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLabels];
    //self.title = @"Professor Details";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Class methods

-(void) initNumberProfessors:(id)numProfessors andProfessor:(id)professor {
    numberProfessors = numProfessors;
    currentProfessor = professor;
    //NSLog(@"numberProfessors1:%@ and currentProfessor:%@",numberProfessors, currentProfessor );
}

-(void) setLabels {
    NSString *professorFullName = [NSString stringWithFormat:@"%@ %@", currentProfessor.propertyFirstName, currentProfessor.propertyLastName];
    fullNameLabel.text = professorFullName;
    emailLabel.text = (NSString *) currentProfessor.propertyEmail;
    officeLabel.text = (NSString *) currentProfessor.propertyOffice;
    NSString *intID = [NSString stringWithFormat:@"%@", currentProfessor.propertyID];
    idLabel.text = intID;
    phoneLabel.text = (NSString *) currentProfessor.propertyPhone;
    NSString *averageRating = [NSString stringWithFormat:@"%@", currentProfessor.propertyAverageRating];
    averageRatingLabel.text = averageRating;
    NSString *totalRating = [NSString stringWithFormat:@"%@", currentProfessor.propertyTotalRating];
    totalRatingLabel.text = totalRating;
}

@end

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */