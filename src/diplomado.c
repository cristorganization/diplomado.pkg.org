#include "diplomado_lib.h"
#include "stdlib.h"
#include <stdio.h>

int main() {
	int *a=malloc(sizeof(int));
	return printf(APP_NAME " %d\n", diplomado_public_call(1,2));
}
