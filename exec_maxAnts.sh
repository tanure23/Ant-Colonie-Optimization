
# Experiment varying max ants
mkdir logs -p
# for counter in $(seq 1 10) 
# do
#     echo "Running exp on maxAnts: 5 || Entrada1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --maxAnts 5 --id "maxAnts-5-entrada1-$counter" > logs/results-maxAnts-entrada1-maxAnts-5-$counter-run.log

#     echo "Running exp on maxAnts: 10 || Entrada1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --maxAnts 10 --id "maxAnts-10-entrada1-$counter" > logs/results-maxAnts-entrada1-maxAnts-10-$counter-run.log

#     echo "Running exp on maxAnts: 20 || Entrada1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --maxAnts 20 --id "maxAnts-20-entrada1-$counter" > logs/results-maxAnts-entrada1-maxAnts-20-$counter-run.log

# done
# echo "Done entrada1"

for counter in $(seq 1 10) 
do
    echo "Running exp on maxAnts: 50 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --maxAnts 50 --id "maxAnts-50-entrada2-$counter" > logs/results-maxAnts-entrada2-maxAnts-50-$counter-run.log

    echo "Running exp on maxAnts: 100 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --maxAnts 100 --id "maxAnts-100-entrada2-$counter" > logs/results-maxAnts-entrada2-maxAnts-100-$counter-run.log

    echo "Running exp on maxAnts: 200 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --maxAnts 200 --id "maxAnts-200-entrada2-$counter" > logs/results-maxAnts-entrada2-maxAnts-200-$counter-run.log

done
echo "Done entrada2"

# for counter in $(seq 1 10) 
# do
#     echo "Running exp on maxAnts: 5 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --maxAnts 5 --id "maxAnts-5-entrada3-$counter" > logs/results-maxAnts-entrada3-maxAnts-5-$counter-run.log

#     echo "Running exp on maxAnts: 10 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --maxAnts 10 --id "maxAnts-10-entrada3-$counter" > logs/results-maxAnts-entrada3-maxAnts-10-$counter-run.log

#     echo "Running exp on maxAnts: 20 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --maxAnts 20 --id "maxAnts-20-entrada3-$counter" > logs/results-maxAnts-entrada3-maxAnts-20-$counter-run.log

# done
# echo "Done entrada3"