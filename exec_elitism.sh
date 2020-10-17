
# Experiment varying elitism
mkdir logs -p
# for counter in $(seq 1 10) 
# do
#     echo "Running exp on elitism: True || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --elitism --id "elitism-True-entrada1-$counter" > logs/results-elitism-entrada1-elitism-True-$counter-run.log
    
#     echo "Running exp on elitism: False || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada1.txt" --id "elitism-False-entrada1-$counter" > logs/results-elitism-entrada1-elitism-False-$counter-run.log

# done
# echo "Done entrada1"

for counter in $(seq 1 10) 
do
    echo "Running exp on elitism: True || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --elitism True --id "elitism-True-entrada2-$counter" > logs/results-elitism-entrada2-elitism-True-$counter-run.log
    
    echo "Running exp on elitism: False || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada2.txt" --elitism False --id "elitism-False-entrada2-$counter" > logs/results-elitism-entrada2-elitism-False-$counter-run.log

done
echo "Done entrada2"

# for counter in $(seq 1 10) 
# do
#     echo "Running exp on elitism: True || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --elitism True --id "elitism-True-entrada3-$counter" > logs/results-elitism-entrada3-elitism-True-$counter-run.log
    
#     echo "Running exp on elitism: False || Counter: $counter"
#     python3 main.py --input "bases_grafos/entrada3.txt" --elitism False --id "elitism-False-entrada3-$counter" > logs/results-elitism-entrada3-elitism-False-$counter-run.log

# done
# echo "Done entrada3"