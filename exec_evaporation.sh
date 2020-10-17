
# Experiment varying evaporation
mkdir logs -p
# for counter in $(seq 1 10) 
# do
#     echo "Running exp on evaporation: 0.1 || Entrada1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --evaporation 0.1 --id "evaporation-01-entrada1-$counter" > logs/results-evaporation-entrada1-evaporation-01-$counter-run.log

#     echo "Running exp on evaporation: 0.2 || Entrada1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --evaporation 0.2 --id "evaporation-02-entrada1-$counter" > logs/results-evaporation-entrada1-evaporation-02-$counter-run.log

#     echo "Running exp on evaporation: 0.5 || Entrada1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --evaporation 0.5 --id "evaporation-05-entrada1-$counter" > logs/results-evaporation-entrada1-evaporation-05-$counter-run.log

# done
# echo "Done entrada1"

for counter in $(seq 1 10) 
do
    echo "Running exp on evaporation: 0.1 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --evaporation 0.1 --id "evaporation-01-entrada2-$counter" > logs/results-evaporation-entrada2-evaporation-01-$counter-run.log

    echo "Running exp on evaporation: 0.2 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --evaporation 0.2 --id "evaporation-02-entrada2-$counter" > logs/results-evaporation-entrada2-evaporation-02-$counter-run.log

    echo "Running exp on evaporation: 0.5 || Entrada2 || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --evaporation 0.5 --id "evaporation-05-entrada2-$counter" > logs/results-evaporation-entrada2-evaporation-05-$counter-run.log

done
echo "Done entrada2"

# for counter in $(seq 1 10) 
# do
#     echo "Running exp on evaporation: 0.1 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --evaporation 0.1 --id "evaporation-01-entrada3-$counter" > logs/results-evaporation-entrada3-evaporation-01-$counter-run.log

#     echo "Running exp on evaporation: 0.2 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --evaporation 0.2 --id "evaporation-02-entrada3-$counter" > logs/results-evaporation-entrada3-evaporation-02-$counter-run.log

#     echo "Running exp on evaporation: 0.5 || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --evaporation 0.5 --id "evaporation-05-entrada3-$counter" > logs/results-evaporation-entrada3-evaporation-05-$counter-run.log

# done
# echo "Done entrada3"