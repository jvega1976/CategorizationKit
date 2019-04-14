//
//  GroupLabel.h
//  CategorizationKit
//
//  Holds the list of Group Labels to cateogorize array items.

#import <Foundation/Foundation.h>
#import "Label.h"



/*!
 @class GroupLabel. Holds the list of Group Labels to cateogorize Torrents.
 */
@interface GroupLabel : NSObject

/*!
 Convenience init method.
 */
+ (GroupLabel*)groupwithLabels:(NSArray<Label*>*)labels;


/*!
 init method.
 @param labels  List of Labels
 @return A new GroupLabel object containing a list of group labels.
 */
- (instancetype)initWithLabels:(NSArray<Label*>*)labels;


/*!
 @property countOfVisible. Number of actual visible Labels
 */
@property(strong,nonatomic) NSArray<Label*>* labels;


/*!
 Return the Label in a particular index in the Array
 @param index Index of the Label to return
 @return The Label correponding to Index: index, nil if there is not label.
 */
- (Label*)labelAtIndex:(int)index;


/*!
 Return the Label with a particular title
 @param label title of the Label to return
 @return The Label with the correponding title, nil if there is none.
 */
-(Label*)labelWithTitle:(NSString*)label;


/*!
 Return sortIndex for Label with a particular title
 @param label title of the Label to return
 @return The sortIndex for the label with the correponding title, nil if there is none.
 */
-(NSInteger)sortIndexForLabelWithTitle:(NSString*)label;


/*!
 Determine if a particular category Label is visible
 @param label title of Label
 @return YES of Label is Visible, NO otherwise.
 */
-(BOOL)isVisibleLabelWithTitle:(NSString*)label;


/*!
 Filter predicate for a particular label
 @param label Label title
 @return An NSPredicate object with the label filter criteria, or nil if label does not exists.
 */
-(NSPredicate*)predicateForLabelWithTitle:(NSString*)label;


/*!
 @property NSPredicate to determine what Labels beloging to the Label Group will be displayed in the UI.
 */
@property (nonatomic) NSPredicate* visibleLabelsPredicate;

/*!
 Initializer
 */
-(instancetype)init;


/*!
 This method can assign the count of Items for each Label in the Label Group, using the items passed as parameter do termine the respective counts.
 @param items
    Collection of items to use in the label items count determination
 */
-(void)setCountForLabelsUsingItems:(NSArray*)items;


/*!
 This method can be used to return the count of items for a particular Label
 @param label
    Title of Label to return count of items.
 @return The number of items of the respective Label.
 */
-(NSInteger)itemCountForLabelWithTitle:(NSString*)label;

@end
