//
//  Note.m
//  张睿云笔记
//
//  Created by jerry on 16-1-8.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "Note.h"

@implementation Note

- (NSString *)description
{
    return [NSString stringWithFormat:@"note:id=%d,title=%@,data=%@",self.noteId,self.title,self.contentData];
}

@end
