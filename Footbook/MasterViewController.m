//
//  MasterViewController.m
//  Footbook
//
//  Created by Marcial Galang on 1/29/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Friend.h"
@import CoreData;

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
{
    NSArray *friendsArray;
    IBOutlet UITableView *myTableView;
    
    
}
@end

@implementation MasterViewController

-(void)viewDidLoad
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults objectForKey:@"First Run"]) // Check if this is the initial app load
    {
        // First run; call initial load function
        
        [self getJSON];
        
        
        [userDefaults setObject:[NSDate date] forKey:@"First Run"];
        [userDefaults synchronize];
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Friend"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:_managedObjectContext sectionNameKeyPath:nil cacheName:@"foo"];
    [_fetchedResultsController performFetch:nil];
    _fetchedResultsController.delegate = self;
    
    
}

-(void)getJSON
{
    NSURL *url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/3/friends.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         friendsArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
         
         for (NSString *friend in friendsArray) {
             Friend *person = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:_managedObjectContext];
             person.name = friend;
         }
         
         NSError *error = nil;
         [_managedObjectContext save:&error];
     }];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Friend *friend = [_fetchedResultsController objectAtIndexPath:indexPath];
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_managedObjectContext deleteObject:friend];
        [_managedObjectContext save:nil];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_fetchedResultsController.sections[section] numberOfObjects];
}

-(UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Friend *friend = [_fetchedResultsController objectAtIndexPath:indexPath];
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = @(friend.imageURL.count).description;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        [[segue destinationViewController] setDetailItem:object];
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [myTableView reloadData];
}

@end
