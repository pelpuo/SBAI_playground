#include <stdio.h>
#include <stdlib.h>

int main(){
    int elem = 3;
    
    if(elem > 0){
        int q = elem;
        while(q>0){
            printf("%d",elem);
            q--;    
        }
    }else if(elem == 0){
        printf("elem is%d\n", elem);
    }else{
        int q = elem *-1;
        while(q>0){
            printf("%d",elem);
            q--;    
        }
    }

    printf("\nComplete\n");
}