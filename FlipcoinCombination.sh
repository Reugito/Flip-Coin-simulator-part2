#singlet heads and tails percentage
singlet(){
heads=1
tails=0
n=$1
declare -A res
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
sheadpercent=$((100-$headpercent))
stailpercent=$headpercent
echo "Singlet head=$((100-$headpercent))% and tails=$headpercent%"
}



#doublet heads and tails percentage

doublet(){
n=$1
declare -A res
res+=( ['hh']=0 ['ht']=0 ['th']=0 ['tt']=0 )
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
hhpercent=$((("${res['hh']}"*100)/$n))
htpercent=$((("${res['ht']}"*100)/$n))
ttpercent=$((("${res['tt']}"*100)/$n))
thpercent=$((100-$hhpercent-$htpercent-$ttpercent))
dheadpercent=$((100-$ttpercent-($thpercent+$htpercent)/2))
dtailpercent=$((100-$dheadpercent))
echo "Doublet heads=$dheadpercent% and tails=$((100-$dheadpercent))%"
}


#tripplet heads and tails percentage

tripplet(){
n=$1
declare -A res
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
hhhpercent=$((("${res['hhh']}"*100)/$n))
hhtpercent=$((("${res['hht']}"*100)/$n))
hthpercent=$((("${res['hth']}"*100)/$n))
thhpercent=$((("${res['thh']}"*100)/$n))
httpercent=$((("${res['htt']}"*100)/$n))
thtpercent=$((("${res['tht']}"*100)/$n))
tthpercent=$((("${res['tth']}"*100)/$n))
tttpercent=$((("${res['ttt']}"*100)/$n))

theadpercent=$(($hhhpercent+($hhtpercent+$hthpercent+$thhpercent+$httpercent+$thtpercent+$tthpercent)/2))
ttailpercent=$((100-$theadpercent))
echo "Tripplet heads=$theadpercent% and tails=$((100-$theadpercent))%"
}

#Take input
echo "Enter n for the loop "
read n
singlet $n
doublet $n
tripplet $n

#Find winner

echo " "
if [ $sheadpercent -gt $dheadpercent ] && [ $sheadpercent -gt $theadpercent ]
then
   echo "winner is singlet combination  heads=$sheadpercent% and tails=$stailpercent"
elif [ $sheadpercent -eq $dheadpercent ] && [ $sheadpercent -gt $theadpercent ]
then
   echo "Tie between singlet & doublet combination  heads=$sheadpercent% and tails=$stailpercent"
elif [ $sheadpercent -gt $dheadpercent ] && [ $sheadpercent -eq $theadpercent ]
   then
   echo "Tie between singlet & tripplet  combination  heads=$sheadpercent% and tails=$stailpercent"
fi

if [ $dheadpercent -gt $sheadpercent ] && [ $dheadpercent -gt $theadpercent ]
then
   echo "winner is doublet combination  heads=$dheadpercent% and tails=$dtailpercent"
elif [ $dheadpercent -eq $sheadpercent ] && [ $dheadpercent -gt $theadpercent ]
then
   echo "Tie between singlet & doublet combination  heads=$dheadpercent% and tails=$dtailpercent"
elif [ $dheadpercent -gt $dheadpercent ] && [ $dheadpercent -eq $theadpercent ]
then
   echo "Tie between doublet  & tripplet  combination  heads=$dheadpercent% and tails=$dtailpercent"
fi

if [ $theadpercent -gt $sheadpercent ] && [ $theadpercent -gt $dheadpercent ]
then
   echo "winner is tripplet combination  heads=$theadpercent% and tails=$ttailpercent"
elif [ $theadpercent -eq $sheadpercent ] && [ $theadpercent -gt $dheadpercent ]
then
   echo "Tie between tripplet & singlet combination  heads=$sheadpercent% and tails=$stailpercent"
elif [ $theadpercent -gt $sheadpercent ] && [ $theadpercent -eq $dheadpercent ]
then
   echo "Tie between doublet & tripplet  combination  heads=$theadpercent% and tails=$ttailpercent"
fi



