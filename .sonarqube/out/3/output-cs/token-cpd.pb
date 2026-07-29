õ
[C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess\Usuario.cs
	namespace

 	
Bless


 
.

 

DataAccess

 
{ 
public 

class 
Usuario 
: 
IUsuario #
{ 
private 
readonly 
IConnectionManager +
connectionManager, =
;= >
public 
Usuario 
( 
IConnectionManager )
connectionManager* ;
); <
{ 	
this 
. 
connectionManager "
=# $
connectionManager% 6
;6 7
} 	
public 
async 
Task 
< 
Models  
.  !
Usuario! (
>( )
ObtenerUsuarioAsync* =
(= >
string> D
nombreUsuarioE R
)R S
{ 	
using 
var 

connection  
=! "
connectionManager# 4
.4 5
GetConnectionString5 H
(H I
ConnectionManagerI Z
.Z [
connectionStringKey[ n
)n o
;o p
var 
result 
= 
await 

connection )
.) *$
QueryFirstOrDefaultAsync* B
<B C
ModelsC I
.I J
UsuarioJ Q
>Q R
(R S
$str &
,& '
new 
{ 
NombreUsuario #
=$ %
nombreUsuario& 3
}4 5
,5 6
commandType 
: 
CommandType (
.( )
StoredProcedure) 8
) 
; 
return 
result 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
int"" 
>"" !
RegistrarUsuarioAsync"" 4
(""4 5
Models""5 ;
.""; <
Usuario""< C
usuario""D K
)""K L
{## 	
using$$ 
var$$ 

connection$$  
=$$! "
connectionManager$$# 4
.$$4 5
GetConnectionString$$5 H
($$H I
ConnectionManager$$I Z
.$$Z [
connectionStringKey$$[ n
)$$n o
;$$o p
var&& 
result&& 
=&& 
await&& 

connection&& )
.&&) *
ExecuteAsync&&* 6
(&&6 7
$str'' #
,''# $
new(( 
{)) 
usuario** 
.** 
NombreUsuario** )
,**) *
usuario++ 
.++ 
CorreoElectronico++ -
,++- .
usuario,, 
.,, 
ContrasenaHash,, *
,,,* +
usuario-- 
.-- 
Rol-- 
}.. 
,.. 
commandType// 
:// 
CommandType// (
.//( )
StoredProcedure//) 8
)00 
;00 
return22 
result22 
;22 
}33 	
}44 
}55 ÿ
\C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess\Servicio.cs
	namespace 	
Bless
 
. 

DataAccess 
{ 
public 

class 
Servicio 
: 
	IServicio %
{ 
private 
readonly 
IConnectionManager +
connectionManager, =
;= >
public 
Servicio 
( 
IConnectionManager *
connectionManager+ <
)< =
{ 	
this 
. 
connectionManager "
=# $
connectionManager% 6
;6 7
} 	
public 
async 
Task 
< 
Models  
.  !
Response! )
<) *
List* .
<. /
Models/ 5
.5 6
Servicio6 >
>> ?
>? @
>@ A 
ListarServiciosAsyncB V
(V W
)W X
{ 	
using 
var 

connection  
=! "
connectionManager# 4
.4 5
GetConnectionString5 H
(H I
ConnectionManagerI Z
.Z [
connectionStringKey[ n
)n o
;o p
var 
result 
= 
await 

connection )
.) *

QueryAsync* 4
<4 5
Models5 ;
.; <
Servicio< D
>D E
(E F
$str $
,$ %
commandType 
: 
CommandType (
.( )
StoredProcedure) 8
) 
; 
return 
new 
Response 
<  
List  $
<$ %
Models% +
.+ ,
Servicio, 4
>4 5
>5 6
{7 8
Content9 @
=A B
resultC I
.I J
ToListJ P
(P Q
)Q R
,R S
	IsSuccessT ]
=^ _
true` d
,d e
Messagef m
=n o
$str	p –
}
— ˜
;
˜ ™
} 	
} 
} ×0
[C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess\Reserva.cs
	namespace 	
Bless
 
. 

DataAccess 
{ 
public 

class 
Reserva 
: 
IReserva #
{		 
private

 
readonly

 
IConnectionManager

 +
connectionManager

, =
;

= >
public 
Reserva 
( 
IConnectionManager )
connectionManager* ;
); <
{ 	
this 
. 
connectionManager "
=# $
connectionManager% 6
;6 7
} 	
public 
async 
Task 
< 
Response "
<" #
bool# '
>' (
>( )
GuardarReservaAsync* =
(= >
ReservaRequest> L
requestM T
)T U
{ 	
using 
var 

connection  
=! "
connectionManager# 4
.4 5
GetConnectionString5 H
(H I
ConnectionManagerI Z
.Z [
connectionStringKey[ n
)n o
;o p
await 

connection 
. 
ExecuteAsync )
() *
$str $
,$ %
param 
: 
new 
{ 
request 
. 
Nombre "
," #
request 
. 
Telefono $
,$ %
request 
. 
Correo "
," #
request 
. 
	BarberoId %
,% &
request 
. 

ServicioId &
,& '
request 
. 
Fecha !
,! "
request 
. 
Hora  
}   
,   
commandType!! 
:!! 
CommandType!! (
.!!( )
StoredProcedure!!) 8
)"" 
;"" 
return$$ 
new$$ 
Response$$ 
<$$  
bool$$  $
>$$$ %
{$$& '
Content$$( /
=$$0 1
true$$2 6
,$$6 7
	IsSuccess$$8 A
=$$B C
true$$D H
,$$H I
Message$$J Q
=$$R S
$str$$T w
}$$x y
;$$y z
}%% 	
public'' 
async'' 
Task'' 
<'' 
Response'' "
<''" #
List''# '
<''' (
HorarioDisponible''( 9
>''9 :
>'': ;
>''; <*
ListarHorariosDisponiblesAsync''= [
(''[ \
int''\ _
	barberoId''` i
,''i j
DateTime''k s
fecha''t y
)''y z
{(( 	
using)) 
var)) 

connection))  
=))! "
connectionManager))# 4
.))4 5
GetConnectionString))5 H
())H I
ConnectionManager))I Z
.))Z [
connectionStringKey))[ n
)))n o
;))o p
var++ 
result++ 
=++ 
await++ 

connection++ )
.++) *

QueryAsync++* 4
<++4 5
HorarioDisponible++5 F
>++F G
(++G H
$str,, .
,,,. /
param-- 
:-- 
new-- 
{-- 
	BarberoId-- &
=--' (
	barberoId--) 2
,--2 3
Fecha--4 9
=--: ;
fecha--< A
.--A B
Date--B F
}--G H
,--H I
commandType.. 
:.. 
CommandType.. (
...( )
StoredProcedure..) 8
)// 
;// 
return11 
new11 
Response11 
<11  
List11  $
<11$ %
HorarioDisponible11% 6
>116 7
>117 8
{22 
Content33 
=33 
result33  
.33  !
ToList33! '
(33' (
)33( )
,33) *
	IsSuccess44 
=44 
true44  
,44  !
Message55 
=55 
$str55 I
}66 
;66 
}77 	
public88 
async88 
Task88 
<88 
Response88 "
<88" #
List88# '
<88' (
Models88( .
.88. /
Reserva88/ 6
>886 7
>887 8
>888 9
ListarReservasAsync88: M
(88M N
DateTime88N V
fecha88W \
,88\ ]
int88^ a
	barberoId88b k
)88k l
{99 	
using:: 
var:: 

connection::  
=::! "
connectionManager::# 4
.::4 5
GetConnectionString::5 H
(::H I
ConnectionManager::I Z
.::Z [
connectionStringKey::[ n
)::n o
;::o p
var<< 
result<< 
=<< 
await<< 

connection<< )
.<<) *

QueryAsync<<* 4
<<<4 5
Bless<<5 :
.<<: ;
Models<<; A
.<<A B
Reserva<<B I
><<I J
(<<J K
$str== ,
,==, -
param>> 
:>> 
new>> 
{>> 
Fecha>> "
=>># $
fecha>>% *
.>>* +
Date>>+ /
,>>/ 0
	BarberoId>>1 :
=>>; <
	barberoId>>= F
}>>G H
,>>H I
commandType?? 
:?? 
CommandType?? (
.??( )
StoredProcedure??) 8
)@@ 
;@@ 
returnAA 
newAA 
ResponseAA 
<AA  
ListAA  $
<AA$ %
ModelsAA% +
.AA+ ,
ReservaAA, 3
>AA3 4
>AA4 5
{BB 
ContentCC 
=CC 
resultCC  
.CC  !
ToListCC! '
(CC' (
)CC( )
,CC) *
	IsSuccessDD 
=DD 
trueDD  
,DD  !
MessageEE 
=EE 
$strEE =
}FF 
;FF 
}GG 	
}HH 
}II „
eC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess\ConnectionManager.cs
	namespace 	
Bless
 
. 

DataAccess 
{ 
public 

class 
ConnectionManager "
:# $
IConnectionManager% 7
{		 
public

 
const

 
string

 
connectionStringKey

 /
=

0 1
$str

2 <
;

< =
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
ConnectionManager  
(  !
IConfiguration! /
configuration0 =
)= >
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
IDbConnection 
GetConnectionString 0
(0 1
string1 7
key8 ;
); <
{ 	
return 
new 
SqlConnection $
($ %#
ConfigurationExtensions% <
.< =
GetConnectionString= P
(P Q
configurationQ ^
,^ _
$"` b
{b c
keyc f
}f g
"g h
)h i
)i j
;j k
} 	
} 
} ÷
[C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess\Barbero.cs
	namespace 	
Bless
 
. 

DataAccess 
{ 
public 

class 
Barbero 
: 
IBarbero #
{		 
private

 
readonly

 
IConnectionManager

 +
connectionManager

, =
;

= >
public 
Barbero 
( 
IConnectionManager )
connectionManager* ;
); <
{ 	
this 
. 
connectionManager "
=# $
connectionManager% 6
;6 7
} 	
public 
async 
Task 
< 
Models  
.  !
Response! )
<) *
List* .
<. /
Models/ 5
.5 6
Barbero6 =
>= >
>> ?
>? @
ListarBarberosAsyncA T
(T U
)U V
{ 	
using 
var 

connection  
=! "
connectionManager# 4
.4 5
GetConnectionString5 H
(H I
ConnectionManagerI Z
.Z [
connectionStringKey[ n
)n o
;o p
var 
result 
= 
await 

connection )
.) *

QueryAsync* 4
<4 5
Models5 ;
.; <
Barbero< C
>C D
(D E
$str #
,# $
commandType 
: 
CommandType (
.( )
StoredProcedure) 8
) 
; 
return 
new 
Response 
<  
List  $
<$ %
Models% +
.+ ,
Barbero, 3
>3 4
>4 5
{6 7
Content8 ?
=@ A
resultB H
.H I
ToListI O
(O P
)P Q
,Q R
	IsSuccessS \
=] ^
true_ c
,c d
Messagee l
=m n
$str	o ”
}
• –
;
– —
} 	
} 
} 