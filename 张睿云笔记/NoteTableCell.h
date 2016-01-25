//
//  NoteTableCellTableViewCell.h
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "Directory.h"

@interface NoteTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *noteTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteCreateDatetimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteDirectoryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteBelongLabel;

+(instancetype)instanceFormNib ;
-(void)setNoteData:(Note*)note ;

@end
