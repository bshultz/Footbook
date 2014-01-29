//
//  Comments.h
//  Footbook
//
//  Created by Marcial Galang on 1/29/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Comments : NSManagedObject

@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSManagedObject *imageURL;

@end
