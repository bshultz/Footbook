//
//  Friend.h
//  Footbook
//
//  Created by Marcial Galang on 1/29/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ImageURL;

@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *imageURL;
@end

@interface Friend (CoreDataGeneratedAccessors)

- (void)addImageURLObject:(ImageURL *)value;
- (void)removeImageURLObject:(ImageURL *)value;
- (void)addImageURL:(NSSet *)values;
- (void)removeImageURL:(NSSet *)values;

@end
