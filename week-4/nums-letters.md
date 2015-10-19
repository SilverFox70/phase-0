##What does puts do?

puts _returns_ nil and prints output to the console on a new line

##What is an integer? What is a float?

In simple terms, an integer is a number without a decimal point, and a float (or floating point number) is a number with a decimal point.  Most computer programs use integers the vast majority of the time as it saves on memory and they aren't usually necessary unless you are doing physics experiments, or dealing with audio and video. 


##What is the difference between float and integer division? How would you explain the difference to someone who doesn't know anything about programming?

Float division works just the way you would expect.  If you divide 7.0 by 2.0, you'll get 3.5. Integer division is different however, because there are no decimal points in integers.  When you do the following : 7 / 2, you get the answer: 3.  Just plain 3.  This is because in integer division, the answer will always be rounded down.  Imagine you have 7 dollars and you are in the store and they sell big bottles of soda for 2 dollars each.  How many sodas can you buy?  Well, 3, because you can't buy a half of a soda.

##Release 2

###Number of hours in a year

```
p 365*24
```

###Minutes in a decade

```
p (8*365*24*60) + (2*366*24*60) #Since in almost every decade there will be two leap years
```

