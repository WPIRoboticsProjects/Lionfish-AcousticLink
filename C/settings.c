#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <float.h>
#include <string.h>

int freq, sample_rate, bit_rate;
char fName[] = "settings.csv";

int main()
{
    FILE *fp;
    fp = fopen(fName, "r");
    if (fp == NULL)
    {
        printf("%s file doesn't exist", fName);
        fclose(fp);
        return -1; //fail
    }

    fscanf(fp, "Frequency,%d\n", &freq);
    fscanf(fp, "Sample Rate,%d\n", &sample_rate);
    fscanf(fp, "Bit Rate,%d\n", &bit_rate);

    fclose(fp);
    printf("freq: %d\ns/r: %d\nb/r: %d\n", freq, sample_rate, bit_rate);
    return 0; //success
}