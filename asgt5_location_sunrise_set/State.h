//
//  State.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface State : NSObject

@property (nonatomic, retain) NSString* stateName;

-(id) initWithState:(NSString*) theState;

@end
