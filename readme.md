# KISS Boilerplate

> Boilerplate and snippet insertion, made stupendously simple.

## *CRITICAL* OPTION

By default, KISS Boilerplate assumes it’s installed in
`$VIM/vimfiles/pack/kiss-boilerplate/start/kiss-boilerplate`.
(No, `expand('<sfile>:p:h')` doesn’t work like the docs imply.)
If this *isn’t* where you’d like to install it, just set
`g:kiss_boilerplate_root` to your preferred value somewhere in your `.vimrc` and
the plugin will defer to that.

## Installation:

### Vim 8.0 (with +packages)

Make directories for `$VIM/vimfiles/pack/KISS-Boilerplate/start/`

Then just `git clone https://github.com/9999years/KISS-Boilerplate.git` and
you’re done!

### Vim 7.0+

Copy the files in this repo straight into `$VIM/vimfiles` (that’s what I did, at
least. It was messy). I hear people talk about Vundle a lot and honestly I don’t
even know what Vundle is. Maybe that works. I have no clue, honestly. Godspeed.

## Documentation

KISS-Boilerplate is nicely documented! View the docs
[here](https://github.com/9999years/KISS-Boilerplate/blob/master/doc/kiss-boilerplate.txt).

## What’s Next

I’d like to expand the collection of boilerplate and snippet files — send any
boilerplate files you’d like to see my way, or open a pull request!
