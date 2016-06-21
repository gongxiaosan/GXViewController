//
//  ExampleViewController.swift
//  仿网易控件
//
//  Created by gongxiao on 16/6/20.
//  Copyright © 2016年 Gx. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()
        view.addSubview(UISwitch(frame: CGRectMake(0, 0, 100, 200)))
        let tabel = UITableView(frame: view.frame, style: UITableViewStyle.Plain)
        tabel.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "testCell")
        tabel.delegate = self
        tabel.dataSource = self
        view.addSubview(tabel)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ExampleViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("testCell")! as UITableViewCell
        cell.textLabel?.text = self.title
        return cell
    }
}