//
//  ProfessorInfo.h
//  Assignent 5
//
//  Created by Jon on 11/14/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfessorInfo : NSObject
@property (strong, nonatomic) NSString* propertyID;
@property (strong, nonatomic) NSString* propertyFirstName;
@property (strong, nonatomic) NSString* propertyLastName;
@property (strong, nonatomic) NSString* propertyOffice;
@property (strong, nonatomic) NSString* propertyPhone;
@property (strong, nonatomic) NSString* propertyEmail;
@property (strong, nonatomic) NSString* propertyAverageRating;
@property (strong, nonatomic) NSString* propertyTotalRating;

- (id) initWithID: (NSString *) pID andFirstName: (NSString *) fName andLastName: (NSString *) lName andOffice: (NSString *) office andPhoneNumber: (NSString *) phone andEmail: (NSString *) email andAverageRating:(NSString *) rating andTotalRatings:(NSString *) rating;

@end
