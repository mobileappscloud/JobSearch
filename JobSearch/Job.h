//
//  Job.h
//  JobSearch
//
//  Created by iMac on 3/11/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Job : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * fullTime;

@end
