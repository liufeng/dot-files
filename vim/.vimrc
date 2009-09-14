set ci sc wmnu et nosol si bs=2 ls=2
set shm=IatA ww=<,>,[,] ts=4 sw=4
set lcs=eol:$,tab:>-,trail:.,extends:>
set pt=<F5> nomore modelines=5 modeline hls!
syn on

ino <Down> <C-O>gj
ino <Up> <C-O>gk
nno <Down> gj
nno <Up> gk

nno <F2> :set hls!<bar>set hls?<CR>
nno <F3> :set nu!<bar>set nu?<CR>
