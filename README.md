Are you having trouble scanning for particular operators in the code? Keep missing the occasional punctuation characters? Enter the discotheque:

![Demo](http://i.andrewradev.com/642c491d58418f558f203e48dc66eacc.gif)

## Usage

Just run the main command with a Vim regex:

``` vim
:Disco some_variable_name
:Disco +
:Disco unsafe {\_.\{-}}
```

When moving the cursor, the colors of the highlighted text will toggle between blue and red. To stop the highlighting, just run the command with no arguments:

```
:Disco
```

## Should I seriously use this?

There's probably less... energetic ways to emphasize pieces of code you're interested in. But it's a fun party trick.
