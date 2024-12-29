#include <stdio.h>
#include <ctype.h>


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

int main() {
    char input[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; // Example string
    printf("Processing string: %s\n", input);
    processString(input);
    return 0;
}
