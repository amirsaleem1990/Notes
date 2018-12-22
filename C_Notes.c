#include <stdio.h>
gcc p1.c -o p
./p

----------------------------------------------
// if else
if (condition)
{statement};
else
{statement};

// if you have only one statement in if body then you can skip {}, same for else, so first statement after condition will considered as a statment ot that if or else
if (condition)
	statement;
else
	statement;
----------------------------------------------
// conditional operator (? : ) also called a Ternary operator, because it need 3 operands to do his work
// syntax: Condition ? statement1 : statement2
main()
{
	int x;
	clrscr();
	printf("Enter a number");
	scanf("%d ", &x);
	print("Your number is %s", x > 0 ? "Positive" : "Nagative");
	x > 0 ? printf("Positive") : printf("Nagative");
	getch();
}
----------------------------------------------
// conditional operator also used in selective assignments,
x = a > b ? a : b 
// agar a > b to <x> me <a> daal do, else: <x> me <b> daal do
----------------------------------------------
// for loop
// syntax
// for loop ke parentheses me 3 argument compelsery hoty hen
// is ki execution u hoti he k pehly 1st argument chalta h, phir doosra, phir 3rd ko execute kary bager 
// he loop ki body execute hoti h, phir agli dafa pehly 3rd argument execute hota h, phir 2cnd,
// or phir loop ki body execute hoti h.
// Note: 1rst argument sab sy pehly or poory process me 1 hi dafa execute ho ga. 
main()
{
	int = i
	for (i=1; i<5; i++)
		{print('blablabla')}
}

----------------------------------------------
// NOTE: while and if else wagera ki conditions k bad <;> nahi lagayen gy warna error aay ga..

// wrong:
if (9 < 0);
{printf('blablabla')}

// ok
if (9 < 0)
{printf('blablabla')}
----------------------------------------------
break
// The keyword <break> can be used 	in loop body on in switch body.
----------------------------------------------
switch
// syntax
// nested if else sy bachny k lye switch use hota h, <expression> ka result jo ho ga, wo agar ksi
// constant sy mathc karta h to direct us constatnt ka code or us k baad waly sary constants k condes chal 
// jay ga, or agar ksi bhi constant sy <expression> match nahi ho rahi to <default> ka code chal jay ga,

switch(expression) // ye expression evalvate ho ka tru ya ya false nahi ho gi balky int ya char value ho gi 
{
	case constant1: code1;
	case constant2: code2;
	case constant3: code3;
	case constant4: code4;
	case constant5: code5;
	default: code6;
}
// Notes: 
// 1- har constant unique hona chahye.
// 2- constant srif int ye char ho sakty hen, real nahi ho sakty
// 3- code multiple lines k bhi ho sakty hen
// 4- agar ham srif wohi code chalana chahty hen jo <expression> sy match ho to har code k baad <break> 
// likhna ho ga.. 
// 5- <default> ko body me kahi bhi define kar sakty hen
// 6- har constant koi value hi ho gi, koi variable ya expression nahi use kar sakty
// 7- <expression> me aap variable ya constant dono use kar sakty hen

----------------------------------------------
function
// syntax
return_type function_name()
{
	function_Body
}

// example:
int add(a,b)
{return (a+b)}

char pr()
{return("hello")}
----------------------------------------------
main()
// main() Ko kahin bhi defina kar den code me is sy koi farq nahi parta, code me pehly mane() hi execute
// ho ga
----------------------------------------------
void
// agar function kuch return nahi kar raha to function define karty hwy us k names sy pehly <void> likhen gy
void a()
{printf("blablabla")}
----------------------------------------------
// function declearation
// example
#include <stdio.h>
main()
{
	void add(void); // 1st <void> ka matlab h k func koi value return nahi kar raha, or 2cnd ka ye k 
					// func koi arguments nahi ly raha	
	add();
}
void add()
{
	int a,b,c;
	printf("Enter 2 numbers");
	scanf("%d%d", &a, &b);
	c = a+b;
	printf("Total %d", c);
}

----------------------------------------------
// function with arguments
main()
{
	int a,b;
	printf("Enter 2 numbers");
	scanf("%d%d", &a, &b);
	void add(int, int)
	add(a, b)
}
add(int c, int d)
{
	printf("Total %d", c + d)
}
----------------------------------------------
return
parentheses
// Notes:
// 1- if <return> contain value, or variable then we can remove parentheses, eg: <return b>, or <return 8>
// 2- if <return> contain expression then we have to use parentheses, eg: <return(9*7)> 
// 3- <return> return only one value, if we include more than one value in our <reuturn> statemnt then 
// we get last value in the parentheses, eg: we got <f> when we write <return(a,b,c,f)>

----------------------------------------------
function calling itself / also called Recurtion
int fun(int);
main()
{
	int k=5;
	k = fun(k);
	printf("%d", k);
}
fun(a)
{
	int s;
	if (a == 1)
		return (a);
	s = a + fun(a-1);
	return (s);
}
// Note: all problems solved with Recurtion can be solved with loops, but no vice versa
----------------------------------------------
// Array
// Arry is a linear collection of similar elements
// <linear> ka matlab k wo memory me 1 hi jaga par hoty hen
// syntax
main()
{
	int a[10];
}
// array <a> has type <int> and it is contain 10 elemts.
// int a[] is Error, because compilter don't know how many elements in
// the array, we must define length of an array
// define an arry with values:
int a[5]={9,6,8,0,2};
// if we don't give the value <5> in <a[5]> and type:
int a[]={9,6,8,0,2};
// no problum, but this is when we put the values in array when the creating 
// and assining the values in the same time.

// we can not assign values more than array expect, so: 
int a[5] = {1,2,3,4,5,6} // Error

// but we can assign less then array expect, so:
int a[5] = {1,2} // Ok, in this case all indexes we don't assign a value contain <0>

int a[5];
a[0] = 9
// whats is in other 4 elements?? <0>?? no... <0> srif us waqt jata h jab ham 
// declear karty waqt kuch values assign karen gy to baqio me <0> jay ga,
// or yahn declaer ho gya, or usi time koi value assign nahi ki to sab 
// me garbage chala gya, <a[0]=9> sy first element me <9> chala gya or baqi
// me garbage hi h,, <0> nahi h, q k declearation k waqt assing nahi hwa kuch



// example:
// get 10 values from user and average it.
main()
{
	int a[10], i, sum = 0;
	float  avg;
	printf("Enter 10 numbers");
	for(i=0; i<=9; i++)
		scanf("%d", &a[i]);
	for(i=0; i<=9; i++)
		sum = sum +  a[i];
	avg = sum / 10.0;
	printf("%f", avg);
}
----------------------------------------------
// Two dimentional Arrays 
----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------
// address operator

// & is address operator
// it is an unary operator
// operand must be the variable name
// & operator gives address number of variable
// & is also known as referecing operator
printf("%d", &variable_name);
// the address will lay between 0 and 65535, if we use "%d" to print this value we can get between -32768 to 32767, by using "%u" we get values between 0 and 65535
----------------------------------------------
// indirection operator

// * is indirection operator
// it is also known as dereferensing operator
// it is an unarty operator
// it takes address as an argument
// * returns the content / container whose address is its argument
printf("%d", *&x);
// the address will lay between 0 and 65535, if we use "%d" to print this value we can get between -32768 to 32767, by using "%u" we get values between 0 and 65535
----------------------------------------------
point:
int x=5;
printf("%d %u", &x) // let us assume it is return 2048
&x = 7;
// Error, we can't assing <7> to 2048, becouse 2048 is constant, and we could'nt assign value to constant 
----------------------------------------------
// Pointers
// variable contain address of another variable address
// Pointers always consumes 2 bytes in memory
// syntax:
int x=5, *j;
j = &x;
// here we assing address of <x> in <j>, so <j> is pointer contain <x> address, if <&x> == 2000 <j> cointain this <int> value

// define pointer for <int>
int *j;
// define pointer for <float>
float *j;
// define pointer for <char>
char *j;
// Note: pointer and his variable must be same type, so we can't assig int variable address to float pointer, yce bohot aham baat h k agar mujhy int variable ka pointer banana h to me us pointer ko assign karty waqt us ki value int hi define karun ga.
--------------------------------------------
// Note:
// <*> and <&> cancel each other so <*&j> == <j>
// whenever you see formal arguments are pointer variables the fuction call contain addresses not a variables
----------------------------------------------
// Extended concept of Pointers
// we can assign pointer to another pointer, but jis level ka pointer ho ga us ko define karty waqt us sy pehly utni hi histaric lagayen gy, eg:

main()
{
	int x, *p, **q, ***r;
	x = 5;
	p = &x; // Level1 pointer, becouse it have one *, <p> me srif us variable ka address aa sakta h jo khud pointer na ho, not else.
	q = &p; // Level2 pointer, becouse it have Two *, <q> srif pointer of pointer ban sakta h, not else.
	r = &q; // Level3 pointer, becouse it have three *, <r> srif pointer of pointer of pointer ban sakta h, not else.  

	// we need to assign value in x<int> by using <q><level 2> pointer;
	**q = 7; // here first we evelvate <*q> which is <p> and than <*p> which is <x>.

	// we need to assign value in x<int> by using <r><level 3> pointer;
	***r = 7; // here first we evelvate <*r> which is <q>, than <*q> which is <*p>, than <*p> which is <x>

}

----------------------------------------------
// Pointer's Arithmetic
// 1- We cannot add, multiply or devide two addresses.
// 2- we cannot multiply an integer to an adress and similarly we cannot devide an address with an interget value.
// 3- we can add or subtract to/from an adress

// assume <&x> is 1000 and x in integer, and <y> is pointer of <x>, if we need add number to this address, and type:
y+1 // we get 1002, becouse the next block of <x> starts with 1002, since <x> is an int, and int consume 2 bytes, if <x> is float, and we try:
y+1 // we get 1004, becouse the next block of <x> starts with 1024, since <x> in a float.

// addition formula:
Pointer+n = Pointer+sizeof(type of pointer)*n

// examples:
// we assume address in each example is 1000
int i=5, *ii;
float f=5.8, *ff;
char c='u', **c;

ii+3 = 1006 // <int> counsume 2 bytes
ff+3 = 1012 // <float> counsume 4 bytes
cc+3 = 1003 // <char counsume 1 byte

// subtraction int pointers same as addition
----------------------------------------------
// we can subtract 2 pointers if those pointers have same type.
// example:
int i=5, z=4, *ii, *zz, a;
ii = &i;
zz = &z;
// we assume: <i> address is 1000, and <z> address is 1020

// now we need subtract these pointers, we can do it, becouse these pointers have same type <int>, so:
a = zz - ii;
// we get <10> becouse 1020-1000=20 and these pointers are int, and int consume 2 bytes so we devide our Anser <20> by <2> and get final Answer <10>, this Answer tell us how many blocks we have can contain <int> value

// formula
Pointer1 - Pointer2 = Literal subtraction / sizeof(type of pointer)
----------------------------------------------
// swap values using function and pointers
// remember we can't return +1 values from function
void swap(int*, int*);
main()
{
	int a,b;
	printf("Enter two numbers");
	scanf("%d%d", &a, &b);
	swap(a,b);
	printf("a=%d b=%d",a,b);
}
void swap(int x, int y)
{
	int t;
	t = x;
	x = y;
	y = t;
}
// obeve we created a fucntion and successfuly swaped the values, but we need this values as a <a> and <b> to print theese values swaped, but remember functions in C cannot return more than one value, here comes pointers in actions, so:
void swap(int*, int*);
main()
{
	int a,b;
	printf("Enter two numbers");
	scanf("%d%d", &a, &b);
	swap(&a,&b);
	printf("a=%d b=%d",a,b);
}
void swap(int *x, int *y)
{
	int t;
	t = *x;
	*x = *y;
	*y = t;
}
// in second function we swaped these addresses, same as <scanf> function, we use like:
// <scanf("%d%d", &d, &f)> yahan ham address dy rahy hen bajay variable name k, q k agar variable names dy bhi jaen to wo return ho kar <d> or <f> me kesy assign ho saken gy?? isi lye ham scanf ko address dety hen or vo us address me ja kar us me user input assign kar deta h  
----------------------------------------------
// string
string k functions me ham zyada tar address hi paas kar rahy hoty hen, eg: 
c har s[4]="amir"
printf(s) // <s> here address of first block (which is here char] in "amir". suppose address of "a" in "amir" is 1000, so whenever you type <s> its treated as 1000, <printf(s)> == <printf(&s[0])>
----------------------------------------------
// Structure
// Structure is way to group variables
// Structure is a collection of dissimilar elements
// Defining strucure means creating new data type
// kahin bhi create kya ja sakta h, or is ka access bhi wahi tak ho ga jahan define kya gya h

// syntax
struct your_datatype_name
{
	// member variable declarations
};


// create a variable of user defined type:
// 1- :
struct your_datatype_name
{};
struct your_datatype_name variable_name;

// 2-:
struct your_datatype_name
{}variable1,variable2,variable3;

// example:
struct date
{
	int d,y;
	char m[12];
}
void main()
{
	struct date today, d1, d2; // <today> and <d1>  and <d2> all are variables of type <date>
	today.d = 17;
	today.m = "Decembter";
	today.y = 2018;
	prinf("today:\n%d%s%d\n", &today.d, &today.m, &today.y);

	d1 = today;
	printf("d1\n%d%s%d\n",&d1.d, &d1.m, d1.y);

	printf("Enter today's date");
	scanf("%d%s%d", &d2.d, d2.m, d2.y);
	printf("\nd2%d%s%d", &d2.d, &d2.m, &d2.y);

}
----------------------------------------------
// SMA: Static Memory Allocation
	// eg: int a; // compile time par hi decide ho gya h k <a> variable ki type <int> ho gi, or us ko kitni memory mily gi, or un ka kuch name bhi decide ho jata h.
	// declaration statemnt k zarye jab bhi variable bany ga wo SMA ka example ho ga.
// DMA: Dynamic Memory Allocation
	// eg:
	// complie time par srif memory size define hota h or us memory block ka address ksi pointer me store kar lety hen, phir us address k zarye is block ko use karty hen.
	// is k lye 1 function use hota h <malloc>, ye function 1 argument lete h <block size eg:2>, us size ka block bana kar us ka address return kar deta h, or ham us address ko ksi pointer me save kar lety hen.
	// masla:
	// ab masla ye h k hame pata h k variable or us ka pointer to 1 hi type ka hona chahye, jab k <malloc> ki return type <void> hoti h, is k lye ham u karty hen:
	main()
	{
		float *p;
		p = (float*)malloc(4);
		*p = 3.4
	}
	// opar waly block me p pointer h, jis ki type <float> h, or ye <malloc> waly 4 bytes k block ka address store kar raha h, yehan ham ny <malloc> sy pehly <(float*)> likha h, or us ki wajah ye h k pehly <malloc(4)> execute ho ga, or 1 4 bytes ka block ban jay ga jis ki type <void> ho gi, ab hame is ka address float pointer me save karna h, jo k mumking nahi, q k pointer or us ka variable ki type same honi chahye to ham is <void> type sy pehly (float*) likh rahy hen taky ye <void> float me convert ho jay, or phir is float block ka code <p> pointer me store ho jay 	 
----------------------------------------------
// malloc() vs calloc()
malloc() // malloc(4)
calloc() // calloc(5,2)
// <malloc> 1 variable banata h or <calloc> array banata h.
// <malloc> me garbage  value hoti h, or <calloc> me me by default 0 hotay hen.
----------------------------------------------
// realloc
// <malloc> ya <calloc> ky zarye sy bany hwy block ko resize karny k lye use hota h
// eg:
main()
{
	float *ptr;
	double *q;
	ptr = (float*)malloc(4);
	// ab mujhy is 4 bytes k memory block ka size 8 bytes karna h
	q = realloc(ptr, 8);
}
----------------------------------------------
// free
// <malloc> or <calloc> k zarye sy bany hwy variable jis function me define hoty hen, us function k khatam hony k baad bhi <malloc> or <calloc> waly variable distroy nahi hoty, ye srif program k end hony par khatam hoty hen, in DMA variables ki memory relieze karny k lye <free> use hota h.
// syntax:
evelvation
free(pointer_of_malloc_or_calloc_variable);
----------------------------------------------
// union
// union same as structure
// union low lovel par use hota h, or structure hight level par. 
// sab sy bara jo variable ho ga utni hi memory mily gi.
----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------

----------------------------------------------








