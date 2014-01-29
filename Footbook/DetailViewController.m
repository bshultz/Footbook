//
//  DetailViewController.m
//  Footbook
//
//  Created by Marcial Galang on 1/29/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "Friend.h"


@interface DetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    __weak IBOutlet UILabel *nameLabel;
    Friend *friend;
    __weak IBOutlet UICollectionView *imageCollectionView;
    __weak IBOutlet UIImageView *footImageView;
    __weak IBOutlet UITableView *commentTableView;
    NSMutableArray *footImageURL;
}
@end

@implementation DetailViewController

-(void)setDetailItem:(Friend*)newFriend
{
    friend = newFriend;
    self.title = friend.name;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

@end
