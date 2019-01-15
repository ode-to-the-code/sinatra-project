# sinatra-project
autobus




Can set up corneal and implement login stuff. Don’t worry about views and so on, just can make a user and slowly keep adding on and testing bite sized pieces. My stuff worked here, but not after I added these next few lines of code. So the issue must be in that new chunk or feature. As opposed to setting up the whole CRUD thing with all relationships and so on. Might be good to avoid setting up all that stuff all at first

Can use tux to create couple users and tweets in twitter, as a proof of concept


Building twitter from scratch, you could build up the views with fake info. And then do the user signup stuff, with the tweet index page. If you test that and it doesn’t work, then it’s not much to debug. If it works, you can go to the twitter index page.

Good to make it as simple as possible with fake data before you use real data. You can then see if the login and so on work before all the relationships and data

In the business world often the process is behavior driven rather than test driven, except sometimes in cases for edge cases. Often you build the application and then someone comes and builds tests to catch ways the user might break the program

In this project, don’t use inner join tables. In rails you can but it has built in helper methods that will help with that. To reach that level of complexity in Sinatra you would eventually build something like rails

Just work on has many/belongs to and one model is already included in the project so you just have to make one more. Like in fwitter we have users, and the other model is tweets. You can make more if you want. Depends on the function of the model, like a cart wouldn’t need much precision it just has to be an array. Does it need its own functionality. A cart wouldn’t really.

When I hit the last couple fwitter tests, send an email to set up a consult time

Often students get bogged down doing the projects because they were building up big projects. We will talk it over and make sure I’m not building a full application, and have to and rebuild the whole thing

A common mistake is building or starting to build too large of an app. Another is tunnel vision, so you have a small thing like a typo that gets overlooked. Or just getting stuck in one way of seeing things. There can be many routes to the right solution. You start seeing other perspectives when you’re working with more experienced people who point them out. The more it happens the better it becomes, so you can see better ways or options.
So go for the smallest amount possible to do something, like rendering a little text, or a click button, just focus on many small victories. And when you run into small issues its easier to see where you went wrong. And its easier emotionally and psychologically as if it was a giant problem with no clear solution.

Pushing to GitHub super often is important. Many students lose days worth of work because they thought it was getting pushed. Or had to kill the program and now it’s all lost.

Theres a UI called Tower. You can link it to your GitHub. Make new branches, merge and delete stuff, etc. its easier than using the command line. NaviCat is another one for databases

Another mistake is not using pry. You can put prys everywhere and isolate the weak link in the chain. So you can see that somewhere between
