all years:
[polyaoc-2019](https://github.com/tckmn/polyaoc-2019),
[polyaoc-2020](https://github.com/tckmn/polyaoc-2020),
[polyaoc-2021](https://github.com/tckmn/polyaoc-2021),
[polyaoc-2023](https://github.com/tckmn/polyaoc-2023)

(these languages are, in order: x64 assembly, C, Haskell, J, Julia, JavaScript, Jelly, Mathematica, Python, Ruby, Racket, Rust, bash, vim)

|    | asm        | c        | hs        | ijs        | jl        | js        | jy        | mma        | py        | rb        | rkt        | rs        | sh        | vim        |
| -  | -          | -        | -         | -          | -         | -         | -         | -          | -         | -         | -          | -         | -         | -          |
| 01 |            | [✓][01c] | [✓][01hs] |            |           | [✓][01js] |           | [✓][01mma] | [✓][01py] | [✓][01rb] |            |           |           |            |
| 02 |            | [✓][02c] | [✓][02hs] |            |           |           |           | [✓][02mma] | [✓][02py] | [✓][02rb] |            |           |           |            |
| 03 | [✓][03asm] |          | [✓][03hs] |            | [✓][03jl] |           |           |            |           | [✓][03rb] |            | [✓][03rs] |           |            |
| 04 |            |          |           |            |           |           |           |            |           | [✓][04rb] |            |           |           |            |
| 05 |            | [✓][05c] | [✓][05hs] |            |           |           | [✓][05jy] |            |           | [✓][05rb] |            |           | [✓][05sh] | [✓][05vim] |
| 06 |            |          | [✓][06hs] | [✓][06ijs] |           |           |           |            |           | [✓][06rb] |            |           |           |            |
| 07 |            |          |           |            |           |           |           |            |           | [✓][07rb] |            |           |           |            |
| 08 |            |          | [✓][08hs] |            |           |           |           |            |           | [✓][08rb] |            |           |           |            |
| 09 |            |          | [✓][09hs] |            |           |           |           |            |           | [✓][09rb] | [✓][09rkt] |           |           |            |
| 10 |            |          |           |            | [✓][10jl] |           |           | [✓][10mma] |           | [✓][10rb] |            |           |           |            |
| 11 |            |          |           |            |           |           |           |            |           | [✓][11rb] |            |           |           |            |

how to run the programs:

 * for jy, run `jelly fun jy/##.jy "$(<input)"`
 * for mma, paste into a notebook with the appropriate working directory
 * for vim, run `vim -u NONE '+so vim/##.vim'`
 * for asm, c, and rs, compile with `gcc`, `gcc` or `rustc` respectively, then run the resulting executable
 * for everything else, the files are executable; just run `lang/##.ext`

note that everything expects to be run from the directory containing `input`

[01c]:   https://github.com/tckmn/polyaoc-2020/tree/master/01/c
[01hs]:  https://github.com/tckmn/polyaoc-2020/tree/master/01/hs
[01js]:  https://github.com/tckmn/polyaoc-2020/tree/master/01/js
[01mma]: https://github.com/tckmn/polyaoc-2020/tree/master/01/mma
[01py]:  https://github.com/tckmn/polyaoc-2020/tree/master/01/py
[01rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/01/rb
[02c]:   https://github.com/tckmn/polyaoc-2020/tree/master/02/c
[02hs]:  https://github.com/tckmn/polyaoc-2020/tree/master/02/hs
[02mma]: https://github.com/tckmn/polyaoc-2020/tree/master/02/mma
[02py]:  https://github.com/tckmn/polyaoc-2020/tree/master/02/py
[02rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/02/rb
[03asm]: https://github.com/tckmn/polyaoc-2020/tree/master/03/asm
[03hs]:  https://github.com/tckmn/polyaoc-2020/tree/master/03/hs
[03jl]:  https://github.com/tckmn/polyaoc-2020/tree/master/03/jl
[03rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/03/rb
[03rs]:  https://github.com/tckmn/polyaoc-2020/tree/master/03/rs
[04rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/04/rb
[05c]:   https://github.com/tckmn/polyaoc-2020/tree/master/05/c
[05hs]:  https://github.com/tckmn/polyaoc-2020/tree/master/05/hs
[05jy]:  https://github.com/tckmn/polyaoc-2020/tree/master/05/jy
[05rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/05/rb
[05sh]:  https://github.com/tckmn/polyaoc-2020/tree/master/05/sh
[05vim]: https://github.com/tckmn/polyaoc-2020/tree/master/05/vim
[06hs]:  https://github.com/tckmn/polyaoc-2020/tree/master/06/hs
[06ijs]: https://github.com/tckmn/polyaoc-2020/tree/master/06/ijs
[06rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/06/rb
[07rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/07/rb
[08hs]:  https://github.com/tckmn/polyaoc-2020/tree/master/08/hs
[08rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/08/rb
[09hs]:  https://github.com/tckmn/polyaoc-2020/tree/master/09/hs
[09rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/09/rb
[09rkt]: https://github.com/tckmn/polyaoc-2020/tree/master/09/rkt
[10jl]:  https://github.com/tckmn/polyaoc-2020/tree/master/10/jl
[10mma]: https://github.com/tckmn/polyaoc-2020/tree/master/10/mma
[10rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/10/rb
[11rb]:  https://github.com/tckmn/polyaoc-2020/tree/master/11/rb
