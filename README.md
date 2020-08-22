# GMod Autohop

Hi! This is a silly little lua script I wrote for gmod that very quickly got very out of hand. If you wanna use it, I recommend subscribing to it on the steam workshop page, [over here!](https://steamcommunity.com/sharedfiles/filedetails/?id=2198808656) Alternatively, you can download the lua script, and drop it in your garrysmod/lua/autorun/client folder (possibly after tinkering around and editing it, if ya want ^_^).

## How to use it

Basically, this addon (in its current state) maps a new concommand, +bhop, which, when held, sends +jump every tick you're standing on the ground. The exception to this, is if HasJumped == true. This means that +jump was sent on the previous frame, and sending it again would do nothing, so it instead sends -jump. Unfortunately, there's the obvious engine limitation of only being able to jump every other frame, so you tend to lose speed while going up slopes (I'll see if I can do something about that), but hey, its better than literally every other plugin on the gmod workshop which just stops jumping if you go up a slope.

## Convars

---

### cl_autojump 0

Causes +bhop to act exactly like a standard +jump input. +bhop sends +jump, -bhop sends -jump.

### cl_autojump 1 (default)

Causes +bhop to send a +jump input only if

The player is both on the ground AND has not jumped the previous frame

OR this is the first frame +bhop has been held.
