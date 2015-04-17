//
//  ProfessorNames.m
//  Assignent 5
//
//  Created by Jon on 11/14/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "ProfessorNames.h"

@implementation ProfessorNames
@synthesize propertyFirstName, propertyLastName, propertyProfessorID, propertyProfessorCount;

- (id) initWithProfessorID:(NSString*) pID andFirstName: (NSString *) fName andLastName: (NSString *) lName {
    self = [super init];
    if(self) {
        propertyProfessorID = pID;
        propertyFirstName = fName;
        propertyLastName = lName;
        if(propertyProfessorCount == nil) {
            propertyProfessorCount = [[NSNumber alloc] initWithInt:0];
        }
        else {
        int value = [propertyProfessorCount intValue];
        propertyProfessorCount = [NSNumber numberWithInt:value + 1];
        }
    }
    return self;
}
- (int) getCount {
    return (int) [propertyProfessorCount intValue];
    }

@end

