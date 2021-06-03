declare -A res
echo "Enter n for the loop "
read n
res+=( ['hhh']=0 ['hht']=0 ['hth']=0 ['thh']=0 ['htt']=0 ['tht']=0 ['tth']=0 ['ttt']=0 )
hhh=0
hht=1
hth=2
thh=3
htt=4
tht=5
tth=6
ttt=7
for (( i=0;i<n;i++ ))
do
   toss=$((RANDOM%8))
   if [ $toss -eq $hhh ]
   then
       res['hhh']=$(("${res['hhh']}"+1))
   elif [ $toss -eq $hht ]
   then
       res['hht']=$(("${res['hht']}"+1))
   elif [ $toss -eq $hth ]
   then
       res['hth']=$(("${res['hth']}"+1))

   elif [ $toss -eq $thh ]
   then
       res['thh']=$(("${res['thh']}"+1))
   elif [ $toss -eq $htt ]
   then
       res['htt']=$(("${res['htt']}"+1))
   elif [ $toss -eq $tht ]
   then
       res['tht']=$(("${res['tht']}"+1))
   elif [ $toss -eq $tth ]
   then
       res['tth']=$(("${res['tth']}"+1))

   else
       res['ttt']=$(("${res['ttt']}"+1))

   fi
done
hhhcnt="${res['hhh']}"
hhtcnt="${res['hht']}"
hthcnt="${res['hth']}"
thhcnt="${res['thh']}"
httcnt="${res['htt']}"
thtcnt="${res['tht']}"
tthcnt="${res['tth']}"
tttcnt="${res['ttt']}"
#echo "hhh=$hhhcnt, hht=$hhtcnt, hth=$hthcnt, thh=$thhcnt, htt=$httcnt, tht=$thtcnt, tth=$tthcnt and ttt=$tttcnt"

hhhpercent=$((($hhhcnt*100)/$n))
hhtpercent=$((($hhtcnt*100)/$n))
hthpercent=$((($hthcnt*100)/$n))
thhpercent=$((($thhcnt*100)/$n))
httpercent=$((($httcnt*100)/$n))
thtpercent=$((($thtcnt*100)/$n))
tthpercent=$((($tthcnt*100)/$n))
tttpercent=$((($tttcnt*100)/$n))

echo "hhh=$hhhpercent%, hht=$hhtpercent%, hth=$hthpercent%, thh=$thhpercent%, htt=$httpercent%, tht=$thtpercent%, tth=$tthpercent% and ttt=$tttpercent%"

headpercent=$(($hhhpercent+($hhtpercent+$hthpercent+$thhpercent+$httpercent+$thtpercent+$tthpercent)/2))
echo "heads=$headpercent% and tails=$((100-$headpercent))%"
