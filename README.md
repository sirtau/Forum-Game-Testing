# webrpg
A Web-based RPG!

## Link
https://webrpgtest.herokuapp.com/

## How to Play
Game currently in development. The Message Board is up though!

Sign up or Log In! Just don't use any " characters in posts, or it currently breaks.

## Planning

### Database:  
'Users':  
 Tracks unique User ID, username, email and password.  
'Characters':  
Tracks character info  
Users.id = Characters.owner_id for tracking/validation  
'Message Board':
Tracks posts
users.id = messageboard.owner_id
Creating a Thread will allow you to add a Title. Thread Starters and Comments are differentiated by if post_title exists.

### Message Board

Designed a database structure to work as a message board. Creating a Thread leaves Parent ID blank, then sets Parent ID as Post ID. 
Thread stores Parent ID in URL
Commenting saves Parent ID from URL, tracking threads and comments



### Game

Outline:  
Create an RPG using SQL and Javascript that lets people log in and have their own characters  
Browser-based game that pulls data from database and updates it as needed  


## My Experience Developing the Game

Started building things with mainly Ruby for planning as proof of concepts. Found a good balance between JS and Ruby to code the project

Learned a lot about combining technologies to make one cohesive application. Currently not functional, as development for the project shifted to a Message Board.

Initially was going to design it all in-browser, tried learning how to develop it in Javascript but will be leaving this for when I have more experience with JavaScript Classes.

## TO DO - LOTS

### Message Board
Comments Counter
Avatars
Proper input interface with text editing


### Game
Continue game logic code and menus  
Turn based/random battles? Real time? (Likely to remain turn based)  
levelling/xp logic  
Inventory  
Shop  
Item use  
quests  
Spells  
Message Board  
Friends list (With online/offline status?)  


