// Two Dimensional Arrays
// example:
int b[2][3];
// ====================================
// Two Dimensional Array addition
main()
{
	int A[3][3], B[3][3], C[3][3], i,j;
	printf('Enter 9 numbers for first metrix');
	for (i=0; i<= 2; i++)
		for(j=0; j<= 2; j++)
			scanf("%d", &A[i][j]);
	printf('Enter 9 numbers for second metrix');
	for (i=0; i <= 2; i++)
		for (j=0; j<=2; j++)
			scanf("%d", &B[i][j]);
	// now we have 2 2D arrays, let us add theese two arrays, and save results
	// in <C> variable
	for (i=0; i<=2; i++)
	{
		for(j=0; j<=2; j++)
		{
			c[i][j] = A[i][j] + B[i][j];
			printf("%d ", c[i][j]);
		}
		printf("/n");
}
}
// ====================================
// String
// Sequence of characters terminated at null character.
// ASCII of null character is 0(zera)
	
// array of characters
char s[10] = {'a','m','i','r','\0' }; // <\0> null character, not printable, if we print it we saw space
// char ko define karny ka opar waly way bilkul ok h, magar bohot tedius h, becouse hame har char k aagy or peechy single cutation marks lagany party hen, or ha value ko qoma seperated likhna parta h, is sy aasan tareeqa ye h:

char s[10]="amir"; // is tareeqy me hame null character add karny ki zaroorat nahi h, wo automaticly khud hi end me add ho jay ga.
								
for (i=0; i<=6; i++)
	printf("%c", s[i]); // <c> fro char

// why null character??
// we know end of string by null character, supose we get input from user, and we neet
// print this input in loop, here comes null character importance, eg:
main()
{
	char s[20]; // 20 is lye k pata nahi h k user kitna long name Enter kary ga
	int i;
	for (i=0; s[i]!='\0'; i++)
		printf("%c", s[i]);
}
// Notes:
char s[10] = {'a','m','i','r','\0' };
// <s> aik array of characters h, ji me 10 chr aa sakty hen, filhal 5 values hen, or baqi
// garbage h, ab is ko print karny k 2 ways hen.
// 1-
for (i=0; s[i]!='\0'; i++)
	printf("%c", s[i]) // har char [agar wo '\0' nahi h to] print ho jay ga

// 2-
printf("%s", s) // yahan ham ny <s> print kara dya, <s> wo memory address h jahan <a>[becouse first char in our characters array is <a>] h, to is print line ka matlab h k <s> sy print karna start karo or jab tak  null character nahi aata print karty raho.
// ====================================
// puts
// onlyt for string print
// it is defferent from <printf> in:
// 1- <puts> only for strings not else
// 2- <puts> by default ending with new line character

// synax:
puts(s); 

// string input from user
main()
{
	char s[20];
	int i;
	printf("Enter your name");
	scanf("%s", s) // same as <scanf("%s", &s[0])> becouse <s> is address of first char in <s>
	puts(s)
	
}

// ====================================
// scanf vs gets
// deffrences:
// 1- scanf determine tab, Enter and space as delimiter, so if user input "amir saleem", <scanf> will picks "amir" only, and <gets> determine Enter is delimiter
// ====================================
// String related functions
strlen()	// retern length of string
strrev()	// reverse string
strlwr() 	// lower
strupr()	// upper
strcpy()	// copy, gets 2 arguments, strcpy(string_name, string)
strcmp()	// compare 2 stings, and return ASSCII Deffrence
strcat()	// concatinate, strcat(s, "student"); pehly <s> me "hello" tha ab us me "hellostudent" ho gya.
// ====================================
// Pointers
 
// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

// ====================================

