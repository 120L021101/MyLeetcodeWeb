这是我自己实现的Leetcode网站<br>
还没写完，单独快速的跑通一个Demo不难，难的是如何优美的设计架构。<br>
写麻了，越写难点越多。<br>
前后端也还没空分离开。<br>
总之，难。<br>

<p>
目前用到的技术：<br>
1. C语言动态链接库，计划将用户提交的C代码编译成动态链接库，利用Python的Ctypes模块调用这个库拿到用户的运行结果。<br>
2. Flask后端框架，很简单一个框架<br>
3. Lua处理网页字符串，这部分属于是强加进来的，为了联系Lua，调用者为Python<br>
4. javascript前端逻辑，包括Cookie维护Session信息<br>
</p>

<image src="pic/pic1.png">
<image src="pic/pic2.png">
<image src="pic/pic3.png">