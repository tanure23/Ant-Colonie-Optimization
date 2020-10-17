import errno
import pickle
import argparse
import numpy as np
import multiprocessing
import sys, os
from datetime import datetime
# import matplotlib.pyplot as plt

from tp2_code import *


def mkdirp(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >= 2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


def parseArgs():
    parser = argparse.ArgumentParser()
    parser.add_argument("-a","--alpha", type=int, default=1, help="Pheromone importance")
    parser.add_argument("-b","--beta", type=int, default=2, help="Node weight importance")
    parser.add_argument("-s","--maxAnts", type=int, default=50, help="Maximum amount of ants")
    parser.add_argument("-p","--evaporation", type=float, default=0.2, help="Evaporation rate")
    parser.add_argument("-e","--elitism", action="store_true", default=True, help="Use Elitism")
    parser.add_argument("-m","--maxIter", type=int, default=100, help="Maximum amount of iterations")
    parser.add_argument("--seed", type=int, default=-1, help="Random random seed")

    parser.add_argument("-i","--input", type=str, default="bases_grafos/entrada1.txt", help="Input dataset file")
    parser.add_argument("-o","--output", type=str, default="results", help="Output results folder")
    parser.add_argument("-c","--cores", type=int, default=-1, help="Parallel Cores")
    parser.add_argument("--id", type=str, default="teste", help="Experiment identifier")

    return parser.parse_args()


if __name__ == "__main__":
    # Parsing args
    args = parseArgs()

    # Parameters
    MAX_IT = args.maxIter
    MAX_ANTS = args.maxAnts
    alpha = args.alpha
    beta = args.beta
    EVAPORATION = args.evaporation
    elitism = args.elitism
    if args.seed == -1:
        seed = np.random.randint(0, 1000000)
        print("Using randomly generated seed:", seed)
    else:
        seed = args.seed
    np.random.seed(seed)

    # Experiment ID and output log path
    experiment_id = args.id
    if experiment_id == '':
        experiment_id = datetime.now().strftime("%d-%m-%Y_%H-%M-%S")
    output_path = os.path.join(args.output, experiment_id)
    mkdirp(output_path)

    # Setting up experiment info (log)
    EXP_LOG = {}
    EXP_LOG['args'] = args
    EXP_LOG['seed'] = seed

    # Setting up multiprocessing pool
    cpus = args.cores
    if args.cores == -1:
        cpus = os.cpu_count()


    unique_nodes, weights_list = read_input(args.input)
    ADJ_MAT, FERO_MAT = initialize_matrix(unique_nodes, weights_list)

    # ALL_SOLUTIONS[0] = todas as solucoes de todas as formigas na iteracao 0
    # ALL_SOLUTIONS[0][0] = solucao E a soma da formiga 0 na iteracao 0
    # ALL_SOLUTIONS[0][0][0] = solucao da formiga 0 na iteracao 0
    # ALL_SOLUTIONS[0][0][1] = soma da formiga 0 na iteracao 0
    ALL_SOLUTIONS = ACO(ADJ_MAT, FERO_MAT, MAX_IT, MAX_ANTS, alpha, beta, EVAPORATION, elitism, cpus)

    overall_best = 0
    for iteration in range(MAX_IT):
        for ant in range(MAX_ANTS):
            now_sum = ALL_SOLUTIONS[iteration][ant][1]
            if now_sum > overall_best:
                overall_best = now_sum


    # EXP_LOG['Path'] = overall_best[0]
    print("BEST:", overall_best)
    EXP_LOG['Biggest Sum'] = overall_best
    EXP_LOG['All Solutions'] = ALL_SOLUTIONS
    print("Code done running!")

    OUT_FILE_NAME = os.path.join(output_path, "exp_log.pkl")
    OUT_FILE = open(OUT_FILE_NAME, "wb")
    pickle.dump(EXP_LOG, OUT_FILE)
    OUT_FILE.close()
    