//
//  TableViewController.m
//  Assignent 5
//
//  Created by Jon on 11/14/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "TableViewController.h"
#import "ProfessorNames.h"
#import "ProfessorInfo.h"
//#import "DetailViewController.h"
#import "DetailTabViewController.h"
#define getNamesURL @"http://bismarck.sdsu.edu/rateme/list"
#import "CommentsTableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize  jsonNamesArray, jsonDetailsArray, jsonDetailsDictionary, professorNamesArray, professorDetailArray;

- (id) initWithStyle:(UITableViewStyle) style {
    self = [super initWithStyle:style];
    if(self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Professors";
    [self retrieveNamesData];
    [self retrieveDetailData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return professorNamesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ProfessorNames *professorNamesObject = [professorNamesArray objectAtIndex:indexPath.row];
    NSString *cellText = [NSString stringWithFormat:@"%@ %@",professorNamesObject.propertyFirstName,professorNamesObject.propertyLastName];
    cell.textLabel.text = cellText;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showDetailTabViewController"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSNumber* professorID= [NSNumber numberWithInteger:indexPath.row + 1];
        //NSLog(@"index path:%@", professorID);
        ProfessorInfo *professor = [professorDetailArray objectAtIndex:indexPath.row];
         UITabBarController *tabar = segue.destinationViewController;
        
        DetailTabViewController *detailTabViewController = [tabar.viewControllers objectAtIndex:0];
      
        int intNumberProfessors = (int) professorNamesArray.count;
        NSNumber* number = [NSNumber numberWithInt:intNumberProfessors];
        [detailTabViewController initNumberProfessors:number andProfessor:professor];
        
        CommentsTableViewController *commentsTabViewController = [tabar.viewControllers objectAtIndex:1];
        [commentsTabViewController initNumberOfProfessors:intNumberProfessors andCurrentProfessor:professor andProfessorID:professorID];
        
        RatingsTabViewController *ratingsTabViewController = [tabar.viewControllers objectAtIndex:2];
        [ratingsTabViewController initNumberOfProfessors:intNumberProfessors andCurrentProfessor:professor andProfessorID:professorID];
    }
}

#pragma mark Class Methods

-(void) retrieveNamesData {
    NSURL *url = [NSURL URLWithString:getNamesURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    jsonNamesArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    professorNamesArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < jsonNamesArray.count; i++){
        NSString *pID = [[jsonNamesArray objectAtIndex:i] objectForKey:@"id"];
        NSString *pFirstName = [[jsonNamesArray objectAtIndex:i] objectForKey:@"firstName"];
        NSString *pLastName = [[jsonNamesArray objectAtIndex:i] objectForKey:@"lastName"];
        [professorNamesArray addObject:[[ProfessorNames alloc] initWithProfessorID:pID andFirstName: pFirstName andLastName:pLastName]];
        }
        [self.tableView reloadData];
}

-(void) retrieveDetailData {
    NSInteger n;
    NSMutableArray *JSONObjects = [[NSMutableArray alloc] init];
    NSString *incompleteURL = @"http://bismarck.sdsu.edu/rateme/instructor/";
    
    for(n = 1; n < professorNamesArray.count + 1; n++) {
        NSString *completeURL = [NSString stringWithFormat:@"%@%ld",incompleteURL, (long)n ];
        NSURL *url = [NSURL URLWithString:completeURL];
        NSData *JSONdata = [NSData dataWithContentsOfURL:url];
        NSError *error = nil;
        id JSONObject = [NSJSONSerialization
                         JSONObjectWithData:JSONdata
                         options:NSJSONReadingAllowFragments
                         error:&error];
        [JSONObjects addObject:JSONObject];
    }
    professorDetailArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < JSONObjects.count; i++){
        NSString *pID = [[JSONObjects objectAtIndex:i] objectForKey:@"id"];
        NSString *pEmail = [[JSONObjects objectAtIndex:i] objectForKey:@"email"];
        NSString *pFirstName = [[JSONObjects objectAtIndex:i] objectForKey:@"firstName"];
        NSString *pLastName = [[JSONObjects objectAtIndex:i] objectForKey:@"lastName"];
        NSString *pOffice = [[JSONObjects objectAtIndex:i] objectForKey:@"office"];
        NSString *pPhone = [[JSONObjects objectAtIndex:i] objectForKey:@"phone"];
        NSDictionary *pRating = [[JSONObjects objectAtIndex:i] objectForKey:@"rating"];
        NSString *pAverage = [pRating objectForKey:@"average"];
        NSString *pTotalRatings = [pRating objectForKey:@"totalRatings"];
        
        [professorDetailArray addObject:[[ProfessorInfo alloc] initWithID:pID andFirstName:pFirstName andLastName:pLastName andOffice:pOffice andPhoneNumber:pPhone andEmail:pEmail andAverageRating:pAverage andTotalRatings:pTotalRatings]];
    }
    //NSLog(@"array: %@", professorDetailArray);
    [self.tableView reloadData];
}

@end
