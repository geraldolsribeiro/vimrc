" JET template Java
syntax region jetBlockCmd start="<%" end="%>"
hi def link jetBlockCmd Comment

syn match intmain_docmd    /\(\/\/-- \|\/\/{{{\|\/\/}}}\).*/
syn match intmain_docmd_h1 /\/\/-- # .*/   contained containedin=intmain_docmd display
syn match intmain_docmd_h2 /\/\/-- ## .*/  contained containedin=intmain_docmd display
syn match intmain_docmd_h3 /\/\/-- ### .*/ contained containedin=intmain_docmd display
match intmain_docmd_blank /\/\/-- /

