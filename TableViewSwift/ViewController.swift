//
//  ViewController.swift
//  TableViewSwift
//
//  Created by john on 16/4/15.
//  Copyright © 2016年 jhon. All rights reserved.
//


import UIKit

var SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
var SCREEN_HEIGTH = UIScreen.mainScreen().bounds.size.height

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,testDelegate{

    var tableView:UITableView?
    var dataArry = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGTH - 20), style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        self.view.addSubview(tableView!)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? CustomCell
        if cell == nil {
            cell = CustomCell.init(style: .Default, reuseIdentifier: "cellID")
        }
        cell?.label.text = String(indexPath.row)
        cell?.button.tag = indexPath.row
        cell?.block = {index in
            print(index)
        }
        cell?.selectionStyle = .None
        return cell!
        
    }
    
    func selectDelegate(index: Int) {
        print("delegate响应")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

