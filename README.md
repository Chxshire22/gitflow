# A Personal Git Flow Script

## Why I wrote it

I started writing this because everytime I started working on a new branch I'd have to go through the hassle of setting a new upstream branch, then do git add . then git commit.

It simply checks

- if you are in a git repo
- if there are any changes
- then it adds, and then commits the changes
- it checks if you have an upstream branch, if you do not it will ask if you would like to push to a new upstream branch of the same name as your local branch.
- it then pushes to the upstream branch

## If you want to try it:

1. copy the script or clone it to a local repo
2. rename the script to gitflow and copy/move it to /usr/bin/ or one of the other directories that make up your $PATH

**optionally you can create a symlink (I think this might be better?)**

```
sudo chmod +x gitflow; cp gitflow /usr/bin/
```
