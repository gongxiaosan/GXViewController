# GXViewController
Swift 仿网易新闻控件 ScrollView

Use GXViewController(subControllers: vcs)  to  initialize controller ，Every subController must have it's name to show as head title

Follow are examples :

Initial

     let vc = GXViewController(subControllers: vcs)
  
Set colors

     vc.normalColor = the color you want // is a default color,default is blue
  
     vc.highlitedColor = the color you selected // deafault is red

![image](https://github.com/gongxiaosan/GXViewController/blob/master/screen.png)
