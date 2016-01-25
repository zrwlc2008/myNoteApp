//
//  NoteDataService.m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/11.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NoteDataService.h"

static NoteDataService * instance ;

@implementation NoteDataService

+(instancetype)sharedInstance
{
    @synchronized(self){
        if(!instance){
            instance = [[NoteDataService alloc] init];
        }
    }
    return instance ;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        if(!instance){
            instance = [super allocWithZone:zone];;
        }
    }
    return instance ;
}
-(void)addNoteWithTitle:(NSString*)title content:(NSString*)content directory:(Directory*)directory
{
    Note * note = [[Note alloc] init];
    note.title = title ;
    
    if([content isEqualToString:@""] == FALSE){
        note.contentData = [content dataUsingEncoding:NSUTF8StringEncoding] ;
    }
    if(directory == nil){
        Directory * dir = [Directory getDefaultDirectory];
        note.directory = dir ;
    }
    else{
        note.directory = directory ;
    }
    
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd hh:mm:ss" ;
    NSString * dateString = [format stringFromDate:[NSDate date]];
    note.createDatetime = dateString ;
    
    [[NoteDao sharedInstance] addNote:note];
}

@end
