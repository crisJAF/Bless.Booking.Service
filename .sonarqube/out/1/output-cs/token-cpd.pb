ä
jC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic.Interfaces\IUsuario.cs
	namespace 	
Bless
 
. 
BusinessLogic 
. 

Interfaces (
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
< 
Response 
< 
LoginResponse *
>* +
>+ ,

LoginAsync- 7
(7 8
LoginRequest8 D
requestE L
)L M
;M N
public 
Task 
< 
Response 
< 
string #
># $
>$ %
RegistrarAsync& 4
(4 5
Usuario5 <
usuario= D
)D E
;E F
} 
} Ù
kC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic.Interfaces\IServicio.cs
	namespace 	
Bless
 
. 
BusinessLogic 
. 

Interfaces (
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
} –

jC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic.Interfaces\IReserva.cs
	namespace 	
Bless
 
. 
BusinessLogic 
. 

Interfaces (
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
} Õ
jC:\Users\Cristopher Avendano\source\repos\Bless.Booking.Service\Bless.BusinessLogic.Interfaces\IBarbero.cs
	namespace 	
Bless
 
. 
BusinessLogic 
. 

Interfaces (
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