//
//  ImageURL.h
//  Footbook
//
//  Created by Marcial Galang on 1/29/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comments, Friend;

@interface ImageURL : NSManagedObject

@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) Friend *friend;
@property (nonatomic, retain) NSSet *comments;
@end

@interface ImageURL (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comments *)value;
- (void)removeCommentsObject:(Comments *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
