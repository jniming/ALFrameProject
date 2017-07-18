
//
//  TestViewController.m
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/15.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "TestViewController.h"
#import "BaseTableViewCell.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.title=@"第二个界面";
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    [LogUtil log:self logString:@"第二个节目"];
    self.tableView=[[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    //默认50f
    self.tableView.estimatedRowHeight=50.f;
    //自适应高度布局
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    
    [self.tableView registerClass:[BaseTableViewCell class] forCellReuseIdentifier:@"basecell"];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"basecell"];
    if(cell==nil){
        cell=[[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"basecell"];
    
    }
    cell.backgroundColor=[UIColor redColor];
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
