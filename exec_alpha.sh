
# Experiment varying alpha
mkdir logs -p
for counter in $(seq 1 30) 
do
    echo "Running exp on alpha: 1 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada1.txt" --alpha 1 --id "alpha-1-entrada1-$counter" > logs/results-alpha-entrada1-alpha-1-$counter-run.log

    echo "Running exp on alpha: 2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada1.txt" --alpha 2 --id "alpha-2-entrada1-$counter" > logs/results-alpha-entrada1-alpha-2-$counter-run.log

    echo "Running exp on alpha: 3 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada1.txt" --alpha 3 --id "alpha-3-entrada1-$counter" > logs/results-alpha-entrada1-alpha-3-$counter-run.log

done
echo "Done entrada1"

for counter in $(seq 1 30) 
do
    echo "Running exp on alpha: 1 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --alpha 1 --id "alpha-1-entrada2-$counter" > logs/results-alpha-entrada2-alpha-1-$counter-run.log

    echo "Running exp on alpha: 2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --alpha 2 --id "alpha-2-entrada2-$counter" > logs/results-alpha-entrada2-alpha-2-$counter-run.log

    echo "Running exp on alpha: 3 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --alpha 3 --id "alpha-3-entrada2-$counter" > logs/results-alpha-entrada2-alpha-3-$counter-run.log

done
echo "Done entrada2"

# for counter in $(seq 1 10) 
# do
#     echo "Running exp on alpha: 1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --alpha 1 --id "alpha-1-entrada3-$counter" > logs/results-alpha-entrada3-alpha-1-$counter-run.log

#     echo "Running exp on alpha: 2 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --alpha 2 --id "alpha-2-entrada3-$counter" > logs/results-alpha-entrada3-alpha-2-$counter-run.log

#     echo "Running exp on alpha: 3 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --alpha 3 --id "alpha-3-entrada3-$counter" > logs/results-alpha-entrada3-alpha-3-$counter-run.log

# done
# echo "Done entrada3"