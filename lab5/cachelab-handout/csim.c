#include "cachelab.h"
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>

int hit_count;
int miss_count;
int eviction_count;

typedef struct cache_line{
    long long valid_bit;
    int tag;
    int time_stamp;
} cache_line;

typedef struct cache{
    int S;
    int E;
    int B;
    cache_line **line;// 这个定义不太会， 但总之是line[S][E]
} cache;

void init_cache(int s, int E, int b, cache *temp){
    temp->E = E;
    temp->B = (1 << b);
    temp->S = (1 << s);
    temp->line = (cache_line**)malloc(sizeof(cache_line*) * temp->S);
	for (int i = 0; i < temp->S; i++){
		temp->line[i] = (cache_line*)malloc(sizeof(cache_line) * temp->E);
        for (int j = 0; j < temp->E; j++){
            temp->line[i][j].valid_bit = 0;
            temp->line[i][j].tag = -1;
            temp->line[i][j].time_stamp = 0;
        }
	}
}

// determine whether hit or miss
int determine(cache *temp, int t_index, int s_index){
    for (int i = 0; i < temp->E; ++i){
        if (temp->line[s_index][i].valid_bit && temp->line[s_index][i].tag == t_index){
            return i;
        }
    }
    return -1;
}

// determine whether full or not full
int judge(cache *temp, int t_index, int s_index){
    int k = 0;
    for (int i = 0; i < temp->E; ++i){
        if (temp->line[s_index][i].valid_bit){
            ++k;
        }
        else{
            return i;
        }
    }
    return k;
}

void update(cache *temp, int max_flag, int t_index, int s_index){
    temp->line[s_index][max_flag].tag = t_index;
    temp->line[s_index][max_flag].valid_bit = 1;
    for (int j = 0; j < temp->E; ++j){
        temp->line[s_index][j].time_stamp++;
    }
    temp->line[s_index][max_flag].time_stamp = 0;
}

void process(int t_index, int s_index, cache *temp){
    int res = determine(temp, t_index, s_index);
    if (res != -1){
        hit_count++;
        update(temp, res, t_index, s_index);
        return;
    }
    // if cannot find the result, we should find the max_time_stamp and change it
    miss_count++;
    int empty_line = judge(temp, t_index, s_index);
    if (empty_line == temp->E){
        eviction_count++;
        // 如果直接更新时间，那么E不为1且数据较大的时候会报错，事实上这非常不可靠
        // time(&Time);
        // 可以用简单的计数来实现LRU缓存
        // 注意一个问题，如果存在空行，则不应该用LRU缓存进行驱逐
        unsigned max_time_stamp = temp->line[s_index][0].time_stamp;
        unsigned max_flag = 0;
        for (int i = 1; i < temp->E; ++i){
            if (temp->line[s_index][i].time_stamp > max_time_stamp){
                max_flag = i;
                max_time_stamp = temp->line[s_index][i].time_stamp;
            }
        }
        update(temp, max_flag, t_index, s_index);
    }
    else{
        update(temp, empty_line, t_index, s_index);
    }
}

int main(int argc, char **argv){
    //step 1///////////////////////////////////////////////
    int opt, s, E, b;
    char *file;
    char *mode = "direct";
    const char *optstring = "hvs:E:b:t:";
    /* looping over arguments */
    while ((opt = getopt(argc, argv, optstring)) != -1){
        /* determine which argument it’s processing */
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
    //step 2//////////////////////////////////////////
    cache *temp = (cache*)malloc(sizeof(cache));
    init_cache(s, E, b, temp);
    //step 3//////////////////////////////////////////
    FILE *pFile;
    assert(pFile);
    pFile = fopen(file, "r");
    char identifier;
    unsigned address;
    int size;
    // Reading lines like " M 20,1"	or "L 19,3"
    if (!strcmp(mode, "direct")){
        while (fscanf(pFile, " %c %x,%d", &identifier, &address, &size) > 0){
            // printf("identifier: %c, address: %x, size: %d\n", identifier, address, size);
            // dynamic action
            // get t, s and b
            int t = 32 - s - b;
            unsigned t_index = address >> (s + b);
            unsigned s_index = (address << t) >> (b + t);
            // unsigned b_index = (address << (t + s)) >> (t + s);
            switch(identifier){
            case 'I':
                break;
            case 'L':
                process(t_index, s_index, temp);
                break;
            case 'S':
                process(t_index, s_index, temp);
                break;
            case 'M':
                // load and store
                process(t_index, s_index, temp);
                process(t_index, s_index, temp);
                break;
            default:
                exit(1);
            }
        }
    }
    else if (!strcmp(mode, "verbose")){
        while (fscanf(pFile, " %c %x,%d", &identifier, &address, &size) > 0){
            int orig_hit = hit_count;
            int orig_miss = miss_count;
            int orig_eviction = eviction_count;
            int t = 32 - s - b;
            unsigned t_index = address >> (s + b);
            unsigned s_index = (address << t) >> (b + t);
            switch(identifier){
            case 'I':
                break;
            case 'L':
                process(t_index, s_index, temp);
                printf("L %x,1 ", address);
                if (hit_count > orig_hit)
                    printf("hit ");
                if (miss_count > orig_miss)
                    printf("miss ");
                if (eviction_count > orig_eviction)
                    printf("eviction ");
                printf("\n");
                break;
            case 'S':
                process(t_index, s_index, temp);
                printf("S %x,1 ", address);
                if (hit_count > orig_hit)
                    printf("hit ");
                if (miss_count > orig_miss)
                    printf("miss ");
                if (eviction_count > orig_eviction)
                    printf("eviction ");
                printf("\n");
                break;
            case 'M':
                process(t_index, s_index, temp);
                printf("M %x,1 ", address);
                if (hit_count > orig_hit)
                    printf("hit ");
                if (miss_count > orig_miss)
                    printf("miss ");
                if (eviction_count > orig_eviction)
                    printf("eviction ");
                orig_hit = hit_count;
                orig_miss = miss_count;
                orig_eviction = eviction_count;
                process(t_index, s_index, temp);
                if (hit_count > orig_hit)
                    printf("hit ");
                if (miss_count > orig_miss)
                    printf("miss ");
                if (eviction_count > orig_eviction)
                    printf("eviction");
                printf("\n");
                break;
            default:
                exit(1);
            }
        }        
    }
    fclose(pFile);
    //step 3//////////////////////////////////////////
    free(temp);
    //step 4//////////////////////////////////////////
    printSummary(hit_count, miss_count, eviction_count);
    return 0;
}