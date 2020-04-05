# Arma 3 Additional Radio Channels

## Summary

These files will create extra radio Channels anyone can assign themselves to with the ACE self interaction menu. 
This will give more versatility to the communication.

At this point it will add 8 new channels: 
- 20.0 FM
- 30.0 FM
- 40.0 FM
- 50.0 FM
- 60.0 FM
- 70.0 FM
- 80.0 FM
- 90.0 FM

## File Setup

### init.sqf

If you already have a init.sqf, just copy the code from my file into yours. Otherwise, just copy the entire file in your mission directory.

### RadioChannels.sqf

This file should just be copied in its entirety. 
Do not change the filename or anything else.


## Instructions for the Zeus

Create an object in the editor, preferably something related to a "mother radio" setup. 
Things like a big radio or a server will do. 
Just imagine that is the radio/server all the communication is connected to.

In the init field paste this: 
```
this addAction["Take Radio and sign in","RadioChannels.sqf"];
```

## Instuctios for the Player

Walk up to the item the Zeus has created to get your brand new Radio.

Make sure you don't have a standard radio yet.

Interact with the item the zeus has created and interact with "Take Radio and sign in".

This will give you a new Radio and some new features.

Now go to the self interaction menu of ACE and browse to "COMS". 
This will ellapse a new menu in COMS with the created Radio Channels. 

If you want to listen/talk in a radio channel you will have to set it up. 
Just browse to the channel and let go of the ACE interaction menu. 

In your chat area (default: Bottom left corner), it will say something like: 
```
Signed in to channel "80.0"
``` 
You can now browse with '<' and '>' to the selected chanel to talk in that channel.

If it gets a little too chaotic you can get rid of radio channels. 
Just select the same channel again in the ACE self interaction Menu. 
In the chat area (default: Bottom left corner), it will say something like: 
```
Signed out of channel "80.0"
``` 

Hopefully this will give you more options in the field!
If you have feedback, please let me know! :D
