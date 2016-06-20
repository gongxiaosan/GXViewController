//
//  GXViewController.swift
//  仿网易控件
//
//  Created by gongxiao on 16/6/16.
//  Copyright © 2016年 Gx. All rights reserved.
//

import UIKit

class GXViewController: UIViewController {
    //默认字体颜色，不传为蓝色
    var normalColor: UIColor = UIColor.blueColor()
    //选中字体颜色，不传默认为红色
    var highlitedColor: UIColor = UIColor.redColor()
    
    private let paddingHeight: CGFloat = 64

    private let headScrollHeight: CGFloat = 44

    private let labelWidth: CGFloat = 120
    private lazy var headScrollView:UIScrollView = {
        let headScrollView: UIScrollView = UIScrollView(frame: CGRectMake(0, self.paddingHeight, UIScreen.mainScreen().bounds.size.width, self.headScrollHeight))
        headScrollView.showsHorizontalScrollIndicator = false
        return headScrollView
    }()
    private lazy var bodyScrollView:UIScrollView = {
        let bodyScrollView: UIScrollView = UIScrollView(frame: CGRectMake(0, self.headScrollHeight + self.paddingHeight, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - self.paddingHeight - self.headScrollHeight))
        bodyScrollView.delegate = self
        bodyScrollView.pagingEnabled = true
        bodyScrollView.showsVerticalScrollIndicator = false
        return bodyScrollView
    }()
    //传入子控制器
    convenience init(subControllers: [UIViewController]){
        self.init()
        for v in subControllers {
            self.addChildViewController(v)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ///绘制UI
        buildUI()
    
    }
    private func buildUI(){
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(headScrollView)
        view.addSubview(bodyScrollView)
        for i in 0...self.childViewControllers.count - 1{
//            let label = GLabel(frame: CGRectMake(CGFloat(i) * labelWidth ,0, labelWidth, headScrollHeight))
            let label = GLabel(frame: CGRectMake(CGFloat(i) * labelWidth ,0, labelWidth, headScrollHeight), normalColor: normalColor, highlitedColor: highlitedColor)
            label.text = self.childViewControllers[i].title
            label.tag = i
            label.userInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(headTitleClick) ))
            headScrollView.addSubview(label)
        }
        headScrollView.contentSize = CGSizeMake(labelWidth * CGFloat( self.childViewControllers.count), headScrollHeight)
        bodyScrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width * CGFloat( self.childViewControllers.count), 0)
        //显示第0个控制的view
        self.scrollViewDidEndScrollingAnimation(bodyScrollView)
        
    }
    
    //标题点击
    @objc private func headTitleClick(sender: UITapGestureRecognizer){
            self.bodyScrollView.setContentOffset(CGPointMake(UIScreen.mainScreen().bounds.size.width * CGFloat(sender.view!.tag), 0), animated: true)
    }
}

extension GXViewController: UIScrollViewDelegate{
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        let index = scrollView.contentOffset.x/width
        print(index)
        let label = headScrollView.subviews[NSInteger(index)] as! UILabel
        var offSet = label.center.x - width/2
        if label.center.x - width/2 < 0 {
            offSet = 0
        }else if labelWidth * CGFloat(self.childViewControllers.count) - label.center.x  < width/2{
            offSet = labelWidth * CGFloat(self.childViewControllers.count) - width
        }
        self.headScrollView.setContentOffset(CGPointMake(offSet ,0), animated: true)
        
        let vc = self.childViewControllers[NSInteger(index)]
        if vc.isViewLoaded() {
            return
        }
        vc.view.frame = CGRectMake(scrollView.contentOffset.x, 0, width, scrollView.frame.size.height)
        scrollView.addSubview(vc.view)
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scale = scrollView.contentOffset.x/UIScreen.mainScreen().bounds.size.width
        let  leftIndex = NSInteger(scale)
        let leftLabel = headScrollView.subviews[leftIndex] as! GLabel
        let rightScale = scale - CGFloat(leftIndex)
        let leftScale = 1 - rightScale
        leftLabel.gScale = leftScale
        if leftIndex < headScrollView.subviews.count - 2 {
            let rightIndex = leftIndex + 1
            let rightLabel = headScrollView.subviews[rightIndex] as! GLabel
            rightLabel.gScale = rightScale
        }

        
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }

}