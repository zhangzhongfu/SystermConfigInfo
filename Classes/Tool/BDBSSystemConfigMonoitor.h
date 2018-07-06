//
//  BDBSSystemConfigMonoitor.h
//  WoZaiJia
//

#import "BdbsModel.h"

@interface BDBSSystemConfigMonoitor : BdbsModel

- (void)startObserver;

- (void)stopObserver;

@end
