import numpy as np
import pdb
import multiprocessing
from tqdm import tqdm

def read_input(filename):
    new_input = open(filename, 'r')
    unique_nodes = []
    weights_list = []
    for l in new_input.readlines():
        aux = l.strip().split('\t')
        if int(aux[0])-1 not in unique_nodes:
            unique_nodes.append(int(aux[0])-1)
        if int(aux[1])-1 not in unique_nodes:
            unique_nodes.append(int(aux[1])-1)
        weights_list.append(
            [int(aux[0])-1, int(aux[1])-1, int(aux[2])]
        )

    return unique_nodes, weights_list

def initialize_matrix(unique_nodes, weights_list):
    #weights_list = [ [n1, n2, p], [n1, n9, p], [n2, n1, p], [n3, n9, p]....]
    size = len(unique_nodes)
    FERO_MAT = np.ones([size, size],  dtype=np.float)
    ADJ_MAT = np.zeros([size, size],  dtype=np.float)
    for entry in range(len(weights_list)):
        n1 = weights_list[entry][0]
        n2 = weights_list[entry][1]
        p = weights_list[entry][2]
        ADJ_MAT[n1][n2] = p

    return ADJ_MAT, FERO_MAT


def build_solution(ADJ_MAT, FERO_MAT, start_node, alpha, beta):
    SOLUTION = []
    SUM = 0
    NOW_NODE = start_node
    visited = []
    while True:
        visited.append(NOW_NODE)
        SOLUTION.append(NOW_NODE)

        denominator = 0
        numerators = []
        neighbours = []
        best_prob = [0, 0]
        for node, weight in enumerate(ADJ_MAT[NOW_NODE]):
            node = int(node)
            if ADJ_MAT[NOW_NODE][node] != 0 and node not in visited:
                pheromone = FERO_MAT[NOW_NODE][node]
                desirability = ADJ_MAT[NOW_NODE][node]
                aux = (np.power(pheromone, alpha) * np.power(desirability, beta))
                denominator += aux

                numerators.append(aux)

                neighbours.append(node)

        # pdb.set_trace()
        if len(neighbours) == 0:
            break

        probs = []
        for idx, node in enumerate(neighbours):
            now_prob = numerators[idx] / denominator
            probs.append(now_prob)
            
        NEXT_NODE = np.random.choice(neighbours, p=probs)
        SUM += ADJ_MAT[NOW_NODE][NEXT_NODE]
        NOW_NODE = NEXT_NODE

    return SOLUTION, SUM


def update_pheromone(ALL_SOLUTIONS, FERO_MAT, EVAPORATION, elitism=False):
    ALL_SOLUTIONS = [[result[0] for result in ALL_SOLUTIONS], [result[1] for result in ALL_SOLUTIONS]]
    FERO_MAT *= (1 - EVAPORATION)

    if (elitism):
        BEST_SOLUTION = [[], 0]
        for j in range(len(ALL_SOLUTIONS)):
            if ALL_SOLUTIONS[1][j] > BEST_SOLUTION[1]:
                BEST_SOLUTION[1] = ALL_SOLUTIONS[1][j]
                BEST_SOLUTION[0] = ALL_SOLUTIONS[0][j]

        for i in range(len(BEST_SOLUTION)-1):
            FERO_MAT[ BEST_SOLUTION[0][i], BEST_SOLUTION[0][i+1] ] += BEST_SOLUTION[1]

    else:
        for sol_idx, sol in enumerate(ALL_SOLUTIONS[0]):
            for i in range(len(sol)-1):
                FERO_MAT[sol[i], sol[i+1]] += ALL_SOLUTIONS[1][sol_idx]





def ACO(ADJ_MAT, FERO_MAT, MAX_IT, MAX_ANTS, alpha, beta, EVAPORATION, elitism, cpus):
    t=0
    pool = multiprocessing.Pool(processes=cpus)
    STORING_ALL_SOLUTIONS = []
    for t in tqdm(range(MAX_IT)):
        ALL_SOLUTIONS = [[], []]
        SOLUTION = []
        best = 0
        
        pool_args = []
        for ant in range(MAX_ANTS):
            pool_args.append((ADJ_MAT, FERO_MAT, alpha, beta))
        ALL_SOLUTIONS = pool.map(Parallel_build_solution, pool_args)
        
        STORING_ALL_SOLUTIONS.append(ALL_SOLUTIONS)
        
        update_pheromone(ALL_SOLUTIONS, FERO_MAT, EVAPORATION, elitism)

    return STORING_ALL_SOLUTIONS
    

def Parallel_build_solution(args):
    ADJ_MAT, FERO_MAT, alpha, beta = args
    graph_size = len(ADJ_MAT)
    start_node = np.random.randint(0, graph_size)
    return build_solution(ADJ_MAT, FERO_MAT, start_node, alpha, beta)


# def f_parallel(args):
#     x, y = args
#     return f(x, y)
# def f(x, y):
#     return x + y
# pool = multiprocessing.Pool(processes=cpu_count)
# args = [(1,2), (3,4), (5,6)]
# result = pool.map(f_parallel, args)

# u, w = read_input('bases_grafos/entrada2.txt')
# MAT, FER = initialize_matrix(u, w)
# ACO(MAT, FER, 100, 10, u, 1, 2, 0.1)

# # print(matrizona)
# print(len(u))
# # print()
# # print(w)