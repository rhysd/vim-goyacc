" Vim syntax file
" Language:	GoYacc
" Original Author:	Charles E. Campbell <NdrOchipS@PcampbellAfamily.Mbiz>
" Current Author:	rhysd <lin90162@yahoo.co.jp>
"
" Options: {{{1

if exists('b:current_syntax')
 syntax clear
endif

" ---------------------------------------------------------------------
"  Folding Support {{{1
if has('folding')
 com! -nargs=+ SynFold	<args> fold
else
 com! -nargs=+ SynFold	<args>
endif

syn include @goYaccCode syntax/go.vim

" ---------------------------------------------------------------------
"  Yacc Clusters: {{{1
syn cluster goYaccInitCluster	contains=goYaccKey,goYaccKeyActn,goYaccBrkt,goYaccType,goYaccString,goYaccUnionStart,goYaccHeader2,goYaccComment,goYaccDefines,goYaccParseParam,goYaccParseOption
syn cluster goYaccRulesCluster	contains=goYaccNonterminal,goYaccString,goYaccComment

" ---------------------------------------------------------------------
"  Yacc Sections: {{{1
SynFold syn	region	goYaccInit	start='.'ms=s-1,rs=s-1	matchgroup=goYaccSectionSep	end='^%%$'me=e-2,re=e-2	contains=@goYaccInitCluster	nextgroup=goYaccRules	skipwhite skipempty contained
SynFold syn	region	goYaccInit2      start='\%^.'ms=s-1,rs=s-1	matchgroup=goYaccSectionSep	end='^%%$'me=e-2,re=e-2	contains=@goYaccInitCluster	nextgroup=goYaccRules	skipwhite skipempty
SynFold syn	region	goYaccHeader2	matchgroup=goYaccSep	start="^\s*\zs%{"	end="^\s*%}"		contains=@goYaccCode	nextgroup=goYaccInit	skipwhite skipempty contained
SynFold syn	region	goYaccHeader	matchgroup=goYaccSep	start="^\s*\zs%{"	end="^\s*%}"		contains=@goYaccCode	nextgroup=goYaccInit	skipwhite skipempty
SynFold syn	region	goYaccRules	matchgroup=goYaccSectionSep	start='^%%$'		end='^%%$'me=e-2,re=e-2	contains=@goYaccRulesCluster	nextgroup=goYaccEndCode	skipwhite skipempty contained
SynFold syn	region	goYaccEndCode	matchgroup=goYaccSectionSep	start='^%%$'		end='\%$'		contains=@goYaccCode	contained

" ---------------------------------------------------------------------
" Yacc Commands: {{{1
syn	match	goYaccDefines	'^%define\s\+.*$'
syn	match	goYaccParseParam	'%\(parse\|lex\)-param\>'		skipwhite	nextgroup=goYaccParseParamStr
syn	match	goYaccParseOption '%\%(api\.pure\|pure-parser\|locations\|error-verbose\)\>'
syn	region	goYaccParseParamStr	contained matchgroup=Delimiter	start='{'	end='}'	contains=cStructure

syn	match	goYaccDelim	"[:|]"	contained
syn	match	goYaccOper	"@\d\+"	contained

syn	match	goYaccKey	"^\s*%\(token\|type\|left\|right\|start\|ident\|nonassoc\)\>"	contained
syn	match	goYaccKey	"\s%\(prec\|expect\)\>"	contained
syn	match	goYaccKey	"\$\(<[a-zA-Z_][a-zA-Z_0-9]*>\)\=[\$0-9]\+"	contained
syn	keyword	goYaccKeyActn	yyerrok yyclearin	contained

syn	match	goYaccUnionStart	"^%union"	skipwhite skipnl nextgroup=goYaccUnion	contained
SynFold syn	region	goYaccUnion	matchgroup=goYaccCurly start="{" matchgroup=goYaccCurly end="}" contains=@goYaccCode	contained
syn	match	goYaccBrkt	"[<>]"	contained
syn	match	goYaccType	"<[a-zA-Z_][a-zA-Z0-9_]*>"	contains=goYaccBrkt	contained

SynFold syn	region	goYaccNonterminal	start="^\s*\a\w*\ze\_s*\(/\*\_.\{-}\*/\)\=\_s*:"	matchgroup=goYaccDelim end=";"	matchgroup=goYaccSectionSep end='^%%$'me=e-2,re=e-2 contains=goYaccAction,goYaccDelim,goYaccString,goYaccComment	contained
syn	region	goYaccComment	start="/\*"	end="\*/"
syn	match	goYaccString	"'[^']*'"	contained


" ---------------------------------------------------------------------
" I'd really like to highlight just the outer {}.  Any suggestions??? {{{1
syn	match	goYaccCurlyError	"[{}]"
SynFold syn	region	goYaccAction	matchgroup=goYaccCurly start="{" end="}" 	contains=@goYaccCode,goYaccVar		contained
syn	match	goYaccVar	'\$\d\+\|\$\$\|\$<\I\i*>\$\|\$<\I\i*>\d\+'	containedin=cParen,cPreProc,cMulti	contained

" ---------------------------------------------------------------------
" Yacc synchronization: {{{1
syn sync fromstart

" ---------------------------------------------------------------------
" Define the default highlighting. {{{1
if !exists('skip_goyacc_syn_inits')
  hi def link goYaccBrkt	goYaccStmt
  hi def link goYaccComment	Comment
  hi def link goYaccCurly	Delimiter
  hi def link goYaccCurlyError	Error
  hi def link goYaccDefines	cDefine
  hi def link goYaccDelim	Delimiter
  hi def link goYaccKeyActn	Special
  hi def link goYaccKey	goYaccStmt
  hi def link goYaccNonterminal	Function
  hi def link goYaccOper	goYaccStmt
  hi def link goYaccParseOption	cDefine
  hi def link goYaccParseParam	goYaccParseOption
  hi def link goYaccSectionSep	Todo
  hi def link goYaccSep	Delimiter
  hi def link goYaccStmt	Statement
  hi def link goYaccString	String
  hi def link goYaccType	Type
  hi def link goYaccUnionStart	goYaccKey
  hi def link goYaccVar	Special
endif

" ---------------------------------------------------------------------
"  Cleanup: {{{1
delcommand SynFold
let b:current_syntax = 'goyacc'

" ---------------------------------------------------------------------
"  Modelines: {{{1
" vim: ts=15 fdm=marker
