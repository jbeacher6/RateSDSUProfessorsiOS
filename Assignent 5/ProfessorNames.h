//
//  ProfessorNames.h
//  Assignent 5
//
//  Created by Jon on 11/14/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfessorNames : NSObject

@property (strong, nonatomic) NSNumber* propertyProfessorCount;
@property (strong, nonatomic) NSString* propertyFirstName;
@property (strong, nonatomic) NSString* propertyLastName;
@property (strong, nonatomic) NSString* propertyProfessorID;

- (id) initWithProfessorID:(NSString*) pID andFirstName: (NSString *) fName andLastName: (NSString *) lName;

- (int) getCount;

@end
