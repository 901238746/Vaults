#include <stdbool.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

// TODO LIST
// TODO: Make it read entire file.
// TODO: Parse entire vault files.
char* version = "0.0.1";
typedef struct {
	uint32_t folder_ID;
	uint16_t namelength;
	char* name;
	uint8_t nesting_amount;
	uint32_t folders;
	uint16_t files_in_it;
	uint64_t file_IDs;
} Folder;
typedef struct {
	uint64_t file_ID;
	uint16_t namelength;
	char* name;
	uint8_t nesting_amount;
	uint32_t folders;
	uint64_t file_size;
} File;
typedef struct {
	char file_check;
	uint32_t folder_amount;
	Folder folders;
	uint64_t file_amount;
	File files;
} Vault;
char* inttobin(uint64_t inp) {
	uint64_t x = 1;
	while (x < inp && x != 0) {
		x *= 2;
	}
	if (x == 0) {
		return "10000000000000000000000000000000000000000000000000000000000000000";
	}
	char* out = (char*)malloc(65);
	if (!out) {
		return NULL;
	}
	out[0] = '\0';

	while (x >= 1) {
		if (inp >= x) {
			inp -= x;
			strcat(out, "1");
		}
		else {
			strcat(out, "0");
		}
		x /= 2;
	}

	return out;
}

uint8_t read_byte_from_file(const char* filename, long position) {
	FILE* file = fopen(filename, "rb");
	if (!file) {
		perror("Error opening file");  
		return 0;
	}

	if (fseek(file, position, SEEK_SET) != 0) {
		perror("Error seeking file");
		fclose(file);
		return 0;
	}

	uint8_t byte;
	if (fread(&byte, 1, 1, file) != 1) {
		perror("Error reading file");
		fclose(file);
		return 0;
	}

	fclose(file); 
	return byte;
}

int main() {
	printf("  /$$$$$$                                  /$$                        \n /$$__  $$                                | $$                        \n| $$  \\__/  /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ \n| $$       /$$__  $$| $$  | $$ /$$__  $$|_  $$_/   /$$__  $$ /$$__  $$\n| $$      | $$  \\__/| $$  | $$| $$  \\ $$  | $$    | $$$$$$$$| $$  \\__/\n| $$    $$| $$      | $$  | $$| $$  | $$  | $$ /$$| $$_____/| $$      \n|  $$$$$$/| $$      |  $$$$$$$| $$$$$$$/  |  $$$$/|  $$$$$$$| $$      \n \\______/ |__/       \\____  $$| $$____/    \\___/   \\_______/|__/      \n                     /$$  | $$| $$                                    \n                    |  $$$$$$/| $$                                    \n                     \\______/ |__/                                    \n");
	printf("Version: %s\n", version);
	printf("%s\n", inttobin(8));
	printf("%u\n", read_byte_from_file("silly.txt", 3));
	return 0;
	
}
