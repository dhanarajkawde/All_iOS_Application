//
//  Employee+CoreDataProperties.h
//  Core_Data_Assignment
//
//  Created by Felix-ITS 012 on 28/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *empaddress;
@property (nullable, nonatomic, retain) NSNumber *empid;
@property (nullable, nonatomic, retain) NSString *empname;
@property (nullable, nonatomic, retain) NSNumber *empphone;
@property (nullable, nonatomic, retain) Employee *emp;

@end

NS_ASSUME_NONNULL_END
