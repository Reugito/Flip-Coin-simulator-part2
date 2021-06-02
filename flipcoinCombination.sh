
heads=1
tails=0

toss=$((RANDOM%2))

if [ $toss -eq $heads ]
then
   echo "Heads win"
else
   echo "Tails win "
fi
