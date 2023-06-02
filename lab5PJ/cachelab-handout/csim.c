#include "cachelab.h"
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int hit_count;
int miss_count;
int eviction_count;

typedef struct Cache_line{
    long long valid_bit;
    int tag;
    int time_stamp;
}Cache_line;

typedef struct cache{
    int S;// S groups
    int E;// E lines in each group
    int B;// B bytes in each line
    Cache_line **line;
}Cache;

void init_cache(int s, int E, int b, Cache *cache);
void process(int t_index, int s_index, Cache *cache);
int det(Cache *cache, int t_index, int s_index);
int judge(Cache *cache, int t_index, int s_index);
void update(Cache *cache, int max_flag, int t_index, int s_index);

int main(int argc, char **argv){
    int opt;
    int s, E, b;
    char *file;
    char *mode = "direct";
    // one colon, three hours
    const char *optstring = "hvs:E:b:t:";
    while ((opt = getopt(argc, argv, optstring)) != -1){
        switch (opt){
        case 'h':
            mode = "help";
            break;
        case 'v':
            mode = "verbose";
            break;
        case 's':
            s = atoi(optarg);
            break;
        case 'E':
            E = atoi(optarg);
            break;
        case 'b':
            b = atoi(optarg);
            break;
        case 't':
            file = optarg;
            printf("%s", file);
            break;
        case '?':
        default:
            mode = "help";
            break;
        }
    }
    if (!strcmp(mode, "help")){
        printf("Usage: ./csim-ref [-hv] -s <num> -E <num> -b <num> -t <file>\n");
        printf("Options:\n");
        printf("  -h         Print this help message.\n");
        printf("  -v         Optional verbose flag.\n");
        printf("  -s <num>   Number of set index bits.\n");
        printf("  -E <num>   Number of lines per set.\n");
        printf("  -b <num>   Number of block offset bits.\n");
        printf("  -t <file>  Trace file.\n\n");
        printf("Examples:\n");
        printf("  linux>  ./csim-ref -s 4 -E 1 -b 4 -t traces/yi.trace\n");
        printf("  linux>  ./csim-ref -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");   
        return 0;     
    }
    
    Cache *cache = (Cache*)malloc(sizeof(Cache)); 
    init_cache(s, E, b, cache);
    
    FILE *pFile;
    assert(pFile);
    pFile = fopen(file, "r");

    char identifer;
    unsigned address;
    int size;
    if (!strcmp(mode, "direct")){
        while (fscanf(pFile, " %c %x,%d", &identifer, &address, &size) > 0){
            int t = 32 - s - b;
            unsigned t_index = address >> (s + b);
            unsigned s_index = (address << t) >> (b + t);
            switch(identifer){
            case 'I':
                break;
            case 'L':
                process(t_index, s_index, cache);
                break;
            case 'S':
                process(t_index, s_index, cache);
                break;
            case 'M':
                process(t_index, s_index, cache);
                process(t_index, s_index, cache);
                break;
            default:
                exit(1);
            }
        }
    }
    else if (!strcmp(mode, "verbose")){
        while(fscanf(pFile, " %c %x,%d", &identifer, &address, &size) > 0){
            int orig_hit = hit_count;
            int orig_miss = miss_count;
            int orig_eviction = eviction_count;
            int t = 32 - s - b;
            unsigned t_index = address >> (s + b);
            unsigned s_index = (address << t) >> (b + t);
            switch(identifer){
            case 'I':
                break;
            case 'L':
                process(t_index, s_index, cache);
                printf("L %x,1 ", address);
                if (hit_count > orig_hit){
                    printf("hit ");
                }
                if (miss_count > orig_miss){
                    printf("miss ");
                }
                if (eviction_count > orig_eviction){
                    printf("eviction ");
                }
                printf("\n");
                break;
            case 'S':
                process(t_index, s_index, cache);
                printf("S %x,1 ", address);
                if (hit_count > orig_hit){
                    printf("hit ");
                }
                if (miss_count > orig_miss){
                    printf("miss ");
                }
                if (eviction_count > orig_eviction){
                    printf("eviction ");
                }
                printf("\n");
                break; 
            case 'M':
                process(t_index, s_index, cache);
                printf("M %x,1 ", address);
                if (hit_count > orig_hit){
                    printf("hit ");
                }
                if (miss_count > orig_miss){
                    printf("miss ");
                }
                if (eviction_count > orig_eviction){
                    printf("eviction ");
                }
                orig_hit = hit_count;
                orig_miss = miss_count;
                orig_eviction = eviction_count;
                process(t_index, s_index, cache);
                if (hit_count > orig_hit){
                    printf("hit ");
                }
                if (miss_count > orig_miss){
                    printf("miss ");
                }
                if (eviction_count > orig_eviction){
                    printf("eviction");
                }  
                printf("\n");
                break;   
            default:
                exit(1);            
            }
        }
    }
    fclose(pFile);
    free(cache);
    printSummary(hit_count, miss_count, eviction_count);
    return 0;
}

void process(int t_index, int s_index, Cache *cache){
    int res = det(cache, t_index, s_index);
    if (res != -1){
        hit_count++;
        update(cache, res, t_index, s_index);
        return;
    }
    miss_count++;

    int empty_line = judge(cache, t_index, s_index);
    if (empty_line == cache->E){
        eviction_count++;
        unsigned max_time_stamp = cache->line[s_index][0].time_stamp;
        unsigned max_flag = 0;
        for (int i = 1; i < cache->E; ++i){
            if (cache->line[s_index][i].time_stamp > max_time_stamp){
                max_flag = i;
                max_time_stamp = cache->line[s_index][i].time_stamp;
            }
        }
        update(cache, max_flag, t_index, s_index);
    }
    else{
        update(cache, empty_line, t_index, s_index);
    }
}

void init_cache(int s, int E, int b, Cache *cache){
    cache->E = E;
    cache->B = (1 << b);
    cache->S = (1 << s);
    cache->line = (Cache_line**)malloc(sizeof(Cache_line*) * cache->S);
    for (int i = 0; i < cache->S; i++){
        cache->line[i] = (Cache_line*)malloc(sizeof(Cache_line) * cache->E);
        for (int j = 0; j < cache->E; j++){
            cache->line[i][j].valid_bit = 0;
            cache->line[i][j].tag = -1;
            cache->line[i][j].time_stamp = 0;
        }
    }
}

int det(Cache *cache, int t_index, int s_index){
    for (int i = 0; i < cache->E; i++){
        if (cache->line[s_index][i].valid_bit && cache->line[s_index][i].tag == t_index){
            return i;
        }
    }
    return -1;
}

int judge(Cache *cache, int t_index, int s_index){
    int k = 0;
    for (int i = 0; i < cache->E; i++){
        if (cache->line[s_index][i].valid_bit){
            k++;
        }
        else{
            return i;
        }
    }
    return k;
}

void update(Cache *cache, int max_flag, int t_index, int s_index){
    cache->line[s_index][max_flag].tag = t_index;
    cache->line[s_index][max_flag].valid_bit = 1;
    for (int i = 0; i < cache->E; ++i){
        cache->line[s_index][i].time_stamp++;
    }
    cache->line[s_index][max_flag].time_stamp = 0;
}