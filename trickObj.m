//
//  trickObj.m
//  Segment Control
//
//  Created by Lowtrack on 26.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import "trickObj.h"

NSString * sytringDate(NSDate *date) {
    
    static NSDateFormatter * formater = nil;
    
    if  (!formater) {
        
        formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"-- dd -- MM-- yyyy"];
        
        
        
    }
    
    return [formater stringFromDate:date];
}