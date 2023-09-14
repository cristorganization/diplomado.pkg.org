#include "diplomado_lib.h"
#include <stdio.h>

int main() {
	return printf(APP_NAME " %d\n", diplomado_public_call(1,2));
}
