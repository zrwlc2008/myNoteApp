//
//  NoteTableViewController.m
//  张睿云笔记
//
//  Created by jerry on 16-1-8.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NoteTableViewController.h"
#import "NoteDao.h"
#import "DirectoryDao.h"
#import "Note.h"
#import "Directory.h"
#import "NSObject+IsNotNull.h"
#import "NoteTableCell.h"

@interface NoteTableViewController ()

@end

@implementation NoteTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    refreshControl = [[UIRefreshControl alloc] init];
    
    [refreshControl setAttributedTitle:[[NSAttributedString alloc] initWithString:@"下拉即可刷新"]];
    
    [refreshControl addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventValueChanged];
    
    //refreshControl只能在tableViewControll中使用
    [self setRefreshControl:refreshControl];
    
}

//界面每次展示都要刷新一下记录
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //加载初始数据
    noteArray = [[NoteDao sharedInstance] getAllNotes];
    
    //NSLog(@"noteArray %@" , noteArray);
    
    [self.tableView reloadData];
    
    //只刷新一行
    //[self.tableView reloadRowsAtIndexPaths:(NSArray *) withRowAnimation:(UITableViewRowAnimation)];
}

#pragma mark - UIRefreshControl事件
-(void)refreshData:(id)sender
{
    [self.tableView reloadData];
}

#pragma mark UIRefreshControl事件 end

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [noteArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cell_id = @"cell_id" ;
    
    NoteTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id ];
    
    if(cell == nil){
        cell = [NoteTableCell instanceFormNib];
    }
    else{
        NSLog(@"found oldCell %@ ",cell.noteTitleLabel.text);
    }
    
    Note * note = [noteArray objectAtIndex:indexPath.row];
    [cell setNoteData:note];
    
    if([note.contentData isNull]){
        [cell.noteContentLabel removeFromSuperview];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/
#pragma mark UITableViewDataSource 方法 end

#pragma mark - UITableViewDelegate 方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 100 ;
    
    Note * note = [noteArray objectAtIndex:indexPath.row];
    
    if([note.contentData isNull]){
        height -= 40 ;
    }
    
    return height ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20 ;
}

//确实选中每一行的回调方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@",__func__,indexPath);
    
    //[self enterDetailView:indexPath.row];
    
}

#pragma mark UITableViewDelegate 方法 end

#pragma mark - 其他方法
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
