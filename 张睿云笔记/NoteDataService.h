//
//  NoteDataService.h
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/11.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteDao.h"
#import "Note.h"
#import "Directory.h"

@interface NoteDataService : NSObject

+(instancetype)sharedInstance ;

-(void)addNoteWithTitle:(NSString*)title content:(NSString*)content directory:(Directory*)directory;

@end
