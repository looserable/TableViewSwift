//
//  CustomCell.swift
//  TableViewSwift
//
//  Created by john on 16/4/15.
//  Copyright © 2016年 jhon. All rights reserved.
//

protocol testDelegate {
    func selectDelegate(index:Int)
}

import UIKit
typealias myClaus=(index:Int)->()
class CustomCell: UITableViewCell {
    
    var label:UILabel
    var button:UIButton
    var block:myClaus? //设置为可选属性，在指定构造函数里属性才不用初始化，类似概念类似oc协议的required 的方法和optional的方法
    var delegate:testDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        label = UILabel()
        label.frame = CGRectMake(10, 10, 100, 30)
        button = UIButton(type: .Custom)
        button.frame = CGRectMake(SCREEN_WIDTH - 90, 10, 80, 30)
        button.setTitle("beat", forState: .Normal)
        button.backgroundColor = UIColor.purpleColor()
        
        super.init(style:style,reuseIdentifier: reuseIdentifier)
        
        button.addTarget(self, action: #selector(buttonClick(_:)), forControlEvents:.TouchUpInside )
        self.addSubview(label)
        self.addSubview(button)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonClick(sender:UIButton) {
        if (self.block != nil){
            self.block!(index: sender.tag)
        }
        if delegate != nil{
            self.delegate!.selectDelegate(sender.tag)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
