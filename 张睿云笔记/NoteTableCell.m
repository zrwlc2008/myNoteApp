//
//  NoteTableCellTableViewCell.m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NoteTableCell.h"
#import "NSObject+IsNotNull.h"

@implementation NoteTableCell

+(instancetype)instanceFormNib
{
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:@"NoteTableCell" owner:self options:nil];
    NoteTableCell * cell = [array firstObject];
    [cell awakeFromNib];
    return cell ;
}

- (void)awakeFromNib {
    self.noteContentLabel.textColor = [UIColor grayColor];
    self.noteContentLabel.numberOfLines = 2 ; //设置两行显示
    
    self.noteCreateDatetimeLabel.textColor = [UIColor grayColor];
    self.noteDirectoryNameLabel.textColor = [UIColor grayColor];
    self.noteBelongLabel.textColor = [UIColor grayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setNoteData:(Note*)note
{
    self.noteTitleLabel.text = note.title ;
    if([note.contentData isNotNull]){
        self.noteContentLabel.text = [[NSString alloc] initWithData:note.contentData encoding:NSUTF8StringEncoding] ;
    }
    else{
        self.noteContentLabel.text = @"" ;
    }
    
    NSArray * dateArray = [note.createDatetime componentsSeparatedByString:@" "];
    self.noteCreateDatetimeLabel.text = [dateArray firstObject] ;
    
    self.noteDirectoryNameLabel.text = note.directory.name ;
    
}

@end
