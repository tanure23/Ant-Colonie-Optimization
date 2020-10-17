
# Experiment varying max iter
mkdir logs -p
# for counter in $(seq 1 10) 
# do
#     echo "Running exp on maxIter: 200 || Entrada1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --maxIter 200 --id "maxIter-200-entrada1-$counter" > logs/results-maxIter-entrada1-maxIter-200-$counter-run.log

# done
# echo "Done entrada1"

for counter in $(seq 1 10) 
do
    echo "Running exp on maxIter: 200 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --maxIter 200 --id "maxIter-200-entrada2-$counter" > logs/results-maxIter-entrada2-maxIter-200-$counter-run.log

done
echo "Done entrada2"

# for counter in $(seq 1 10) 
# do
#     echo "Running exp on maxIter: 200 || Entrada3 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --maxIter 200 --id "maxIter-200-entrada3-$counter" > logs/results-maxIter-entrada3-maxIter-200-$counter-run.log

# done
# echo "Done entrada3"