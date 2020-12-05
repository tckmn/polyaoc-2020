r input
$d
%s/[FL]/0/g
%s/[BR]/1/g
%s/.*/\=str2nr(submatch(0),2)
sort nu
exe "%norm jy$kA \<esc>p\<c-x>"
g/\v^(.*) \1/d
norm kdwddp
