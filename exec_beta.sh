
# Experiment varying beta
mkdir logs -p
for counter in $(seq 1 10) 
do
    echo "Running exp on beta: 1 || Entrada1 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada1.txt" --beta 1 --id "beta-1-entrada1-$counter" > logs/results-beta-entrada1-beta-1-$counter-run.log

    echo "Running exp on beta: 2 || Entrada1 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada1.txt" --beta 2 --id "beta-2-entrada1-$counter" > logs/results-beta-entrada1-beta-2-$counter-run.log

    echo "Running exp on beta: 3 || Entrada1 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada1.txt" --beta 3 --id "beta-3-entrada1-$counter" > logs/results-beta-entrada1-beta-3-$counter-run.log

done
echo "Done entrada1"

for counter in $(seq 1 10) 
do
    echo "Running exp on beta: 1 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --beta 1 --id "beta-1-entrada2-$counter" > logs/results-beta-entrada2-beta-1-$counter-run.log

    echo "Running exp on beta: 2 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --beta 2 --id "beta-2-entrada2-$counter" > logs/results-beta-entrada2-beta-2-$counter-run.log

    echo "Running exp on beta: 3 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --beta 3 --id "beta-3-entrada2-$counter" > logs/results-beta-entrada2-beta-3-$counter-run.log

done
echo "Done entrada2"

# for counter in $(seq 1 10) 
# do
#     echo "Running exp on beta: 1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --beta 1 --id "beta-1-entrada3-$counter" > logs/results-beta-entrada3-beta-1-$counter-run.log

#     echo "Running exp on beta: 2 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --beta 2 --id "beta-2-entrada3-$counter" > logs/results-beta-entrada3-beta-2-$counter-run.log

#     echo "Running exp on beta: 3 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --beta 3 --id "beta-3-entrada3-$counter" > logs/results-beta-entrada3-beta-3-$counter-run.log

# done
# echo "Done entrada3"