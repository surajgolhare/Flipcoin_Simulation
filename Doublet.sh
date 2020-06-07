read -p "Enter the number of times to  flip the coin: " no
Head='H'
Tail='T'
declare -A Dictionary
declare -A perDail
declare -a Array

function getResult()
{
        local result=''
        for (( i=0; i<2; i++ ))
        do
                coin=$(( RANDOM%2 ))
                if [ $coin -eq 0 ]
                then
                        result="${result}${Head}"
                elif [ $coin -eq 1 ]
                then
                        result="${result}${Tail}"
                fi
        done
        echo $result
}


for (( i=0; i<no; i++ ))
do
        result=$( getResult )
        if [[ ${Dictionary[$result]} ]]
        then
                count=${Dictionary[$result]}
                Dictionary[$result]=$(( ++count ))
        else
                Dictionary[$result]=1
        fi
done
echo "Keys:  "${!Dictionary[@]}
echo "Values: "${Dictionary[@]}

count1=0
for key in ${!Dictionary[@]}
do
        Array[$((count1))]=${Dictionary[$key]}
        per=`echo ${Dictionary[$key]} $no | awk '{print ($1/$2)*100}'`
        perDail[$key]=$per
done
echo "Percent Dictonary: "${perDail[@]}
