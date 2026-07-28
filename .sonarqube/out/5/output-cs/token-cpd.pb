∑E
`C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
const 
string 
CorsPolicyName 
= 
$str -
;- .
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddHttpClient 
< 
GooglePlacesService 2
>2 3
(3 4
)4 5
;5 6
builder 
. 
Services 
. 
AddConfigServices "
(" #
)# $
;$ %
builder 
. 
Services 
. 

AddSignalR 
( 
) 
; 
builder 
. 
Services 
. 
AddSingleton 
< 
NotificacionService 1
>1 2
(2 3
)3 4
;4 5
var 
allowedOrigins 
= 
builder 
. 
Configuration *
. 

GetSection 
( 
$str %
)% &
. 
Get 
< 	
string	 
[ 
] 
> 
( 
) 
?? 
Array 
. 
Empty #
<# $
string$ *
>* +
(+ ,
), -
;- .
var 
allowedOriginsSet 
= 
allowedOrigins &
.& '
	ToHashSet' 0
(0 1
StringComparer1 ?
.? @
OrdinalIgnoreCase@ Q
)Q R
;R S
var 
isDevelopment 
= 
builder 
. 
Environment '
.' (
IsDevelopment( 5
(5 6
)6 7
;7 8
builder 
. 
Services 
. 
AddCors 
( 
options  
=>! #
{ 
options   
.   
	AddPolicy   
(   
CorsPolicyName   $
,  $ %
policy  & ,
=>  - /
{!! 
policy"" 
.## 
SetIsOriginAllowed## 
(##  
origin##  &
=>##' )
IsAllowedCorsOrigin##* =
(##= >
origin##> D
,##D E
allowedOriginsSet##F W
,##W X
isDevelopment##Y f
)##f g
)##g h
.$$ 
AllowAnyHeader$$ 
($$ 
)$$ 
.%% 
AllowAnyMethod%% 
(%% 
)%% 
.&& 
AllowCredentials&& 
(&& 
)&& 
;&&  
}'' 
)'' 
;'' 
}(( 
)(( 
;(( 
var** 
app** 
=** 	
builder**
 
.** 
Build** 
(** 
)** 
;** 
if-- 
(-- 
app-- 
.-- 
Environment-- 
.-- 
IsDevelopment-- !
(--! "
)--" #
)--# $
{.. 
app// 
.// 

UseSwagger// 
(// 
)// 
;// 
app00 
.00 
UseSwaggerUI00 
(00 
)00 
;00 
}11 
if33 
(33 
!33 
app33 
.33 	
Environment33	 
.33 
IsDevelopment33 "
(33" #
)33# $
)33$ %
{44 
app55 
.55 
UseHttpsRedirection55 
(55 
)55 
;55 
}66 
app88 
.88 
UseCors88 
(88 
CorsPolicyName88 
)88 
;88 
app:: 
.:: 
UseAuthorization:: 
(:: 
):: 
;:: 
app<< 
.<< 
MapControllers<< 
(<< 
)<< 
;<< 
app>> 
.>> 
MapHub>> 

<>>
 
NotificacionHub>> 
>>> 
(>> 
$str>> 1
)>>1 2
;>>2 3
app@@ 
.@@ 
Run@@ 
(@@ 
)@@ 	
;@@	 

staticBB 
boolBB 
IsAllowedCorsOriginBB 
(BB  
stringBB  &
originBB' -
,BB- .
ISetBB/ 3
<BB3 4
stringBB4 :
>BB: ;
allowedOriginsBB< J
,BBJ K
boolBBL P
isDevelopmentBBQ ^
)BB^ _
{CC 
ifDD 
(DD 
allowedOriginsDD 
.DD 
ContainsDD 
(DD  
originDD  &
)DD& '
)DD' (
{EE 
returnFF 
trueFF 
;FF 
}GG 
ifII 
(II 
!II 	
isDevelopmentII	 
||II 
!II 
UriII 
.II 
	TryCreateII (
(II( )
originII) /
,II/ 0
UriKindII1 8
.II8 9
AbsoluteII9 A
,IIA B
outIIC F
varIIG J
uriIIK N
)IIN O
)IIO P
{JJ 
returnKK 
falseKK 
;KK 
}LL 
ifNN 
(NN 
uriNN 
.NN 
SchemeNN 
isNN 
notNN 
$strNN  
andNN! $
notNN% (
$strNN) 0
)NN0 1
{OO 
returnPP 
falsePP 
;PP 
}QQ 
ifSS 
(SS 
uriSS 
.SS 
PortSS 
isSS 
notSS 
$numSS 
andSS  
notSS! $
$numSS% )
andSS* -
notSS. 1
$numSS2 6
)SS6 7
{TT 
returnUU 
falseUU 
;UU 
}VV 
returnXX 

uriXX 
.XX 
HostXX 
.XX 
EqualsXX 
(XX 
$strXX &
,XX& '
StringComparisonXX( 8
.XX8 9
OrdinalIgnoreCaseXX9 J
)XXJ K
||YY 

uriYY 
.YY 
HostYY 
.YY 
EqualsYY 
(YY 
$strYY  
,YY  !
StringComparisonYY" 2
.YY2 3
OrdinalIgnoreCaseYY3 D
)YYD E
||ZZ 

IsPrivateIpv4ZZ 
(ZZ 
uriZZ 
.ZZ 
HostZZ !
)ZZ! "
;ZZ" #
}[[ 
static]] 
bool]] 
IsPrivateIpv4]] 
(]] 
string]]  
host]]! %
)]]% &
{^^ 
if__ 
(__ 
!__ 	
	IPAddress__	 
.__ 
TryParse__ 
(__ 
host__  
,__  !
out__" %
var__& )
address__* 1
)__1 2
)__2 3
{`` 
returnaa 
falseaa 
;aa 
}bb 
vardd 
bytesdd 
=dd 
addressdd 
.dd 
GetAddressBytesdd '
(dd' (
)dd( )
;dd) *
ifee 
(ee 
bytesee 
.ee 
Lengthee 
!=ee 
$numee 
)ee 
{ff 
returngg 
falsegg 
;gg 
}hh 
returnjj 

bytesjj 
[jj 
$numjj 
]jj 
==jj 
$numjj 
||kk 

byteskk 
[kk 
$numkk 
]kk 
==kk 
$numkk 
||ll 

bytesll 
[ll 
$numll 
]ll 
==ll 
$numll 
&&ll 
bytesll #
[ll# $
$numll$ %
]ll% &
==ll' )
$numll* -
||mm 

bytesmm 
[mm 
$nummm 
]mm 
==mm 
$nummm 
&&mm 
bytesmm #
[mm# $
$nummm$ %
]mm% &
>=mm' )
$nummm* ,
&&mm- /
bytesmm0 5
[mm5 6
$nummm6 7
]mm7 8
<=mm9 ;
$nummm< >
;mm> ?
}nn Ù9
lC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\GooglePlacesService.cs
	namespace 	
Bless
 
. 
Booking 
. 
Service 
{ 
public 

class 
GooglePlacesService $
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
private		 
readonly		 
string		 
_apiKey		  '
;		' (
private

 
readonly

 
string

 
_placeId

  (
;

( )
public 
GooglePlacesService "
(" #
IConfiguration# 1
configuration2 ?
,? @

HttpClientA K

httpClientL V
)V W
{ 	
_httpClient 
= 

httpClient $
;$ %
_apiKey 
= 
configuration #
[# $
$str$ 3
]3 4
;4 5
_placeId 
= 
configuration $
[$ %
$str% 5
]5 6
;6 7
} 	
public 
async 
Task 
< 
List 
< 
Review %
>% &
>& '
GetReviewsAsync( 7
(7 8
)8 9
{ 	
try 
{ 
var 
url 
= 
$" 
$str ]
{] ^
_placeId^ f
}f g
$str	g á
{
á à
_apiKey
à è
}
è ê
"
ê ë
;
ë í
var 
response 
= 
await $
_httpClient% 0
.0 1
GetFromJsonAsync1 A
<A B 
PlaceDetailsResponseB V
>V W
(W X
urlX [
)[ \
;\ ]
if 
( 
response 
? 
. 
Result $
?$ %
.% &
Reviews& -
!=. 0
null1 5
&&6 8
response9 A
.A B
ResultB H
.H I
ReviewsI P
.P Q
CountQ V
>W X
$numY Z
)Z [
{ 
foreach 
( 
var  
review! '
in( *
response+ 3
.3 4
Result4 :
.: ;
Reviews; B
)B C
{ 
review!! 
.!! 
Text!! #
=!!$ %
await!!& +
TranslateTextAsync!!, >
(!!> ?
review!!? E
.!!E F
Text!!F J
,!!J K
$str!!L P
)!!P Q
;!!Q R
}"" 
return## 
response## #
.### $
Result##$ *
.##* +
Reviews##+ 2
;##2 3
}$$ 
return&& 
new&& 
List&& 
<&&  
Review&&  &
>&&& '
(&&' (
)&&( )
;&&) *
}'' 
catch(( 
(((  
HttpRequestException(( '
ex((( *
)((* +
{)) 
Console** 
.** 
	WriteLine** !
(**! "
$"**" $
$str**$ K
{**K L
ex**L N
.**N O
Message**O V
}**V W
"**W X
)**X Y
;**Y Z
}++ 
catch,, 
(,, 
	Exception,, 
ex,, 
),,  
{-- 
Console.. 
... 
	WriteLine.. !
(..! "
$".." $
$str..$ M
{..M N
ex..N P
...P Q
Message..Q X
}..X Y
"..Y Z
)..Z [
;..[ \
}// 
return11 
new11 
List11 
<11 
Review11 "
>11" #
(11# $
)11$ %
;11% &
}22 	
private44 
async44 
Task44 
<44 
string44 !
>44! "
TranslateTextAsync44# 5
(445 6
string446 <
text44= A
,44A B
string44C I
targetLanguage44J X
=44Y Z
$str44[ _
)44_ `
{55 	
try66 
{77 
var88 
url88 
=88 
$"88 
$str88 Y
{88Y Z
_apiKey88Z a
}88a b
"88b c
;88c d
var99 
requestData99 
=99  !
new99" %
{:: 
q;; 
=;; 
text;; 
,;; 
target<< 
=<< 
targetLanguage<< +
}== 
;== 
var?? 
response?? 
=?? 
await?? $
_httpClient??% 0
.??0 1
PostAsJsonAsync??1 @
(??@ A
url??A D
,??D E
requestData??F Q
)??Q R
;??R S
if@@ 
(@@ 
response@@ 
.@@ 
IsSuccessStatusCode@@ 0
)@@0 1
{AA 
varBB 
jsonResponseBB $
=BB% &
awaitBB' ,
responseBB- 5
.BB5 6
ContentBB6 =
.BB= >
ReadFromJsonAsyncBB> O
<BBO P#
GoogleTranslateResponseBBP g
>BBg h
(BBh i
)BBi j
;BBj k
returnCC 
jsonResponseCC '
?CC' (
.CC( )
DataCC) -
?CC- .
.CC. /
TranslationsCC/ ;
?CC; <
[CC< =
$numCC= >
]CC> ?
?CC? @
.CC@ A
TranslatedTextCCA O
??CCP R
textCCS W
;CCW X
}DD 
}EE 
catchFF 
(FF 
	ExceptionFF 
exFF 
)FF  
{GG 
ConsoleHH 
.HH 
	WriteLineHH !
(HH! "
$"HH" $
$strHH$ 7
{HH7 8
exHH8 :
.HH: ;
MessageHH; B
}HHB C
"HHC D
)HHD E
;HHE F
}II 
returnKK 
textKK 
;KK 
}LL 	
}MM 
publicPP 

classPP #
GoogleTranslateResponsePP (
{QQ 
[RR 	
JsonPropertyNameRR	 
(RR 
$strRR  
)RR  !
]RR! "
publicSS 
TranslationDataSS 
DataSS #
{SS$ %
getSS& )
;SS) *
setSS+ .
;SS. /
}SS0 1
}TT 
publicVV 

classVV 
TranslationDataVV  
{WW 
[XX 	
JsonPropertyNameXX	 
(XX 
$strXX (
)XX( )
]XX) *
publicYY 
ListYY 
<YY 
TranslationYY 
>YY  
TranslationsYY! -
{YY. /
getYY0 3
;YY3 4
setYY5 8
;YY8 9
}YY: ;
}ZZ 
public\\ 

class\\ 
Translation\\ 
{]] 
[^^ 	
JsonPropertyName^^	 
(^^ 
$str^^ *
)^^* +
]^^+ ,
public__ 
string__ 
TranslatedText__ $
{__% &
get__' *
;__* +
set__, /
;__/ 0
}__1 2
}`` 
}aa ∞.
vC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Controllers\ReservaController.cs
	namespace 	
Bless
 
. 
Booking 
. 
Service 
.  
Controllers  +
{ 
[ 
ApiController 
] 
[		 
Route		 

(		
 
$str		 
)		 
]		 
public

 

class

 
ReservasController

 #
:

$ %
ControllerBase

& 4
{ 
private 
readonly 
IReserva !
_reservaService" 1
;1 2
private 
readonly 
NotificacionService , 
_notificacionService- A
;A B
public 
ReservasController !
(! "
IReserva" *
reservaService+ 9
,9 :
NotificacionService; N
notificacionServiceO b
)b c
{ 	
this 
. 
_reservaService  
=! "
reservaService# 1
;1 2 
_notificacionService  
=! "
notificacionService# 6
;6 7
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GuardarReserva) 7
(7 8
[8 9
FromBody9 A
]A B
ReservaRequestC Q
requestR Y
)Y Z
{ 	
try 
{ 
var 
result 
= 
await "
_reservaService# 2
.2 3
GuardarReservaAsync3 F
(F G
requestG N
)N O
;O P
if 
( 
result 
. 
	IsSuccess $
)$ %
{ 
await  
_notificacionService .
.. /#
EnviarNotificacionAsync/ F
(F G
$strG j
)j k
;k l
return   
Ok   
(   
result   $
)  $ %
;  % &
}!! 
else"" 
return## 

BadRequest## %
(##% &
result##& ,
)##, -
;##- .
}%% 
catch&& 
(&& 
	Exception&& 
ex&& 
)&&  
{'' 
return(( 

StatusCode(( !
(((! "
StatusCodes((" -
.((- .(
Status500InternalServerError((. J
,((J K
ex((L N
.((N O
Message((O V
)((V W
;((W X
})) 
}** 	
[-- 	
HttpGet--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
IActionResult.. '
>..' (%
ListarHorariosDisponibles..) B
(..B C
int..C F
	barberoId..G P
,..P Q
DateTime..R Z
fecha..[ `
)..` a
{// 	
try00 
{11 
var22 
result22 
=22 
await22 "
_reservaService22# 2
.222 3*
ListarHorariosDisponiblesAsync223 Q
(22Q R
	barberoId22R [
,22[ \
fecha22] b
)22b c
;22c d
if33 
(33 
result33 
.33 
	IsSuccess33 $
)33$ %
return44 
Ok44 
(44 
result44 $
)44$ %
;44% &
else55 
return66 

BadRequest66 %
(66% &
result66& ,
)66, -
;66- .
}77 
catch88 
(88 
	Exception88 
ex88 
)88  
{99 
return:: 

StatusCode:: !
(::! "
StatusCodes::" -
.::- .(
Status500InternalServerError::. J
,::J K
new::L O
{;; 
	IsSuccess<< 
=<< 
false<<  %
,<<% &
Message== 
=== 
ex==  
.==  !
Message==! (
}>> 
)>> 
;>> 
}?? 
}@@ 	
[BB 	
HttpGetBB	 
(BB 
$strBB 
)BB 
]BB 
publicCC 
asyncCC 
TaskCC 
<CC 
IActionResultCC '
>CC' (
ListarReservasCC) 7
(CC7 8
DateTimeCC8 @
fechaCCA F
,CCF G
intCCH K
	barberoIdCCL U
)CCU V
{DD 	
tryEE 
{FF 
varGG 
resultGG 
=GG 
awaitGG "
_reservaServiceGG# 2
.GG2 3
ListarReservasAsyncGG3 F
(GGF G
fechaGGG L
,GGL M
	barberoIdGGN W
)GGW X
;GGX Y
ifHH 
(HH 
resultHH 
.HH 
	IsSuccessHH $
)HH$ %
returnII 
OkII 
(II 
resultII $
)II$ %
;II% &
elseJJ 
returnKK 

BadRequestKK %
(KK% &
resultKK& ,
)KK, -
;KK- .
}LL 
catchMM 
(MM 
	ExceptionMM 
exMM 
)MM  
{NN 
returnOO 

StatusCodeOO !
(OO! "
StatusCodesOO" -
.OO- .(
Status500InternalServerErrorOO. J
,OOJ K
newOOL O
{PP 
	IsSuccessQQ 
=QQ 
falseQQ  %
,QQ% &
MessageRR 
=RR 
exRR  
.RR  !
MessageRR! (
}SS 
)SS 
;SS 
}TT 
}UU 	
}VV 
}WW  
wC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Controllers\ServicioController.cs
	namespace 	
Bless
 
. 
Booking 
. 
Service 
.  
Controllers  +
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
ServicioController #
:$ %

Controller& 0
{ 
private		 
readonly		 
BusinessLogic		 &
.		& '

Interfaces		' 1
.		1 2
	IServicio		2 ;
_servicioService		< L
;		L M
public

 
ServicioController

 !
(

! "
BusinessLogic

" /
.

/ 0

Interfaces

0 :
.

: ;
	IServicio

; D
servicioService

E T
)

T U
{ 	
_servicioService 
= 
servicioService .
;. /
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
ListarServicios) 8
(8 9
)9 :
{ 	
try 
{ 
var 
result 
= 
await "
_servicioService# 3
.3 4 
ListarServiciosAsync4 H
(H I
)I J
;J K
if 
( 
result 
. 
	IsSuccess $
)$ %
return 
Ok 
( 
result $
)$ %
;% &
else 
return 

BadRequest %
(% &
result& ,
), -
;- .
} 
catch 
( 
	Exception 
ex 
)  
{ 
return 

StatusCode !
(! "
StatusCodes" -
.- .(
Status500InternalServerError. J
,J K
newL O
{   
	IsSuccess!! 
=!! 
false!!  %
,!!% &
Message"" 
="" 
ex""  
.""  !
Message""! (
}## 
)## 
;## 
}$$ 
}%% 	
}&& 
}'' Ô
sC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Controllers\PushController.cs
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public 
class 
PushController 
: 
ControllerBase ,
{ 
private		 
static		 
List		 
<		 
PushSubscription		 (
>		( )
_subscriptions		* 8
=		9 :
new		; >
(		> ?
)		? @
;		@ A
[ 
HttpPost 
( 
$str 
) 
] 
public 

IActionResult 
	Subscribe "
(" #
[# $
FromBody$ ,
], -
PushSubscription. >
subscription? K
)K L
{ 
_subscriptions 
. 
Add 
( 
subscription '
)' (
;( )
return 
Ok 
( 
) 
; 
} 
[ 
HttpPost 
( 
$str 
) 
] 
public 

IActionResult 
SendNotification )
() *
)* +
{ 
var 
vapidDetails 
= 
new 
VapidDetails +
(+ ,
$str 
, 
$str 
, 
$str 
) 
; 
var 
webPushClient 
= 
new 
WebPushClient  -
(- .
). /
;/ 0
foreach 
( 
var 
sub 
in 
_subscriptions *
)* +
{ 	
var 
payload 
= 
JsonSerializer (
.( )
	Serialize) 2
(2 3
new3 6
{ 
title 
= 
$str :
,: ;
message   
=   
$str   C
}!! 
)!! 
;!! 
try## 
{$$ 
webPushClient%% 
.%% 
SendNotification%% .
(%%. /
sub%%/ 2
,%%2 3
payload%%4 ;
,%%; <
vapidDetails%%= I
)%%I J
;%%J K
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
Console)) 
.)) 
	WriteLine)) !
())! "
$str))" 5
+))6 7
ex))8 :
.)): ;
Message)); B
)))B C
;))C D
}** 
}++ 	
return-- 
Ok-- 
(-- 
)-- 
;-- 
}.. 
}// ù

}C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Controllers\NotificacionesController.cs
	namespace 	
Bless
 
. 
Booking 
. 
Service 
.  
Controllers  +
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public		 

class		 $
NotificacionesController		 )
:		* +

Controller		, 6
{

 
private 
readonly 
NotificacionService , 
_notificacionService- A
;A B
public 
NotificacionService "
NotificacionService# 6
=>7 9 
_notificacionService: N
;N O
[ 	
HttpPost	 
( 
$str &
)& '
]' (
public 
async 
Task 
< 
IActionResult '
>' (
EnviarNotificacion) ;
(; <
string< B
messageC J
)J K
{ 	
return 
Ok 
( 
) 
; 
} 	
} 
} ô
{C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Controllers\GooglePlacesController.cs
	namespace 	
Bless
 
. 
Booking 
. 
Service 
.  
Controllers  +
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class "
GooglePlacesController '
:( )
ControllerBase* 8
{		 
private

 
readonly

 
GooglePlacesService

 , 
_googlePlacesService

- A
;

A B
public "
GooglePlacesController %
(% &
GooglePlacesService& 9
googlePlacesService: M
)M N
{ 	 
_googlePlacesService  
=! "
googlePlacesService# 6
;6 7
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
Review, 2
>2 3
>3 4
>4 5

GetReviews6 @
(@ A
)A B
{ 	
try 
{ 
var 
reviews 
= 
await # 
_googlePlacesService$ 8
.8 9
GetReviewsAsync9 H
(H I
)I J
;J K
if 
( 
reviews 
== 
null #
||$ &
reviews' .
.. /
Count/ 4
==5 7
$num8 9
)9 :
{ 
return 
Ok 
( 
new !
{" #
message$ +
=, -
$str. [
}\ ]
)] ^
;^ _
} 
return 
Ok 
( 
reviews !
)! "
;" #
} 
catch   
(   
	Exception   
ex   
)    
{!! 
return"" 

StatusCode"" !
(""! "
$num""" %
,""% &
ex""' )
."") *
Message""* 1
)""1 2
;""2 3
}## 
}$$ 	
}%% 
}&& Ç
vC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Controllers\BarberoController.cs
	namespace 	
Bless
 
. 
Booking 
. 
Service 
.  
Controllers  +
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
BarberoController "
:# $

Controller% /
{ 
private		 
readonly		 
Bless		 
.		 
BusinessLogic		 ,
.		, -

Interfaces		- 7
.		7 8
IBarbero		8 @
_barberoService		A P
;		P Q
public

 
BarberoController

  
(

  !
Bless

! &
.

& '
BusinessLogic

' 4
.

4 5

Interfaces

5 ?
.

? @
IBarbero

@ H
barberoService

I W
)

W X
{ 	
_barberoService 
= 
barberoService ,
;, -
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
ListarBarberos) 7
(7 8
)8 9
{ 	
try 
{ 
var 
result 
= 
await "
_barberoService# 2
.2 3
ListarBarberosAsync3 F
(F G
)G H
;H I
if 
( 
result 
. 
	IsSuccess $
)$ %
return 
Ok 
( 
result $
)$ %
;% &
else 
return 

BadRequest %
(% &
result& ,
), -
;- .
} 
catch 
( 
	Exception 
ex !
)! "
{ 
return 

StatusCode !
(! "
StatusCodes" -
.- .(
Status500InternalServerError. J
,J K
newL O
{ 
	IsSuccess 
= 
false  %
,% &
Message   
=   
ex    
.    !
Message  ! (
}!! 
)!! 
;!! 
}"" 
}## 	
}$$ 
}%% ¢
sC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.Booking.Service\Controllers\AuthController.cs
	namespace 	
Bless
 
. 
Booking 
. 
Service 
.  
Controllers  +
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public		 

class		 
AuthController		 
:		  !
ControllerBase		" 0
{

 
private 
readonly 
IUsuario !
_usuario" *
;* +
public 
AuthController 
( 
IUsuario &
usuario' .
). /
{ 	
this 
. 
_usuario 
= 
usuario #
;# $
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Login) .
(. /
[/ 0
FromBody0 8
]8 9
LoginRequest: F
requestG N
)N O
{ 	
try 
{ 
var 
result 
= 
await "
_usuario# +
.+ ,

LoginAsync, 6
(6 7
request7 >
)> ?
;? @
return 
result 
. 
	IsSuccess '
?( )
Ok* ,
(, -
result- 3
.3 4
Content4 ;
); <
:= >
Unauthorized? K
(K L
resultL R
.R S
MessageS Z
)Z [
;[ \
} 
catch 
( 
	Exception 
ex 
)  
{ 
return 

StatusCode !
(! "
StatusCodes" -
.- .(
Status500InternalServerError. J
,J K
exL N
.N O
MessageO V
)V W
;W X
} 
} 	
[!! 	
HttpPost!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
Register"") 1
(""1 2
[""2 3
FromBody""3 ;
]""; <
Usuario""= D
nuevoUsuario""E Q
)""Q R
{## 	
try$$ 
{%% 
var&& 
result&& 
=&& 
await&& "
_usuario&&# +
.&&+ ,
RegistrarAsync&&, :
(&&: ;
nuevoUsuario&&; G
)&&G H
;&&H I
return'' 
result'' 
.'' 
	IsSuccess'' '
?''( )
Ok''* ,
('', -
result''- 3
.''3 4
Message''4 ;
)''; <
:''= >

BadRequest''? I
(''I J
result''J P
.''P Q
Message''Q X
)''X Y
;''Y Z
})) 
catch** 
(** 
	Exception** 
ex** 
)**  
{++ 
return,, 

StatusCode,, !
(,,! "
StatusCodes,," -
.,,- .(
Status500InternalServerError,,. J
,,,J K
ex,,L N
.,,N O
Message,,O V
),,V W
;,,W X
}-- 
}.. 	
}// 
}00 