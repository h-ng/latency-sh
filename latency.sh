#!/bin/bash
# HNG NETWORKS Development Group

# Speed bump 1 Check for dig
if ! command -v dig &> /dev/null
then
     while true; do
      read -p "Do you wish to install the dig program to continue? Y or N " yn
      case $yn in
        [Yy]* ) sudo apt-get install dnsutils; echo "Please restart this program"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
      esac
     done
    exit
  fi

# Declare Variables
# IF YOU want to only add 2 nameservers, keep our other 2, you need 4 servers

nameserver1="ns1.hn.fyi";
nameserver2="ns2.hn.fyi";
nameserver3="ns3.hn.fyi";
nameserver4="ns4.hn.fyi";

port1="53";
port2="53";
port3="53";
port4="53";

# Declare testing variables

testdomain="hn.fyi";
testip="195.154.106.113"; # This should be the ONLY ip the domain above points to

# End of Declare testing variables
# End of Declare Variables
# Find Variables
# Test for nameserver1

echo ""
echo "--------------------------------"
echo "---- BEGIN SPEEDBUMP SECTION ---"
echo "--------------------------------"
echo ""

echo "You have DIG (Dnsutils) installed speedbump 1 passed"

if [[ $nameserver1 = *[!\ ]* ]]; then
  echo "The variable nameserver1 ($nameserver1) has passed speedbump 2.1"
else
  echo "Please enter a value into nameserver1 (Failed speedbump 2.1)"
  exit
fi

# End Test for nameserver1
# Test for nameserver2

if [[ $nameserver2 = *[!\ ]* ]]; then
  echo "The variable nameserver2 ($nameserver2) has passed speedbump 2.2"
else
  echo "Please enter a value into nameserver2 (Failed speedbump 2.2)"
  exit
fi

# End Test for nameserver2
# Test for nameserver3

if [[ $nameserver3 = *[!\ ]* ]]; then
  echo "The variable nameserver3 ($nameserver3) has passed speedbump 2.3"
else
  echo "Please enter a value into nameserver3 (Failed speedbump 2.3)"
  exit
fi

# End Test for nameserver3
# Test for nameserver4

if [[ $nameserver4 = *[!\ ]* ]]; then
  echo "The variable nameserver4 ($nameserver4) has passed speedbump 2.4"
else
  echo "Please enter a value into nameserver4 (Failed speedbump 2.4)"
  exit
fi

# End Test for nameserver4
# Test for port1

if [[ $port1 = *[!\ ]* ]]; then
  echo "The variable port1 ($port1) has passed speedbump 3.2"
else
  echo "Please enter a value into port1 (Failed speedbump 3.2)"
  exit
fi

# End Test for port1
# Test for port2

if [[ $port2 = *[!\ ]* ]]; then
  echo "The variable port2 ($port2) has passed speedbump 3.3"
else
  echo "Please enter a value into port2 (Failed speedbump 3.3)"
  exit
fi

# End Test for port2
# Test for port3

if [[ $port3 = *[!\ ]* ]]; then
  echo "The variable port3 ($port3) has passed speedbump 3.4"
else
  echo "Please enter a value into port3 (Failed speedbump 3.4)"
  exit
fi

# End Test for port3
# Test for port4

if [[ $port4 = *[!\ ]* ]]; then
  echo "The variable port4 ($port4) has passed speedbump 3.5"
else
  echo "Please enter a value into port4 (Failed speedbump 3.5)"
  exit
fi

# End Test for port4
# End Find Variables
# Test for wifi/internet


wget -q --spider https://google.com
if [ $? -eq 0 ]; then

# End Test for wifi/internet (Continues to bottom)
# Nameserver 1 Dig test

nameserver1dig=$(dig +short @$nameserver1 -p $port1 a $testdomain)
nameserver1digtime=$(date +"%T")

# End Nameserver 1 Dig test
# Nameserver 2 Dig test

nameserver2dig=$(dig +short @$nameserver2 -p $port2 a $testdomain)
nameserver2digtime=$(date +"%T")

# End Nameserver 2 Dig test
# Nameserver 3 Dig test

nameserver3dig=$(dig +short @$nameserver3 -p $port3 a $testdomain)
nameserver3digtime=$(date +"%T")

# End Nameserver 3 Dig test
# Nameserver 4 Dig test

nameserver4dig=$(dig +short @$nameserver4 -p $port4 a $testdomain)
nameserver4digtime=$(date +"%T")

# End Nameserver 4 Dig test
# Nameserver test

echo ""
echo "--------------------------------"
echo "------ BEGIN TEST SECTION ------"
echo "--------------------------------"
echo ""

# Dig thing

# Nameserver 1 Test

if [[ $(dig +short @$nameserver1 -p $port1 a $testdomain) = *$testip* ]]; then
  echo "$nameserver1:$port1 Returned a valid response (dig +short @$nameserver1 -p $port1 a $testdomain)"
  echo "$nameserver1:$port1 responded with $nameserver1dig (Valid at the time of $nameserver1digtime)"
else
  unset nameserver1
  unset port1
  echo "$nameserver1:$port1 Returned an invalid response (dig +short @$nameserver1 -p $port1 a $testdomain)" 
fi

# End nameserver 1 Test
# Nameserver 2 Test

if [[ $(dig +short @$nameserver2 -p $port2 a $testdomain) = *$testip* ]]; then
  echo "$nameserver2:$port2 Returned a valid response (dig +short @$nameserver2 -p $port2 a $testdomain)";
  echo "$nameserver2:$port2 responded with $nameserver2dig (Valid at the time of $nameserver2digtime))"
else
  unset nameserver2
  unset port2
  echo "$nameserver2:$port2 Returned an invalid response (dig +short @$nameserver2 -p $port2 a $testdomain)"
fi

# End Nameserver 2 Test
# Nameserver 3 Test

if [[ $(dig +short @$nameserver3 -p $port3 a $testdomain) = *$testip* ]]; then
  time=$(date +"%T");
  echo "$nameserver3:$port3 Returned a valid response at (dig +short @$nameserver3 -p $port3 a $testdomain)"
  echo "$nameserver3:$port3 responded with $nameserver3dig (Valid at the time of $nameserver3digtime))"
else
  unset nameserver3
  unset port3
  echo "$nameserver3:$port3 Returned an invalid response (dig +short @$nameserver3 -p $port3 a $testdomain)"

fi

# End Nameserver 3 Test
# Nameserver 4 Test

if [[ $(dig +short @$nameserver4 -p $port4 a $testdomain) = *$testip* ]]; then
  echo "$nameserver4:$port4 Returned a valid response (dig +short @$nameserver4 -p $port4 a $testdomain)"
  echo "$nameserver4:$port4 responded with $nameserver4dig (Valid at the time of $nameserver4digtime))"
else
  unset nameserver4
  unset port4
  echo "$nameserver4:$port4 Returned an invalid response (dig +short @$nameserver1 -p $port1 a $testdomain)"

fi

# End Nameserver Tests
# Check to see what is eliminated and latency test

echo ""
echo "--------------------------------"
echo "----- BEGIN ANSWER SECTION -----"
echo "--------------------------------"
echo ""
echo "The latency of your servers are:"
echo ""

latency1=$({ time nc -v -z $nameserver1 $port1; } |& grep real | awk '{print $2}')
latency2=$({ time nc -v -z $nameserver2 $port2; } |& grep real | awk '{print $2}')
latency3=$({ time nc -v -z $nameserver3 $port3; } |& grep real | awk '{print $2}')
latency4=$({ time nc -v -z $nameserver4 $port4; } |& grep real | awk '{print $2}')

echo "$nameserver1:$port1 Latency (Seconds) = $latency1"
echo "$nameserver2:$port2 Latency (Seconds) = $latency2"
echo "$nameserver3:$port3 Latency (Seconds) = $latency3"
echo "$nameserver4:$port4 Latency (Seconds) = $latency4"
echo ""

# End Check to see what is eliminated and latency test
# See which latency is better using simple script

if [ $latency2 \> $latency1 ];
then
    echo "Should use $nameserver1 in your network manager";
else
    if [ $latency2 \> $latency3 ];
    then
       echo "Should use $nameserver3 in your network manager";
    else
        if [ $latency2 \> $latency4 ];
        then
           echo "Should use $nameserver4 in your network manager";
        else
          echo "You should use $nameserver2 in your network manager."
     fi
   fi
fi

# End See which latency is better using simple script
# ElseIf error for wifi/internet

else
  echo "Please connect to internet and double check your router/modem"
  echo "This script requires internet to run (Please check you have WIFI)"
fi

# End ElseIf error for wifi/internet
