//
//  ProfessorInfo.m
//  Assignent 5
//
//  Created by Jon on 11/14/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "ProfessorInfo.h"

@implementation ProfessorInfo
@synthesize propertyID, propertyFirstName, propertyLastName, propertyOffice, propertyPhone, propertyEmail, propertyAverageRating, propertyTotalRating;

- (id) initWithID: (NSString *) pID andFirstName: (NSString *) fName andLastName: (NSString *) lName andOffice: (NSString *) office andPhoneNumber: (NSString *) phone andEmail: (NSString *) email andAverageRating:(NSString *) rating andTotalRatings:(NSString*) total {
    self = [super init];
    if(self) {
        propertyID = pID;
        propertyFirstName = fName;
        propertyLastName = lName;
        propertyOffice = office;
        propertyPhone = phone;
        propertyEmail = email;
        propertyAverageRating = rating;
        propertyTotalRating = total;
    }
    return self;
}

@end
 