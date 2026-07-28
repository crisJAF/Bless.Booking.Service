˝
gC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess.Interfaces\IUsuario.cs
	namespace 	
Bless
 
. 

DataAccess 
. 

Interfaces %
{		 
public

 

	interface

 
IUsuario

 
{ 
public 
Task 
< 
Usuario 
> 
ObtenerUsuarioAsync 0
(0 1
string1 7
nombreUsuario8 E
)E F
;F G
public 
Task 
< 
int 
> !
RegistrarUsuarioAsync .
(. /
Usuario/ 6
usuario7 >
)> ?
;? @
} 
} ”
hC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess.Interfaces\IServicio.cs
	namespace 	
Bless
 
. 

DataAccess 
. 

Interfaces %
{		 
public

 

	interface

 
	IServicio

 
{ 
Task 
< 
Response 
< 
List 
< 
Servicio #
># $
>$ %
>% & 
ListarServiciosAsync' ;
(; <
)< =
;= >
} 
} ê

gC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess.Interfaces\IReserva.cs
	namespace 	
Bless
 
. 

DataAccess 
. 

Interfaces %
{ 
public 

	interface 
IReserva 
{ 
Task 
< 
Response 
< 
bool 
> 
> 
GuardarReservaAsync 0
(0 1
ReservaRequest1 ?
request@ G
)G H
;H I
Task 
< 
Response 
< 
List 
< 
HorarioDisponible ,
>, -
>- .
>. /*
ListarHorariosDisponiblesAsync0 N
(N O
intO R
	barberoIdS \
,\ ]
DateTime^ f
fechag l
)l m
;m n
Task		 
<		 
Response		 
<		 
List		 
<		 
Reserva		 "
>		" #
>		# $
>		$ %
ListarReservasAsync		& 9
(		9 :
DateTime		: B
fecha		C H
,		H I
int		J M
	barberoId		N W
)		W X
;		X Y
}

 
} ˙
qC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess.Interfaces\IConnectionManager.cs
	namespace 	
Bless
 
. 

DataAccess 
. 

Interfaces %
{		 
public

 

	interface

 
IConnectionManager

 '
{ 
IDbConnection 
GetConnectionString )
() *
string* 0
key1 4
)4 5
;5 6
} 
} œ
gC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.DataAccess.Interfaces\IBarbero.cs
	namespace 	
Bless
 
. 

DataAccess 
. 

Interfaces %
{		 
public

 

	interface

 
IBarbero

 
{ 
Task 
< 
Response 
< 
List 
< 
Barbero "
>" #
># $
>$ %
ListarBarberosAsync& 9
(9 :
): ;
;; <
} 
} 