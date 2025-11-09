" This program is free software: you can redistribute it and/or modify it under
" the terms of the GNU General Public License as published by the Free Software
" Foundation, either version 3 of the License, or (at your option) any later
" version.
"
" This program is distributed in the hope that it will be useful, but WITHOUT
" ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
" FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License along with
" this program. If not, see <https://www.gnu.org/licenses/>.


if exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax case ignore

syntax keyword autohotkey_v2Boolean false true
syntax keyword autohotkey_v2BuiltInConstructor array object
syntax keyword autohotkey_v2BuiltInFunction abs asin acos atan
	\ blockinput buffer
	\ callbackcreate callbackfree caretgetpos ceil chr click clipboardall
	\ clipwait comcall comobjactive comobjarray comobjconnect comobject
	\ comobjflags comobjfromptr comobjget comobjquery comobjtype comobjvalue
	\ comvalue controladditem controlchooseindex controlchoosestring
	\ controlclick controldeleteitem controlfinditem controlfocus
	\ controlgetchecked controlgetchoice controlgetclassnn controlgetenabled
	\ controlgetfocus controlgethwnd controlgetindex controlgetitems
	\ controlgetpos controlgetstyle controlgetexstyle controlgettext
	\ controlgetvisible controlhide controlhidedropdown controlmove
	\ controlsend controlsendtext controlsetchecked controlsetenabled
	\ controlsetstyle controlsetexstyle controlsettext controlshow
	\ controlshowdropdown coordmode cos critical
	\ dateadd datediff detecthiddentext detecthiddenwindows dircopy
	\ dircreate dirdelete direxist dirmove dirselect dllcall download
	\ driveeject drivegetcapacity drivegetfilesystem drivegetlabel
	\ drivegetlist drivegetserial drivegetfreespacefree drivegetstatus
	\ drivegetstatuscd drivegettype drivelock driveretract drivesetlabel
	\ driveunlock
	\ edit editgetcurrentcol editgetcurrentline editgetline editgetlinecount
	\ editgetselectedtext editpaste envget envset exit exitapp exp
	\ fileappend filecopy filecreateshortcut filedelete fileencoding
	\ fileexist fileinstall filegetattrib filegetshortcut filegetsize
	\ filegettime filegetversion filemove fileopen fileread filerecycle
	\ filerecycleempty fileselect filesetattrib filesettime floor format
	\ formattime
	\ getkeyname getkeyvk getkeysc getkeystate getmethod groupactivate
	\ groupadd groupclose groupdeactivate gui guictrlfromhwnd guifromhwnd
	\ hasbase hasmethod hasprop hotif hotifwin hotkey hotstring
	\ il_create il_add il_destroy imagesearch inidelete iniread iniwrite
	\ inputbox inputhook installkbdhook installmousehook instr islabel
	\ isobject isset issetref
	\ keyhistory keywait
	\ listhotkeys listlines listvars listviewgetcontent loadpicture log ln
	\ ltrim
	\ map max menubar menu menufromhandle menuselect min mod monitorget
	\ monitorgetcount monitorgetname monitorgetprimary monitrogetworkarea
	\ mouseclick mouseclickdrag mousemove msgbox
	\ numget numput
	\ objaddref objrelease objbindmethod objhasownprop objownprops
	\ objgetbase objgetcapacity objownpropcount objsetbase objsetcapacity
	\ onclipboardchange onerror onexit onmessage ord outputdebug
	\ pause persistent pixelgetcolor pixelsearch postmessage processclose
	\ processexit processgetname processgetparent processgetpath
	\ processsetpriority processwait processwaitclose
	\ random regexmatch regexreplace regcreatekey regdelete regdeletekey
	\ regread regwrite reload round rtrim run runas runwait
	\ send senttext sendinput sendplay sendevent sendlevel sendmessage
	\ sendmode setcapslockstate setcontroldelay setdefaultmousespeed
	\ setkeydelay setmousedelay setnumlockstate setscrolllockstate
	\ setregview setstorecapslockmode settimer settitlematchmode setwindelay
	\ setworkingdir shutdown sin sleep sort soundbeep soundgetinterface
	\ soundgetmute soundgetname soundgetvolume soundplay soundsetmute
	\ soundsetvolume splitpath sqrt statusbargettext statusbarwait
	\ strcompare strget strlen strlower strptr strput strreplace strsplit
	\ strtitle strupper substr suspend sysget sysgetipaddresses
	\ tan thread tooltip trayseticon traytip trim type
	\ varsetstrcapacity vercompare
	\ winactivate winactivatebottom winactive winclose winexist wingetclass
	\ wingetclientpos wingetcontrols wingetcontrolshwnd wingetcount wingetid
	\ wingetidlast wingetlist wingetminmax wingetpid wingetpos
	\ wingetprocessname wingetprocesspath wingetstyle wingetexstyle
	\ wingettext wingettitle wingettranscolor wingettransparent winhide
	\ winkill winmaximize winminimize winminimizeall winminimizeallundo
	\ winmove winmovebottom winmovetop winredraw winrestore
	\ winsetalwaysontop winsetenabled winsetregion winsetstyle winsetexstyle
	\ winsettitle winsettranscolor winsettransparent winshow winwait
	\ winwaitactive winwaitnotactive winwaitclose
syntax keyword autohotkey_v2Branch goto break continue
syntax keyword autohotkey_v2Conditional else if switch
syntax keyword autohotkey_v2Exception catch finally throw try
syntax keyword autohotkey_v2Label case default
syntax keyword autohotkey_v2Repeat for loop until while
syntax keyword autohotkey_v2Statement return
syntax keyword autohotkey_v2Structure class
syntax keyword autohotkey_v2Type nextgroup=autohotkey_v2Identifier global local static
syntax keyword autohotkey_v2Typecast float integer number string

syntax keyword autohotkey_v2AhkCriteria contained ahk_class ahk_exe ahk_group
	\ ahk_id ahk_pid
syntax keyword autohotkey_v2Directive contained clipboardtimeout
	\ dllload errorstdout hotstring hotif hotiftimeout inputlevel maxthreads
	\ maxthreadsbuffer maxthreadsperhotkey notrayicon requires
	\ singleinstance suspendexempt usehook warn winactivateforce
syntax keyword autohotkey_v2Include contained include includeagain
syntax keyword autohotkey_v2Todo contained FIXME NOTE TODO XXX

syntax match autohotkey_v2Decimal display "\-\=\d\+\>"
syntax match autohotkey_v2DirectivePrefix nextgroup=autohotkey_v2Directive,
	\ autohotkey_v2Include "^\s*\zs#"
syntax match autohotkey_v2EscapeSequence "`[`;:{nrbtsvaf"']"
syntax match autohotkey_v2FloatingPoint display "\d\+\.\d*\>\|\.\d\+\>"
syntax match autohotkey_v2Function "\<[a-zA-Z_]\w*\ze("
syntax match autohotkey_v2Hexadecimal display "\<0x\x\+\>"
syntax match autohotkey_v2LineComment ";.*" contains=autohotkey_v2Todo,@Spell

syntax region autohotkey_v2Block start="{" end="}" transparent fold
syntax region autohotkey_v2BlockComment start="/\*" end="\*/" contains=
	\ autohotkey_v2Todo,@Spell fold
syntax region autohotkey_v2DoubleQuoteString start=+"+ end=+"+ contains=
	\ autohotkey_v2EscapeSequence,@Spell
syntax region autohotkey_v2SingleQuoteString start=+'+ end=+'+ contains=
	\ autohotkey_v2EscapeSequence,@Spell

" TODO - Do this in a more "clean" and/or efficient way.
syntax match autohotkey_v2Identifier
	\ "\<[a-zA-Z_]\w*\ze\s*\([\)\[\],\.?+\*\&/<>\^|\~=]\|?:\|:=\|\(\-\D\)\|
	\\scontains\s\|\sis\s\|\sin\s\|\snot\s\|\sand\s\|\sor\s\)"

" NOTE - I know putting "contains" in "syntax match" instead of "syntax
" keyword" is ugly, but it needs to be like this because otherwise vim throws
" an error because "contains" is not allowed here (I read the documentation
" and it's explicitly stated that "syntax match" must be used in this case).
syntax keyword autohotkey_v2Operator is in not and or
syntax match autohotkey_v2Operator
	\ "[%\.?+\*!\~\&/<>\^|\~=]\|?:\|:=\|\(\-\ze\D\)\|contains"

syntax keyword autohotkey_v2Special super this
syntax match autohotkey_v2Special "[,()\[\]{}]"

syntax sync minlines=200
syntax sync ccomment autohotkey_v2BlockComment

hi def link autohotkey_v2Boolean Boolean

hi def link autohotkey_v2BlockComment Comment
hi def link autohotkey_v2LineComment Comment

hi def link autohotkey_v2Branch Conditional
hi def link autohotkey_v2Conditional Conditional

hi def link autohotkey_v2FloatingPoint Float

hi def link autohotkey_v2BuiltInFunction Function
hi def link autohotkey_v2Function Function

hi def link autohotkey_v2Identifier Identifier

hi def link autohotkey_v2Include Include

hi def link autohotkey_v2Label Label

hi def link autohotkey_v2Decimal Number
hi def link autohotkey_v2Hexadecimal Number

hi def link autohotkey_v2Operator Operator

hi def link autohotkey_v2Directive PreProc
hi def link autohotkey_v2DirectivePrefix PreProc

hi def link autohotkey_v2Repeat Repeat

hi def link autohotkey_v2BuiltInConstructor Special
hi def link autohotkey_v2EscapeSequence Special
hi def link autohotkey_v2Special Special
hi def link autohotkey_v2Typecast Special

hi def link autohotkey_v2Statement Statement

hi def link autohotkey_v2DoubleQuoteString String
hi def link autohotkey_v2SingleQuoteString String

hi def link autohotkey_v2Structure Structure

hi def link autohotkey_v2Todo Todo

hi def link autohotkey_v2Type Type

let b:current_syntax = "autohotkey_v2"

let &cpo = s:cpo_save
unlet s:cpo_save
