#include <stdio.h>
#include <conio.h>
#include <cuda_runtime.h>

int main(int argc, char** argv[])
{
	int num_devices = 0;
	cudaDeviceProp mydevice;

	cudaError_t err = cudaGetDeviceCount(&num_devices);
	if(err != cudaSuccess)	printf("%sn", cudaGetErrorString(err));

	printf("Cuda devices: %d\n\n", num_devices);

	for(int i=0; i<num_devices; i++)
	{
		err = cudaGetDeviceProperties(&mydevice, 0);
		if(err != cudaSuccess) printf("%sn", cudaGetErrorString(err));
		
		printf("  Cuda device %d: %s\n", i, mydevice.name);
		printf("  Multiprocessors: %d\n", mydevice.multiProcessorCount);
		printf("  Device Clock: %d KHz\n", mydevice.clockRate);
		printf("  Memory Clock Rate (KHz): %d\n", mydevice.memoryClockRate);
		printf("  Peak Memory Bandwidth (GB/s): %f\n",
           2.0*mydevice.memoryClockRate*(mydevice.memoryBusWidth/8)/1.0e6);
	}

	getchar();
	return 0;
}