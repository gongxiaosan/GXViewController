# GXViewController
swift 仿网易新闻控件 scrollView

Use GXViewController(subControllers: vcs)  to  initialize controller

Every subController must have it's name to show as head title

Follow are examples :

initial
  let vc = GXViewController(subControllers: vcs)
set colors
  vc.normalColor = the color you want // is a default color,default is blue
  vc.highlitedColor = the color you selected // deafault is red
