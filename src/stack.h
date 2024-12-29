#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
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
char stack[1024];
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
char temp1[4096];
char temp2[4096];
char* removeIfromstack(char stack[], int I) {
    strcpy(temp1, "");
    for (int i = I; i > 0; i--) {
        int index = findSubstring(stack, "→");
        strncpy(temp1, stack, index);
        memmove(stack, stack + index, strlen(stack) - index + 1);
    }
    int index = findSubstring(stack, "→");
    memmove(stack, stack + index, strlen(stack) - index + 1);
    strcat(temp1, stack);
    return temp1;
}