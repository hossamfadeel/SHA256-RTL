# SHA256-RTL
SHA256



## Software Hardware Comparison:
To compare the data from testbench you can take the hex values of the input including /n and use the following website to check the hash output.
https://emn178.github.io/online-tools/sha256.html



The Input and Output Result from SHA256 Algorithm:


The Input to the RTL SHA256 (Only data with the valid signal):


The Output Result of the RTL SHA256 (Only data with the valid signal):



## Xilinx Vivado Hardware Creation:
To create vivado project that contains the IP of SH256 please run Vivado and in the tcl consol run the following:

```source SHA256.tcl```
