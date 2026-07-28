ª2
^C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic\Usuario.cs
	namespace

 	
Bless


 
.

 
BusinessLogic

 
{ 
public 

class 
Usuario 
: 
Bless  
.  !
BusinessLogic! .
.. /

Interfaces/ 9
.9 :
IUsuario: B
{ 
private 
readonly 
IUsuario !
_usuario" *
;* +
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
Usuario 
( 
IUsuario 
usuario  '
,' (
IConfiguration) 7
configuration8 E
)E F
{ 	
this 
. 
_usuario 
= 
usuario #
;# $
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
Response "
<" #
LoginResponse# 0
>0 1
>1 2

LoginAsync3 =
(= >
LoginRequest> J
requestK R
)R S
{ 	
var 
usuario 
= 
await 
_usuario  (
.( )
ObtenerUsuarioAsync) <
(< =
request= D
.D E
NombreUsuarioE R
)R S
;S T
if 
( 
usuario 
== 
null 
||  "
!# $
BCrypt$ *
.* +
Net+ .
.. /
BCrypt/ 5
.5 6
Verify6 <
(< =
request= D
.D E

ContrasenaE O
,O P
usuarioQ X
.X Y
ContrasenaHashY g
)g h
)h i
{ 
return 
new 
Response #
<# $
LoginResponse$ 1
>1 2
{3 4
	IsSuccess5 >
=? @
falseA F
,F G
MessageH O
=P Q
$strR m
}n o
;o p
} 
var 
token 
= 
GenerarToken $
($ %
usuario% ,
), -
;- .
return   
new   
Response   
<    
LoginResponse    -
>  - .
{!! 
	IsSuccess"" 
="" 
true""  
,""  !
Message## 
=## 
$str## *
,##* +
Content$$ 
=$$ 
new$$ 
LoginResponse$$ +
{%% 
Token&& 
=&& 
token&& !
}'' 
}(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
Response++ "
<++" #
string++# )
>++) *
>++* +
RegistrarAsync++, :
(++: ;
Models++; A
.++A B
Usuario++B I
usuario++J Q
)++Q R
{,, 	
usuario-- 
.-- 
ContrasenaHash-- "
=--# $
BCrypt--% +
.--+ ,
Net--, /
.--/ 0
BCrypt--0 6
.--6 7
HashPassword--7 C
(--C D
usuario--D K
.--K L
ContrasenaHash--L Z
)--Z [
;--[ \
var// 
restul// 
=// 
await// 
_usuario// '
.//' (!
RegistrarUsuarioAsync//( =
(//= >
usuario//> E
)//E F
;//F G
return11 
new11 
Response11 
<11  
string11  &
>11& '
{11( )
	IsSuccess11* 3
=114 5
true116 :
,11: ;
Message11< C
=11D E
$str11F i
}11j k
;11k l
}33 	
private55 
string55 
GenerarToken55 #
(55# $
Models55$ *
.55* +
Usuario55+ 2
usuario553 :
)55: ;
{66 	
var77 
key77 
=77 
new77  
SymmetricSecurityKey77 .
(77. /
Encoding77/ 7
.777 8
UTF8778 <
.77< =
GetBytes77= E
(77E F
configuration77F S
[77S T
$str77T ]
]77] ^
)77^ _
)77_ `
;77` a
var88 
credentials88 
=88 
new88 !
SigningCredentials88" 4
(884 5
key885 8
,888 9
SecurityAlgorithms88: L
.88L M

HmacSha25688M W
)88W X
;88X Y
var:: 
claims:: 
=:: 
new:: 
[:: 
]:: 
{;; 
new<< 
Claim<< 
(<< 

ClaimTypes<<  
.<<  !
Name<<! %
,<<% &
usuario<<' .
.<<. /
NombreUsuario<</ <
)<<< =
,<<= >
new== 
Claim== 
(== 

ClaimTypes==  
.==  !
Role==! %
,==% &
usuario==' .
.==. /
Rol==/ 2
??==3 5
$str==6 ?
)==? @
}>> 	
;>>	 

var@@ 
token@@ 
=@@ 
new@@ 
JwtSecurityToken@@ ,
(@@, -
issuerAA 
:AA 
configurationAA %
[AA% &
$strAA& 2
]AA2 3
,AA3 4
audienceBB 
:BB 
configurationBB '
[BB' (
$strBB( 6
]BB6 7
,BB7 8
claimsCC 
:CC 
claimsCC 
,CC 
expiresDD 
:DD 
DateTimeDD !
.DD! "
UtcNowDD" (
.DD( )
AddHoursDD) 1
(DD1 2
$numDD2 3
)DD3 4
,DD4 5
signingCredentialsEE "
:EE" #
credentialsEE$ /
)FF 
;FF 
returnHH 
newHH #
JwtSecurityTokenHandlerHH .
(HH. /
)HH/ 0
.HH0 1

WriteTokenHH1 ;
(HH; <
tokenHH< A
)HHA B
;HHB C
}II 	
}JJ 
}KK €
_C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic\Servicio.cs
	namespace		 	
Bless		
 
.		 
BusinessLogic		 
{

 
public 

class 
Servicio 
: 
	IServicio %
{ 
private 
readonly 
Bless 
. 

DataAccess )
.) *

Interfaces* 4
.4 5
	IServicio5 >
servicio? G
;G H
public 
Servicio 
( 
Bless 
. 

DataAccess (
.( )

Interfaces) 3
.3 4
	IServicio4 =
servicio> F
)F G
{ 	
this 
. 
servicio 
= 
servicio $
;$ %
} 	
public 
async 
Task 
< 
Response "
<" #
List# '
<' (
Models( .
.. /
Servicio/ 7
>7 8
>8 9
>9 : 
ListarServiciosAsync; O
(O P
)P Q
{ 	
return 
await 
servicio !
.! " 
ListarServiciosAsync" 6
(6 7
)7 8
;8 9
} 	
} 
} ’
^C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic\Reserva.cs
	namespace 	
Bless
 
. 
BusinessLogic 
{ 
public 

class 
Reserva 
: 
IReserva #
{ 
private 
readonly 

DataAccess #
.# $

Interfaces$ .
.. /
IReserva/ 7
?7 8
_reserva9 A
;A B
public

 
Reserva

 
(

 

DataAccess

 !
.

! "

Interfaces

" ,
.

, -
IReserva

- 5
reserva

6 =
)

= >
{ 	
_reserva 
= 
reserva 
; 
} 	
public 
async 
Task 
< 
Response "
<" #
bool# '
>' (
>( )
GuardarReservaAsync* =
(= >
ReservaRequest> L
requestM T
)T U
{ 	
return 
await 
_reserva !
.! "
GuardarReservaAsync" 5
(5 6
request6 =
)= >
;> ?
} 	
public 
async 
Task 
< 
Response "
<" #
List# '
<' (
HorarioDisponible( 9
>9 :
>: ;
>; <*
ListarHorariosDisponiblesAsync= [
([ \
int\ _
	barberoId` i
,i j
DateTimek s
fechat y
)y z
{ 	
return 
await 
_reserva !
.! "*
ListarHorariosDisponiblesAsync" @
(@ A
	barberoIdA J
,J K
fechaL Q
)Q R
;R S
} 	
public 
async 
Task 
< 
Response "
<" #
List# '
<' (
Models( .
.. /
Reserva/ 6
>6 7
>7 8
>8 9
ListarReservasAsync: M
(M N
DateTimeN V
fechaW \
,\ ]
int^ a
	barberoIdb k
)k l
{ 	
return 
await 
_reserva !
.! "
ListarReservasAsync" 5
(5 6
fecha6 ;
,; <
	barberoId= F
)F G
;G H
} 	
} 
} Ö
fC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic\NotificacionHub.cs
	namespace 	
Bless
 
. 
BusinessLogic 
{		 
public

 

class

 
NotificacionHub

  
:

! "
Hub

# &
{ 
} 
} Í	
jC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic\NotificacionService.cs
	namespace 	
Bless
 
. 
BusinessLogic 
{		 
public

 

class

 
NotificacionService

 $
{ 
private 
readonly 
IHubContext $
<$ %
NotificacionHub% 4
>4 5
_hubContext6 A
;A B
public 
NotificacionService "
(" #
IHubContext# .
<. /
NotificacionHub/ >
>> ?

hubContext@ J
)J K
{ 	
_hubContext 
= 

hubContext $
;$ %
} 	
public 
async 
Task #
EnviarNotificacionAsync 1
(1 2
string2 8
mensaje9 @
)@ A
{ 	
await 
_hubContext 
. 
Clients %
.% &
All& )
.) *
	SendAsync* 3
(3 4
$str4 I
,I J
mensajeK R
)R S
;S T
} 	
} 
} ±

^C:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic\Barbero.cs
	namespace 	
Bless
 
. 
BusinessLogic 
{ 
public 

class 
Barbero 
: 
IBarbero #
{ 
private 
readonly 

DataAccess #
.# $

Interfaces$ .
.. /
IBarbero/ 7
_barbero8 @
;@ A
public		 
Barbero		 
(		 

DataAccess		 !
.		! "

Interfaces		" ,
.		, -
IBarbero		- 5
barbero		6 =
)		= >
{

 	
this 
. 
_barbero 
= 
barbero #
;# $
} 	
public 
async 
Task 
< 
Response "
<" #
List# '
<' (
Models( .
.. /
Barbero/ 6
>6 7
>7 8
>8 9
ListarBarberosAsync: M
(M N
)N O
{ 	
return 
await 
_barbero !
.! "
ListarBarberosAsync" 5
(5 6
)6 7
;7 8
} 	
} 
} 