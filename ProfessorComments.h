//
//  ProfessorComments.h
//  Assignent 5
//
//  Created by Jon on 11/20/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfessorNames.h"

@interface ProfessorComments : NSObject
@property (strong, nonatomic) NSString* propertyCommentID;
@property (strong, nonatomic) NSString* propertyDate;
@property (strong, nonatomic) NSString* propertyCommentText;

- (id) initWithCommentID: (NSString*) commentID andDate: (NSString *) date andCommentText: (NSString *) commentText;

@end
