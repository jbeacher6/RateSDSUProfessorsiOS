//
//  RatingsTabViewController.m
//  Assignent 5
//
//  Created by Jon on 11/21/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "RatingsTabViewController.h"
#import "AFNetworking.h"
#import "CommentsTableViewController.h"

@interface RatingsTabViewController ()

@end

@implementation RatingsTabViewController

@synthesize propertyCurrentProfessor, propertyNumberProfessors, propertyProfessorID;

- (void) initNumberOfProfessors:(int) numProfessors andCurrentProfessor: (ProfessorInfo*) currentProfessor andProfessorID: (NSNumber*) professorID {
    propertyProfessorID = professorID;
    propertyNumberProfessors = [NSNumber numberWithInt:numProfessors];
    propertyCurrentProfessor  = currentProfessor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _ratingPosted.hidden = YES;
    _activityBar.hidden = YES;
    //[self postRatingWithProfessorID:13 andRatingValue:1];
    //NSString* parameterString = @"good professorRR";
    //[self postCommentWithProfessorID:13 andComment:parameterString];//15
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) postRatingWithProfessorID: (int) n andRatingValue:(int) k {
    NSString *incompleteURL = @"http://bismarck.sdsu.edu/rateme/rating";
    NSString *slashN = [NSString stringWithFormat:@"/%d",n];
    NSString *slashK = [NSString stringWithFormat:@"/%d",k];
    NSString *completeURL = [NSString stringWithFormat:@"%@%@%@",incompleteURL,slashN,slashK];
    
    //1
    //NSURL *nsurl = [NSURL URLWithString:completeURL];
    //NSURLRequest *request = [NSURLRequest requestWithURL:nsurl];
    
    //2
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:completeURL parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
    }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    
    /*
    //NSLog(@"CompleteURL:%@", completeURL);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL
                                                                        URLWithString:completeURL]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    NSData *NSDataURL = [completeURL dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:NSDataURL];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
     */
}

- (void) postCommentWithProfessorID: (int) n andComment: (NSString*) commentString {
    NSString *incompleteURL = @"http://bismarck.sdsu.edu/rateme/comment";
    NSString *slashN = [NSString stringWithFormat:@"/%d",n];
    NSString *completeURL = [NSString stringWithFormat:@"%@%@",incompleteURL,slashN];
    NSURL *requestURL = [NSURL URLWithString:completeURL];
    NSData *NSDataComment = [commentString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPBody:NSDataComment];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection *nsConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [nsConnection start];
    
    /*
    NSURLResponse *urlResponse;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    
    NSLog(@"data (hex): %@", data);
    NSLog(@"data (string): %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    */
    /*
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     manager.requestSerializer = [AFJSONRequestSerializer serializer];
     //NSData *NSDataComment = [commentString dataUsingEncoding:NSUTF8StringEncoding];
     
     NSMutableDictionary *dictionaryParamater = [NSMutableDictionary dictionary];
     NSArray *nsArray = [NSArray arrayWithObjects:commentString, nil];
     [dictionaryParamater setObject:nsArray forKey:@"comment"];
     
     [manager POST:completeURL parameters:dictionaryParamater
     success:^(AFHTTPRequestOperation *operation, id responseObject1)
     {
     NSLog(@"JSON1: %@", responseObject1);
     }
     failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
     NSLog(@"Error: %@", error);
     }];
     
     
     //NSLog(@"CompleteURL:%@", completeURL);
     */
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)postRatingButtonClick:(id)sender {
    _activityBar.hidden = NO;
    [_activityBar startAnimating];
    NSString* textField = _ratingTextField.text;
    int ratingValue = (int) _starRating.selectedSegmentIndex + 1;
    int professorID = [propertyProfessorID intValue];
    [self postRatingWithProfessorID:professorID andRatingValue:ratingValue];
    [self postCommentWithProfessorID:professorID andComment:textField];
    [_activityBar stopAnimating];
    _activityBar.hidden = YES;
    _ratingPosted.hidden = NO;
}

-(IBAction) backgroundTap:(id)sender {
    [sender resignFirstResponder];
    [self.view endEditing:YES];
}

@end
