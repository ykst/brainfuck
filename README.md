brainfuck
=========

Brainfuck interpretor by Parsec3.

This program is assumed to be an educational purpose of learning basic Parsec features.

So please excuse me for any inconvenience anyway :)

### Usage:

Just run ghci (only tested on ghci 6.12.1, parsec-3.1.0).

```bash
$ ghci BrainFuck.hs 
```

### Run test programs

```
*BrainFuck> fromFile "test/hello.txt" 
Hello, world!
```
```
*BrainFuck> fromFile "test/sierpinski.txt"
                               /\
                              /\/\
                             /\  /\
                            /\/\/\/\
                           /\      /\
                          /\/\    /\/\
                         /\  /\  /\  /\
                        /\/\/\/\/\/\/\/\
                       /\              /\
                      /\/\            /\/\
                     /\  /\          /\  /\
                    /\/\/\/\        /\/\/\/\
                   /\      /\      /\      /\
                  /\/\    /\/\    /\/\    /\/\
                 /\  /\  /\  /\  /\  /\  /\  /\
                /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
               /\                              /\
              /\/\                            /\/\
             /\  /\                          /\  /\
            /\/\/\/\                        /\/\/\/\
           /\      /\                      /\      /\
          /\/\    /\/\                    /\/\    /\/\
         /\  /\  /\  /\                  /\  /\  /\  /\
        /\/\/\/\/\/\/\/\                /\/\/\/\/\/\/\/\
       /\              /\              /\              /\
      /\/\            /\/\            /\/\            /\/\
     /\  /\          /\  /\          /\  /\          /\  /\
    /\/\/\/\        /\/\/\/\        /\/\/\/\        /\/\/\/\
   /\      /\      /\      /\      /\      /\      /\      /\
  /\/\    /\/\    /\/\    /\/\    /\/\    /\/\    /\/\    /\/\
 /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
```


