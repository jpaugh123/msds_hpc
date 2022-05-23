#!/bin/bash

printf "Jon Paugh bash script for HW3i\n"
printf "Dowload te file and rename it\n"

curl -O https://www.gutenberg.org/files/65473/65473-0.txt
cp 65473-0.txt gt.txt

checkPrime() {
	echo  "Check prime for $1\n"
	last=$(($1 - 1))
	for j in $(seq 2 $last); do
		echo "Checking $i with $j\n"
		m=$(($1 % $j))
		if [ $m -eq 0 ]; then
			#echo "Found nonprime with $1 and $j"
			 echo "For $1 found divisor $j\n"
			   return 1
		 fi
	done
	return 0
}
declare -a primes
for i in {2..20}; do
	if (checkPrime $i); then
		#primes+=({$i}
		primes+=($i)
	fi
done
printf "Primes are "
printf ${primes[*]}
for i in {0..4}; do
	echo "prime  $i is ${primes[$i]}"
done
split gt.txt -n 5 gtSplit
#splitFiles=("$(ls gtSplit*)")
splitFiles=(gtSplit*)
printf "path to files"
echo ${splitFiles[@]}  
printf "Path to file index 1"
echo  ${splitFiles[$1]}
#splitFiles=($(ls gtSplit*))
#printf ${splitFiles[*]}
for i in {0..4}; do
	echo "prime  $i is ${primes[$i]}"
	mkdir ${primes[$i]}
	printf ${splitFiles[$i]}
	cp ${splitFiles[$i]} ${primes[$i]}
done
exit 1
