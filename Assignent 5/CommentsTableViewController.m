//
//  CommentsTableViewController.m
//  Assignent 5
//
//  Created by Jon on 11/20/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "CommentsTableViewController.h"
#import "TableViewController.h"
#import "ProfessorNames.h"
#import "ProfessorInfo.h"
//#import "DetailViewController.h"
#import "DetailTabViewController.h"

#define getNamesURL "http://bismarck.sdsu.edu/rateme/comments/"

@interface CommentsTableViewController ()

@end

@implementation CommentsTableViewController

@synthesize  propertyNumberProfessors, propertyCurrentProfessor, propertyProfessorID;
@synthesize propertyProfessorCommentIDs,propertyProfessorRatingCommentTexts, propertyProfessorRatingDates, propertyProfessorCommentsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self recieveCommentsData];
    [self.tableView reloadData];
       // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.propertyProfessorCommentsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ProfessorComments* professorCommentsObject = [propertyProfessorCommentsArray objectAtIndex:indexPath.row];
    //NSString *cellText = [NSString stringWithFormat:@"%@ %@: %@", professorCommentsObject.propertyCommentID, professorCommentsObject.propertyDate, professorCommentsObject.propertyCommentText];
    
    NSString *cellText = [NSString stringWithFormat:@"%@: %@", professorCommentsObject.propertyDate, professorCommentsObject.propertyCommentText];
    
     cell.textLabel.text = cellText;
     cell.textLabel.numberOfLines = 0;
     cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     cell.textLabel.font = [UIFont systemFontOfSize:15.0];

    return cell;
}


#pragma mark Class Methods
-(void) initNumberOfProfessors:(int) numProfessors andCurrentProfessor: (ProfessorInfo*) currentProfessor andProfessorID: (NSNumber*) professorID {
    propertyNumberProfessors = [NSNumber numberWithInt:numProfessors];
    propertyCurrentProfessor = currentProfessor;
    propertyProfessorID = professorID;
}

- (void) recieveCommentsData {
    NSString *incompleteURL = @"http://bismarck.sdsu.edu/rateme/comments/"; //http://bismarck.sdsu.edu/rateme/comment/n
    
    //NSLog(@"professor ID %@", propertyProfessorID);
    NSString *completeURL = [NSString stringWithFormat:@"%@%@", incompleteURL, propertyProfessorID];
    NSURL *url = [NSURL URLWithString:completeURL];
    
    NSData *JSONdata = [NSData dataWithContentsOfURL:url];
    
    NSError *error = nil;
    NSMutableArray *JSONCommentsArray = [NSJSONSerialization
                     JSONObjectWithData:JSONdata
                     options:NSJSONReadingAllowFragments
                     error:&error];
    //NSInteger *amountOfComments = (NSInteger) [JSONCommentsArray count];
    //NSLog(@"%d", amountOfComments);
    
     propertyProfessorCommentsArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < JSONCommentsArray.count; i++){
        NSString *pCommentID = [[JSONCommentsArray objectAtIndex:i] objectForKey:@"id"];
        NSString *pDate = [[JSONCommentsArray objectAtIndex:i] objectForKey:@"date"];
        NSString *pCommentText = [[JSONCommentsArray objectAtIndex:i] objectForKey:@"text"];
        
        [propertyProfessorCommentsArray addObject:[[ProfessorComments alloc] initWithCommentID:pCommentID andDate:pDate andCommentText:pCommentText]];
    }
    //NSLog(@"propertyProfessorCommentsArray: %@", propertyProfessorCommentsArray);
    [self.tableView reloadData];
}


/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *CellIdentifier = @"Cell";
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 ProfessorNames *professorNamesObject = [professorNamesArray objectAtIndex:indexPath.row];
 NSString *cellText = [NSString stringWithFormat:@"%@ %@",professorNamesObject.propertyFirstName,professorNamesObject.propertyLastName];
 cell.textLabel.text = cellText;
 cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
 return cell;
 }
 */


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */


@end
