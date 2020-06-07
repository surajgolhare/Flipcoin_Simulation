result=$(( RANDOM % 2 ))


if [ $result -eq 0 ]
then
        echo "Head"
elif [ $result -eq 1 ]
then
        echo "Tail"
fi





