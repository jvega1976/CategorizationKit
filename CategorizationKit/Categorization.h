//
//  Categorization.h
//  CategorizationKit
//
//  Created by Johnny Vega on 3/31/19.
//  Copyright © 2019 Johnny Vega. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroupLabel.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 @class Categorization
 Categorization Class offer a simple way to categorize/group array items. An categorization object is mainly composed for a NSArray object with the items to categorize and a GroupLabel object with an array of Labels to use during the categorization process.
 */
@interface Categorization : NSObject <LabelDelegate>


/*!
 @property items
 Array of items to categorize
 */
@property (strong,nonatomic) NSArray* items;


/*!
 @property groupLabel
    GroupLabel object with the array of Labels to use in the items categorization.  Each label will provide the NSPredicate object to determine the items include in one particular label (category).
 */
@property (strong,nonatomic) GroupLabel* groupLabel;


/*!
 @property searchPredicate
    Predicate with additional end user criteria to restrict Items displayed in the UI.  Usually expressed as a SearchTextField.
 */
@property (strong,nonatomic) NSPredicate *searchPredicate;


/*!
 Convenient singleton to maintain a Categorization
 */
+ (Categorization*)shared;


/*!
 * Simple method to assign items and GroupLabel
 @param items Items to categorize
 @param labels GroupLabel that provide labels/categories
 */
- (void)setItems:(NSArray*)items andLabels:(GroupLabel*)labels;


/*!
Method to determine the number of items that satisfy the criteria of one particular Label.
 @param label Label title
 */
- (NSInteger)countforLabelWithTitle:(NSString*)label;


/*!
 Simple method to determine is a particular Label (category) should be displayed in the UI.  A Label is established as visible if its property alwaysVisible is YES or the number of items that satisfy the label criteria is greater than zero.
 @param label Label title
 @return YES if the label is always visible or the number of items in the category label is greater than zero.  Otherwise NO.
 */
- (BOOL)isVisibleLabelWithTitle:(NSString*)label;


/*
 Items that satisfy a label criteria.  Label criteria is defined using a NSPredicate object.
 @param label Label title
 @return A new array object with items that satisfy the label criteria.
 */
-(NSMutableArray*)itemsInLabel:(NSString*)label;


/*!
 Initializer
 */
-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
