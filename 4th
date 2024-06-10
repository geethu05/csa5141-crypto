#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Function to perform polyalphabetic substitution encryption
void encrypt(char *plaintext, char *key) {
    int i, j;
    char ciphertext[100];
    
    for(i = 0, j = 0; plaintext[i] != '\0'; ++i) {
        // Check if the character is alphabetic
        if(isalpha(plaintext[i])) {
            // Determine the shift value based on the corresponding character in the key
            int shift = tolower(key[j % strlen(key)]) - 'a';
            
            // Encrypt the character using Caesar cipher with the determined shift value
            if(islower(plaintext[i])) {
                ciphertext[i] = 'a' + (plaintext[i] - 'a' + shift) % 26;
            }
            else if(isupper(plaintext[i])) {
                ciphertext[i] = 'A' + (plaintext[i] - 'A' + shift) % 26;
            }
            
            // Move to the next character in the key
            ++j;
        }
        else {
            // Non-alphabetic characters remain unchanged
            ciphertext[i] = plaintext[i];
        }
    }
    
    ciphertext[i] = '\0';
    
    printf("Encrypted message: %s\n", ciphertext);
}

int main() {
    char plaintext[100];
    char key[100];
    
    printf("Enter the plaintext: ");
    fgets(plaintext, sizeof(plaintext), stdin);
    
    printf("Enter the key: ");
    fgets(key, sizeof(key), stdin);
    
    encrypt(plaintext, key);
    
    return 0;
}
