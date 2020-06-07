read -p "Enter the number of times to flip the coin: " no

declare -A Dictionary

for (( i=0; i<no; i++ ))
do
        result=$(( RANDOM%2 ))

        if [ $result -eq 0 ]
        then
                if [ ${Dictionary['Head']} ]
                then
                        count=${Dictionary['Head']}
                        Dictionary['Head']=$(( ++count ))
                else
                        Dictionary['Head']=1
                fi
        elif [ $result -eq 1 ]
        then
                if [ ${Dictionary['Tail']} ]
                then
                        count=${Dictionary['T']}
                        Dictionary['Tail']=$(( ++count ))
                else
                        Dictionary['Tail']=1
                fi
        fi

done

echo ${!Dictionary[@]}
echo ${Dictionary[@]}

if [ ${Dictionary['Head']} -gt ${Dictionary['Tail']} ]
then
        percentage=`echo ${Dictionary['Head']} $no | awk '{print ($1/$2)*100}'`
        echo "Head:"$percentage"%"
elif [ ${Dictionary['Tail']} -gt ${Dictionary['Head']} ]
then
        percentage=`echo ${Dictionary['Tail']} $no | awk '{print ($1/$2)*100}'`
        echo "Tail:"$percentage"%"
else
        percentage=`echo ${Dictionary['Head']} $no | awk '{print ($1/$2)*100}'`
        echo "Tail:"$percentage"%"
fi
