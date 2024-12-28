#include <stdio.h>
#include <string.h>
#include <ctype.h>

struct registerintdataintid {    int data;    int ID;};struct registerchardataintid {    int data;    int ID;};struct registerchardatacharid {    int data;    int ID;};struct registercharidintdata {    int data;    int ID;};struct registerintdataintid register1 = {0, 1};struct registerintdataintid register2 = {0, 1};struct registerintdataintid register3 = {0, 1};struct registerintdataintid register4 = {0, 1};struct registerchardataintid register5 = {0, 1};struct registerchardataintid register6 = {0, 1};struct registerchardataintid register7 = {0, 1};struct registerchardataintid register8 = {0, 1};struct registerchardatacharid register9 = {0, 1};struct registerchardatacharid register10 = {0, 1};struct registerchardatacharid register11 = {0, 1};struct registerchardatacharid register12 = {0, 1};struct registercharidintdata register13 = {0, 1};struct registercharidintdata register14 = {0, 1};struct registercharidintdata register15 = {0, 1};struct registercharidintdata register16 = {0, 1};
/*register1.data = 21;
printf("\nRegister1 ID: %d", register1.ID);
printf("\nRegister1 Data: %d", register1.data);*/

// Function to convert binary string to decimal
int bintodecimal(char inp[]) {
    int out = 0;
    int length = strlen(inp);
    
    for (int i = 0; i < length; i++) {
        if (inp[i] == '1') {
            out += power(2, length - i - 1);
        }
    }
    return out;
}

// Function to convert decimal to binary string
char* decimaltobinary(int inp) {
    char* out = malloc(33);  // Enough for 32-bit binary number
    if (!out) return NULL;

    int index = 0;
    if (inp == 0) {
        out[index++] = '0';
    } else {
        while (inp > 0) {
            out[index++] = (inp % 2) ? '1' : '0';
            inp /= 2;
        }
    }
    out[index] = '\0';
    
    // Reverse the string to match correct binary order
    for (int i = 0, j = index - 1; i < j; i++, j--) {
        char temp = out[i];
        out[i] = out[j];
        out[j] = temp;
    }

    return out;
}

// Function to flip a specific bit in a binary string
char* flipbit(int bit, char binstring[]) {
    int length = strlen(binstring);
    if (bit < 1 || bit > length) {
        return NULL;  // Invalid bit position
    }

    char* out = malloc(length + 1);
    if (!out) return NULL;

    strcpy(out, binstring);  // Copy the original string to out
    out[bit - 1] = (out[bit - 1] == '1') ? '0' : '1';  // Flip the bit

    return out;
}
/*Listify
def Listify(In):
	out = []
	for i in str(In):
		out.append(str(i))
	return out
*/
void printLetterList(char letter) {
    // Make sure the letter is uppercase for simplicity
    letter = toupper(letter);
    
    // If it's a letter, print a list of letters starting from it
    if (letter >= 'A' && letter <= 'Z') {
        printf("[");
        for (char i = letter; i <= 'Z'; ++i) {
            printf("'%c'", i);
            if (i != 'Z') {
                printf(", ");
            }
        }
        printf("]\n");
    } else {
        printf("[Invalid Letter]\n");
    }
}

char getFirstLetter(char letter) {
    // Convert the letter to uppercase for consistency
    letter = toupper(letter);

    // Return the letter itself (since we are considering the first letter in the list)
    if (letter >= 'A' && letter <= 'Z') {
        return letter;
    }
    return '\0'; // Invalid letter if not in A-Z
}

void processString(char* str) {
    char firstLetters[100]; // Array to hold the first letters
    int index = 0;

    while (*str) {
        if (isalpha(*str)) {
            printLetterList(*str);
            firstLetters[index++] = getFirstLetter(*str);
        }
        str++;
    }

    // Print the list of first letters
    printf("List of first letters: [");
    for (int i = 0; i < index; i++) {
        printf("'%c'", firstLetters[i]);
        if (i != index - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}
void Listify(char* input) {
    printf("Processing string: %s\n", input);
    processString(input);
}


char* Delistify(const char* listed) {
    char* unlisted = malloc(sizeof(listed));
    for (int i = sizeof(listed); i > 0; i--) {
        strcat(unlisted, listed[i]);
    }
    return unlisted;
}