#!/usr/bin/env jconsole

input =. (LF,LF) splitstring 1!:1 <'input'

echo +/> ([:# LF -.~ ~.) each input
echo +/> ([:# [:(e.#[)/ [:> LF cutopen ]) each input

exit 0
