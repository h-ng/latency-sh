# latency-sh
A basic latency finding bash script, highly customisable, and easily integratable, For sake of mind, each section is commented on what it does. Can be scaled, To run change the following variables;
1. nameserver{1,2,3,4} - These should be 4 working & functioning nameserver's
2. port{1,2,3,4} - This should be the 4 port's that the above corospond to, e.g nameserver1 = port1 and so on.
3. testdomain - This should be a domain with an assigned IPv4 address
4. testip - This should be the ONLY ip that the domain above points to, or just leave it

It requires dig & wget to run and perform tests.
