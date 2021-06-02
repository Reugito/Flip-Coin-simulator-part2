declare -A res
echo "Enter n for the loop "
read n
hh=0
ht=1
th=2
tt=3
for (( i=0;i<n;i++ ))
do
   toss=$((RANDOM%4))
   if [ $toss -eq $hh ]
   then
       res['hh']=$(("${res['hh']}"+1))
   elif [ $toss -eq $ht ]
   then
       res['ht']=$(("${res['ht']}"+1))
   elif [ $toss -eq $th ]
   then
       res['th']=$(("${res['th']}"+1))

   else
       res['tt']=$(("${res['tt']}"+1))

   fi
done
hhcnt="${res['hh']}"
htcnt="${res['ht']}"
ttcnt="${res['tt']}"

hhpercent=$((($hhcnt*100)/$n))
htpercent=$((($htcnt*100)/$n))
ttpercent=$((($ttcnt*100)/$n))
thpercent=$((100-$hhpercent-$htpercent-$ttpercent))
headpercent=$((100-$ttpercent-($thpercent+$htpercent)/2))
echo "hh=${res['hh']}, ht=${res['ht']}, th=${res['th']} and tt=${res['tt']}"
echo "hh=$hhpercent%, ht=$htpercent%, th=$thpercent% and tt=$ttpercent%"
echo "heads=$headpercent% and tails=$((100-$headpercent))%"
