//
//  NoteDao.m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NoteDao.h"
#import "BaseDao.h"
#import "Note.h"

static NoteDao * instance ;

@implementation NoteDao

+(instancetype)sharedInstance
{
    @synchronized(self){
        if(!instance){
            instance = [[NoteDao alloc] init];
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

//按分页获取记录
-(NSArray*)getAllNotes
{
    NSArray * result = [[BaseDao sharedInstance] list:@"SELECT a.id as n_id , a.title , a.create_datetime , a.content , b.id AS dir_id , b.name AS dir_name FROM tb_note a LEFT JOIN tb_directory b ON a.directory_id = b.id "];
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    for (NSDictionary * dict in result) {
        NSLog(@"result dict=%@",dict);
        
        Note * note = [[Note alloc] init];
        
        note.noteId = [[dict objectForKey:@"nid"] intValue];
        note.title = [dict objectForKey:@"title"];
        note.createDatetime = [dict objectForKey:@"create_datetime"];
        note.contentData = [dict objectForKey:@"content"];
        
        Directory * dir = [[Directory alloc] init];
        dir.directoryId = [[dict objectForKey:@"dir_id"] intValue];
        dir.name = [dict objectForKey:@"dir_name"];
        
        note.directory = dir ;
        
        [array addObject:note];
    }
    
    return array ;
}

-(void)addNote:(Note*)note
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    [array addObject:[NSNumber numberWithInt:note.directory.directoryId]];
    [array addObject:note.title];
    [array addObject:note.contentData];
    [array addObject:note.createDatetime];
    
    [[BaseDao sharedInstance] insert:@"INSERT INTO tb_note( directory_id, title , content , create_datetime) VALUES(?,?,?,?)" arguments:array];
}

@end
