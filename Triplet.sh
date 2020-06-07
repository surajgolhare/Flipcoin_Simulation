read -p "Enter the number of time to flip the coin:- " no
echo "Enter "
echo "1)Singlet_Combination"
echo "2)Doublet_Combination"
echo "3)Triplet_Combination"
read -p "Enter Your Choice: " choice

Head='H'
Tail='T'
declare -A Dictionary
declare -A perDict
declare -A Array

function Result1()
{
        local result=''
        for (( i=0; i<$1; i++ ))
        do
                Dail=$(( RANDOM%2 ))
                if [ $Dail -eq 0 ]
                then
                        result="${result}${Head}"
                elif [ $Dail -eq 1 ]
                then
                        result="${result}${Tail}"
                fi
        done
        echo $result
}


for (( i=0; i<no; i++ ))
do
        result=$( Result1 $choice )
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
        Array[$((count1++))]=${Dictionary[$key]}
        per=`echo ${Dictionary[$key]} $no | awk '{print ($1/$2)*100}'`
        perDict[$key]=$per
done

echo "Percent Dictionary: "${perDict[@]}
