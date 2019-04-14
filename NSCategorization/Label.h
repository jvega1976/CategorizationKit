//
//  Label.h
//  CategorizationKit
//
//  Created by Alexey Chechetkin on 12.07.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
@protocol LabelDelegate
*/
@protocol LabelDelegate <NSObject>

/*!
 Method to establish the number of items that satisfy the Label predicate.
 */
-(NSInteger)countForLabel:(NSString*)label;


/*!
 Method to establish items beloging to the respective Label.
 */
-(NSMutableArray*)itemsForLabel:(NSString*)label;


/*!
 Method to determine the NSPredicate with the Label criteria.
 */
-(NSPredicate*)searchPredicate;

@end

/*!
 @class Label
 GroupLabels represent a categorization/grouping of Elements.  Labels allow to present the items categorized information based in defined filter criterias.  Example of GroupLabels in the Torrent world could be Active, Downloading, Tracker, etc.
 */

@interface Label : NSObject

/*! Convinience init method
 @param label Identifying Group label title
 @param predicate  Predicate with group filter label criteria
 @param sortIndex Optional group label sort index
 @param visible  Boolean to establish if label will be always visible in the user interface even if there are not items that satisfy the label group criteria.
 */

+(Label*)label:(NSString*)label withPredicate:(NSPredicate*)predicate andSortIndex:(NSInteger)sortIndex  isAlwaysVisible:(BOOL)visible;


/*!
 @property title Title to identify Label. Example: "All", "Downloading", "Seeding", "Stopped", etc.
 */
@property(strong,nonatomic) NSString       *title;


/*!
 @property predicate Preedicate with the corresponding Label filter criteria
 */
@property(strong,nonatomic) NSPredicate*   predicate;


/*!
 @property delagate delegate for LabelDelegate protocol.
 */
@property(weak,nonatomic) id<LabelDelegate> delegate;


/*!
 @property alwaysVisible  This property determine is the Label will be visible in the final user interface, even if there is not items that satisfy the corresponding Group filter criteria.
 */
@property(nonatomic) BOOL           alwaysVisible;


/*!
 @property isVisible
 */
@property (nonatomic,readonly) BOOL isVisible;


/*!
 @property index Labels can have an index number to help the arragement of multiple Labels
 */
@property(nonatomic)   NSInteger   sortIndex;


/*!
 @property Array of items that satisfy the label filter criteria.
 Warning: This property require the implementation of the method itemsForLabel for the LabelDelegate protocol, if the Label class is used outside the Catetorization Framework scope.
 */
@property(nonatomic,readonly) NSMutableArray* items;


/*!
 @property itemsCount Number of items that satisfy the label filter criteria.
 Warning: This property can be assigned or returned using the instance variable or implementing the method countForLabel of the LabelDelegate protocol. The getter method will first verify if the property instance variable have a value different from zero (the initial value), if not, it will verify if there is a delegate that have implemented the countForLabel method.
 */
@property(nonatomic) NSInteger itemsCount;


/*!
 initializer
 */
-(instancetype)init;

@end
