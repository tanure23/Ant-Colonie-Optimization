
# Experiment for final analysis
mkdir logs -p

for counter in $(seq 1 10) 
do
    echo "Running exp on elitism: True || Counter: $counter"
    python3 main.py --input "bases_grafos/entrada3.txt" --alpha 3 --beta 3 --maxAnts 50 --maxIter 125 --evaporation 0.2 --elitism --id "final-entrada3-$counter" > logs/results-final-entrada3-$counter-run.log
    
    # echo "Running exp on elitism: False || Counter: $counter"
    # python3 main.py --input "bases_grafos/entrada3.txt" --elitism False --id "elitism-False-entrada3-$counter" > logs/results-elitism-entrada3-elitism-False-$counter-run.log

done
echo "Done entrada3"