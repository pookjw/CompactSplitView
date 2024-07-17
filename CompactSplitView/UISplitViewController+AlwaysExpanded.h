//
//  UISplitViewController+AlwaysExpanded.h
//  CompactSplitView
//
//  Created by Jinwoo Kim on 7/17/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_direct_members))
@interface UISplitViewController (AlwaysExpanded)
@property (assign, nonatomic, getter=cs_isAlwaysExpanded, setter=cs_setAlwaysExpanded:) BOOL cs_alwaysExpanded;
@end

NS_ASSUME_NONNULL_END
