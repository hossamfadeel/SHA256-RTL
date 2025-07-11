# SHA256-RTL
SHA256



## Software Hardware Comparison:
To compare the data from testbench you can take the hex values of the input including /n and use the following website to check the hash output.
https://emn178.github.io/online-tools/sha256.html



The Input and Output Result from SHA256 Algorithm:
![Hash](https://github.com/user-attachments/assets/13f40ade-43dc-4394-9982-63d5d8a0d1b4)


The Input to the RTL SHA256 (Only data with the valid signal):
<img width="924" height="286" alt="Screenshot from 2022-03-26 19-23-43" src="https://github.com/user-attachments/assets/95e25cf5-d962-4123-a64d-39829b1824dc" />


The Output Result of the RTL SHA256 (Only data with the valid signal):
<img width="1327" height="284" alt="Screenshot from 2022-03-26 19-27-11" src="https://github.com/user-attachments/assets/d954ea57-e916-4ec2-9a4b-e8a0ac57e390" />



## Xilinx Vivado Hardware Creation:
To create vivado project that contains the IP of SH256 please run Vivado and in the tcl consol run the following:

```source SHA256.tcl```
