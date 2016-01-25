//
//  NoteDao.h
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "Directory.h"

@interface NoteDao : NSObject
{
    
}

//获取单例对象
+(instancetype)sharedInstance ;

//获取记录
-(NSArray*)getAllNotes ;

-(void)addNote:(Note*)note ;

@end
