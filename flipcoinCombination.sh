heads=1
tails=0
declare -A res

echo "Enter n for the loop "
read n
for (( i=0;i<n;i++ ))
do
   toss=$((RANDOM%2))
   if [ $toss -eq $heads ]
   then
       res['heads']=$(("${res['heads']}"+1))
   else
       res['tails']=$(("${res['tails']}"+1))

   fi
done
headcnt=$(($n-${res['heads']}))
headpercent=$((($headcnt*100)/$n))
echo "tails=${res['tails']} and heads=${res['heads']}"
echo "occurance of tails = $headpercent% and head = $((100-$headpercent))%" 
