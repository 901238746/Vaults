#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
// TODOS
// TODO: MAKE AST
// TODO: Implement every 599 function.
// TODO: Make README.md in c then asm.
// TODO: Make G599.
// TODO: Try to make G599 workin parralel with 599.
// TODO: Put Args into a stack.
// charure Definitions
struct registerint {
    int data;
    int ID;
};

struct opcodelister {
    char* list;
};

struct binaryOpcodeTodecimal {
    char* name;
    int decimal;
};

// Function Definitions
int findSubstring(char *txt, char *pat) {
    int n = strlen(txt);
    int m = strlen(pat);

    // Iterate through txt
    for (int i = 0; i <= n - m; i++) {
        int j;
        for (j = 0; j < m; j++) {
            if (txt[i + j] != pat[j]) {
                break;
            }
        }
        if (j == m) {
            return i;
        }
    }
    return -1;
}
char stack[];
char out[4096];
char* getfromstack(char stack[]) {
    int counter = 0;
    int counter2 = 0;
    if (findSubstring(stack, "→") == -1) { return stack; }
    while (true) {
        if (stack[counter] == *"→") {
            break;
        }
        else {counter2++;}
        counter++;
    }
    strncpy(out, stack, counter2);
    return out;
}

char* appendtostack(char stack[], char toappend[]) {
    strcat(stack, "→");
    strcat(stack, toappend);
    return stack;
}

char* removefromstack(char stack[]) {
    int index = findSubstring(stack, "→") + 3;
    if (index == 2) {return "";}
    //memmove(str, str + 6, str_len - 6 + 1);
    memmove(stack, stack + index, strlen(stack) - index + 1);
    return stack;
}

int power(int x, int y) {
    int output = 1;
    for (int i = 0; i < y; i++) {
        output *= x;
    }
    return output;
}

int bintodecimal(char inp[]) {
    long long out = 0;
    char one[] = "1";
    int counter = 1;
    size_t length = strlen(inp) - 1;
    while (length > 0) {
        if (inp[counter] == *one) {
            out = out + (power(2, length - 1));
        }
        length = length - 1;
        counter = counter + 1;
    }
    return out;
}

char* decimaltobinary(int inp) {
    char* out = malloc(1024);
    int big = 1;
    out[0] = '\0';
    while (big <= inp) {
        big *= 2;
    }
    big /= 2;
    while (big > 0) {
        if (inp >= big) { strcat(out, "1"); inp -= big; }
        else { strcat(out, "0"); }
        big /= 2;
    }
    return out;
}

char* flipbit(int bit, char binstring[]) {
    bit -= 1;
    int counter = strlen(binstring) - 1;
    int counter2 = 0;
    char one[] = "1";
    char zero[] = "0";
    char* out = malloc(64);
    while (counter2 < strlen(binstring)) {
        if (counter2 == bit) {
            if (binstring[counter2] == *one) { strcat(out, zero); }
            else { strcat(out, one); }
        }
        else {
            if (binstring[counter2] == *one) { strcat(out, one); }
            else { strcat(out, zero); }
        }
        counter -= 1;
        counter2 += 1;
    }
    return out;
}

// Parsing function
int parse() {
    int argumentsRequired[] = {0, 0, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2, 2, 0, 1, 1, 1, 1, 1, 1, 1};

    struct binaryOpcodeTodecimal operators[] = {
        {"STP", bintodecimal("000000")},
        {"NOP", bintodecimal("000001")},
        {"ADD", bintodecimal("000010")},
        {"SUB", bintodecimal("000011")},
        {"DIV", bintodecimal("000100")},
        {"MUL", bintodecimal("000101")},
        {"EQL", bintodecimal("000110")},
        {"LST", bintodecimal("000111")},
        {"GRT", bintodecimal("001000")},
        {"AND", bintodecimal("001001")},
        {"BOR", bintodecimal("001010")},
        {"NOT", bintodecimal("001011")},
        {"XOR", bintodecimal("001100")},
        {"WTM", bintodecimal("001101")},
        {"WTR", bintodecimal("001110")},
        {"LMR", bintodecimal("001111")},
        {"RDF", bintodecimal("010000")},
        {"WDF", bintodecimal("010001")},
        {"INP", bintodecimal("010010")},
        {"LDF", bintodecimal("010011")},
        {"JIF", bintodecimal("010100")},
        {"JMP", bintodecimal("010101")},
        {"RUN", bintodecimal("010110")},
        {"DMP", bintodecimal("010111")},
        {"CRT", bintodecimal("011000")},
        {"ABF", bintodecimal("011001")},
        {"GSTP", bintodecimal("000000")},
        {"GNOP", bintodecimal("000001")},
        {"GDRW", bintodecimal("000010")},
        {"GGET", bintodecimal("000011")},
        {"GDWT", bintodecimal("000100")},
        {"GLTF", bintodecimal("000101")},
        {"GFLL", bintodecimal("000110")},
        {"GGAS", bintodecimal("000111")},
        {"GWTF", bintodecimal("001000")},
        {"GRDF", bintodecimal("001001")},
        {"GWDF", bintodecimal("001010")},
        {"GWTM", bintodecimal("001011")},
        {"GWTR", bintodecimal("001100")},
        {"GLMR", bintodecimal("001101")},
        {"GDMP", bintodecimal("001110")}
    };

    // Example string for testing
    char str[] = "0000100000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000";
    char opcode[7]; // +1 for the null terminator
    char opcodelist[4096];

    strncpy(opcode, str, 6);
    opcode[6] = '\0'; // Null-terminate the first string

    printf("Opcode %s\n", opcode);

    // Parsing and printing tokens
    char *token = strtok(str, " ");
    while (token != NULL) {
        printf("%s\n", token);
        token = strtok(NULL, "-");
    }

    printf("\nCool: %d\n", bintodecimal(opcode));
    printf("\nCool 2: %s\n", decimaltobinary(bintodecimal(opcode)));

    struct registerint register1 = {0, 1};
    register1.data = 21;
    printf("\nRegister1 ID: %d", register1.ID);
    printf("\nRegister1 Data: %d", register1.data);

    bool x = true;
    int charat = 0;
    int decopcode;
    int tojump;
    char arg1[26];
    char arg2[26];
    bool y = false;
    char* args = "11121212";
    char* stacked = opcode;
    int counter = 1;
    if (argumentsRequired[bintodecimal(opcode)] > 0) {
            counter = 1;
            for (int i = charat + 6; i < charat + 31; i++) {
                int i1 = i;
                char* stri = &str[i1];
                if (counter == 1) {
                    strncpy(arg1, stri, 25);
                }
                counter++;
            }
            strcpy(args, appendtostack(args, arg1));
        }
        counter = 1;
        if (argumentsRequired[bintodecimal(opcode)] > 1) {
            counter = 1;
            for (int i = charat + 31; i < charat + 56; i++) {
                int i1 = i;
                char* stri = &str[i1];
                if (counter == 1) {
                    strncpy(arg2, stri, 25);
                }
                counter++;
            }
            strcpy(args, appendtostack(args, arg2));
        }
    strcpy(arg1, "");
    strcpy(arg2, "");
    printf("Strlen of str: %zu", strlen(str));
    strcat(opcodelist, operators[bintodecimal(opcode)].name);

    while (x) {
        decopcode = bintodecimal(opcode);
        tojump = 6 + (25 * argumentsRequired[decopcode]);
        int argumentsneeded = argumentsRequired[decopcode];
        charat += tojump;

        if (charat + 4 >= strlen(str) - 1) { x = false; break; }

        strcpy(opcode, "");
        counter = 1;
        size_t strleneth = strlen(str) - 1;
        counter = 1;
        for (int i = charat; i < charat + 6; i++) {
            int i1 = i;
            char* stri = &str[i1];
            if (counter == 1) {
                strncpy(opcode, stri, 6);
            }
            counter++;
        }

        printf("\nOpcode: %s\n", opcode);
        strcpy(stacked, appendtostack(stacked, opcode));
        printf("\nOperation: %s", operators[bintodecimal(opcode)].name);
        strcat(opcodelist, operators[bintodecimal(opcode)].name);

        if (charat + 6 >= strleneth) { x = false; }

        if (argumentsRequired[bintodecimal(opcode)] > 0) {
            counter = 1;
            for (int i = charat + 6; i < charat + 31; i++) {
                int i1 = i;
                char* stri = &str[i1];
                if (counter == 1) {
                    strncpy(arg1, stri, 25);
                }
                counter++;
            }
            strcpy(args, appendtostack(args, arg1));
        }

        if (argumentsRequired[bintodecimal(opcode)] > 1) {
            counter = 1;
            for (int i = charat + 31; i < charat + 56; i++) {
                int i1 = i;
                char* stri = &str[i1];
                if (counter == 1) {
                    strncpy(arg2, stri, 25);
                }
                counter++;
            }
            strcpy(args, appendtostack(args, arg2));
        }
    }
    strcpy(args, removefromstack(args));
    printf("\nOpcode list: %s", opcodelist);
    printf("\n\nSTACK: %s\n\n", stacked);
    printf("\nGET FROM STACK TEST: %s\n", operators[bintodecimal(getfromstack(stacked))].name);
    if (strcmp(args, stacked) == 0) {
        printf("\nPROGRAM FAILED SOME WHERE!!!!!\n");
        exit(1);
    }
    printf("ARG STACK: %s", args);
    //strcpy(stacked, removefromstack(stacked));
    //printf("\n%s\n", stacked);
    return 0;
}

int main() {
    printf("Hello\n");
    parse();
    return 0;
}
