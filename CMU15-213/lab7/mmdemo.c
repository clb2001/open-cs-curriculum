/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 *
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc is
 * implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/*********************************************************
 * NOTE TO STUDENTS: Before you do anything else, please
 * provide your team information in the following struct.
 ********************************************************/
team_t team = {
    /* Team name */
    "November Rain",
    /* First member's full name */
    "Libin Cheng",
    /* First member's email address */
    "19300740005@fudan.edu.cn",
    /* Second member's full name (leave blank if none) */
    "",
    /* Second member's email address (leave blank if none) */
    ""};

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT - 1)) & ~0x7)

#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

//////////////////////////////////////////////////////
/*
* the macro I defined for implicit linkedlists
*/
#define WSIZE 4
#define DSIZE 8
#define CHUNKSIZE (1 << 8)
#define MAX(x, y) ((x) > (y)? (x) : (y))

/* only deal with head or foot */
#define PACK(size, malloc) ((size) | (malloc))
#define GET(p) (*(unsigned int *)(p))
#define PUT(p, val) (*(unsigned int *)(p) = (val))
#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

/* only deal with node */
#define HDRP(bp) ((char *)(bp) - 3 * WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - 2 * DSIZE)

#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp))) // may have some problems
#define PREV_BLKP(bp) ((char *)(bp) - GET_SIZE(((char *)(bp) - 2 * DSIZE))) // may have some problems

/////////////////////////////////////////////////////////
#define PRED(bp) ((char *)(bp - 2 * WSIZE))
#define SUCC(bp) ((char *)(bp - 1 * WSIZE))
/////////////////////////////////////////////////////////

static char *heap_listp = 0;  /* Pointer to first block */ 

static void *extend_heap(size_t words);
static void place(void *bp, size_t asize);
static void *find_fit(size_t asize);
static void *coalesce(void *bp);

static void *search(void *bp);
static void insert(void *p, void *bp);
static void move(void *old, void *new);
static void change(void *before, void *after);
static void delete(void *bp);

static void info(void *bp);
//////////////////////////////////////////////////////

/*
 * mm_init - initialize the malloc package.
 */
int mm_init(void)
{
    /* Create the initial empty heap */
    if ((heap_listp = mem_sbrk(10*WSIZE)) == (void *)-1) //line:vm:mm:begininit
        return -1;

    PUT(heap_listp, 0);                      /* Alignment padding */
    PUT(heap_listp + (1*WSIZE), PACK(3*DSIZE, 1));          /* Prologue header */
    PUT(heap_listp + (2*WSIZE), 0);                       /* Prologue pred */
    PUT(heap_listp + (3*WSIZE), 0);  /* Prologue succ */
    PUT(heap_listp + (4*WSIZE), 0);              /* Prologue CONT */
    PUT(heap_listp + (5*WSIZE), 0);              /* Prologue CONT */
    PUT(heap_listp + (6*WSIZE), PACK(3*DSIZE, 1)); /* Prologue footer */ 
    PUT(heap_listp + (7*WSIZE), PACK(0, 1));     /* Epilogue header */
    PUT(heap_listp + (8*WSIZE), 0);     /* Epliogue pred */
    PUT(heap_listp + (9*WSIZE), 0);              /* Epliogue succ */
    
    // printf("init! heap_listp: %x\n", heap_listp);
    heap_listp += (4*WSIZE);                     //line:vm:mm:endinit  

    /* Extend the empty heap with a free block of CHUNKSIZE bytes */ 
    void *A = extend_heap(CHUNKSIZE/WSIZE);
    if (A == NULL){
        return -1;
    } 
    return 0;    
}

/*
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size)
{
    size_t asize;      /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    char *bp;      
    
    if (heap_listp == 0){
        mm_init();
    }

    /* Ignore spurious requests */
    if (size == 0)
        return NULL;

    /* Adjust block size to include overhead and alignment reqs. */
    /* allocate from memory */
    if (size <= DSIZE)                                          
        asize = 3 * DSIZE; // head(4)+pred(4)+succ(4)+foot(4)+size
    else
        asize = DSIZE * ((size + 2 * (DSIZE) + (DSIZE - 1)) / DSIZE); 
    
    bp = find_fit(asize);
    // printf("malloc! size: %x    \n", size);
    
    if (bp != NULL){
        place(bp, asize);
        // printf("malloc! found! site: %x\n", bp);
        return bp;
    }
    
    /* No fit found. Get more memory and place the block */
    extendsize = MAX(asize, CHUNKSIZE); 
    bp = extend_heap(extendsize / WSIZE);
    // printf("malloc! not found! site: %x\n", bp);
    if (bp == NULL){
        return NULL;
    }
    place(bp, asize);
                   
    return bp;
}

/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr)
{
    
    if (ptr == 0) 
        return;
    size_t size = GET_SIZE(HDRP(ptr));
    // printf("free! ptr: %x    ", ptr);
    // printf("free! size: %x\n", size);

    if (heap_listp == 0){
        mm_init();
    }
    
    PUT(HDRP(ptr), PACK(size, 0));
    PUT(FTRP(ptr), PACK(size, 0));
    PUT(PRED(ptr), 0);
    PUT(SUCC(ptr), 0);
    
    coalesce(ptr);
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size)
{  
    size_t oldsize;
    void *newptr;

    /* If size == 0 then this is just free, and we return NULL. */
    if (size == 0) {
        mm_free(ptr);
        return 0;
    }

    /* If oldptr is NULL, then this is just malloc. */
    if (ptr == NULL) {
        return mm_malloc(size);
    }
    // printf("heap_listp: %x\n", heap_listp);
    // printf("realloc! ptr: %x, size: %x\n", ptr, size);
    newptr = mm_malloc(size);

    /* If realloc() fails the original block is left untouched  */
    if (!newptr) {
        return 0;
    }

    /* Copy the old data. */
    oldsize = GET_SIZE(HDRP(ptr));
    if (size < oldsize){
        oldsize = size;
    } 
    memcpy(newptr, ptr, oldsize);

    /* Free the old block. */
    mm_free(ptr);

    return newptr;
}

/* affiliate function*/
/* 
 * extend_heap - Extend heap with free block and return its block pointer
 */
static void *extend_heap(size_t words) 
{
    char *bp;
    size_t size;

    /* Allocate an even number of words to maintain alignment */
    size = (words % 2) ? (words + 1) * WSIZE : words * WSIZE; //line:vm:mm:beginextend
    if ((long)(bp = mem_sbrk(size)) == -1)  
        return NULL;                                        //line:vm:mm:endextend

    /* the address of bp equals to heap_listp */
    /* Initialize free block header/footer and the epilogue header */    
    PUT(HDRP(bp), PACK(size, 0));         /* Free block header */   //line:vm:mm:freeblockhdr
    PUT(FTRP(bp), PACK(size, 0));         /* Free block footer */   //line:vm:mm:freeblockftr    
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); /* New epilogue header */ //line:vm:mm:newepihdr
    PUT(PRED(NEXT_BLKP(bp)), 0);
    PUT(SUCC(NEXT_BLKP(bp)), 0);
    
    PUT(PRED(bp), 0); 
    PUT(SUCC(bp), 0); 
    // info(bp);
    /* Coalesce if the previous block was free */
    return coalesce(bp);                                          //line:vm:mm:returnblock
}

/*
 * coalesce - Boundary tag coalescing. Return ptr to coalesced block
 */
static void *coalesce(void *bp) 
{
    // info(bp);
    // printf("FTRP(PREV_BLKP(bp)): %x\n", (int)FTRP(PREV_BLKP(bp)));
    size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp)));
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));

    // printf("heap_listp: %x\n", heap_listp);
    // printf("PREV_BLKP: %x    NEXT_BLKP: %x    prev_alloc: %x    next_alloc: %x\n", PREV_BLKP(bp), NEXT_BLKP(bp), prev_alloc, next_alloc);
    
    // arranged by the location in order
    if (prev_alloc && next_alloc) {            /* Case 1, may be free or malloc */
        void *p = search(bp);
        insert(p, bp);
    }

    else if (prev_alloc && !next_alloc) {      /* Case 2, only free */
        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        // next block's pred and succ will be the pred and succ
        move(NEXT_BLKP(bp), bp);
        PUT(HDRP(bp), PACK(size, 0));
        PUT(FTRP(bp), PACK(size,0));
    }

    else if (!prev_alloc && next_alloc) {      /* Case 3, may be free or malloc */
        size += GET_SIZE(HDRP(PREV_BLKP(bp)));
        // combine the next block with the current block
        // change(PREV_BLKP(bp), bp);
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }

    else {                                     /* Case 4, only free */
        size += GET_SIZE(HDRP(PREV_BLKP(bp))) + 
            GET_SIZE(FTRP(NEXT_BLKP(bp)));
        // so is the same
        //change(PREV_BLKP(bp), NEXT_BLKP(bp));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    return bp;
}

/* 
 * place - Place block of asize bytes at start of free block bp 
 *         and split if remainder would be at least minimum block size
 */
static void place(void *bp, size_t asize)
{
    size_t csize = GET_SIZE(HDRP(bp));   

    if ((csize - asize) >= (3*DSIZE)) { 
        /* don't need to care about pred and succ */
        PUT(HDRP(bp), PACK(asize, 1));
        PUT(FTRP(bp), PACK(asize, 1));
        
        /* process pred and succ, change node */    
        move(bp, NEXT_BLKP(bp));
        PUT(PRED(bp), 0);
        PUT(SUCC(bp), 0);
        // printf("begin\n");
        // info(bp);
        bp = NEXT_BLKP(bp);
        PUT(HDRP(bp), PACK(csize-asize, 0));
        PUT(FTRP(bp), PACK(csize-asize, 0));
    }
    else { 
        PUT(HDRP(bp), PACK(csize, 1));
        PUT(FTRP(bp), PACK(csize, 1));
        delete(bp);
    }
}

/* 
 * find_fit - Find a fit for a block with asize bytes 
 */
static void *find_fit(size_t asize)
{
    void *p = heap_listp;
    while (p != NULL) {
        // printf("p size: %x\n", GET_ALLOC(HDRP(p)));
        // printf("heap_listp: %x\n", heap_listp);
        if (!GET_ALLOC(HDRP(p)) && (asize <= GET_SIZE(HDRP(p)))) {
            return p;
        }
        p = GET(SUCC(p));
    }
    return NULL; /* No fit */
}

static void *search(void *bp){
    void *p = heap_listp;
    while (p != NULL && GET(SUCC(p)) != NULL){
        if (p < bp && bp < GET(SUCC(p))){
            break;
        }
        p = GET(SUCC(p));
    }
    return p;
}

/* insert bp behind p */
static void insert(void *p, void *bp){
    if (GET(SUCC(p)) == NULL){
        PUT(SUCC(bp), 0);
    }
    else{
        PUT(PRED(GET(SUCC(p))), bp);
        PUT(SUCC(bp), GET(SUCC(p)));
    }
    PUT(PRED(bp), p);
    PUT(SUCC(p), bp);
}

static void move(void *old, void *new){
    PUT(SUCC(new), GET(SUCC(old)));
    if (GET(SUCC(old)) != NULL){
        PUT(PRED(GET(SUCC(old))), new);
    }
    PUT(PRED(new), GET(PRED(old)));
    PUT(SUCC(GET(PRED(old))), new);

    PUT(PRED(old), 0);
    PUT(SUCC(old), 0);
}

static void change(void *before, void *after){
    if (GET(SUCC(after)) != NULL){
        PUT(PRED(GET(SUCC(after))), before);
    }
    PUT(SUCC(before), GET(SUCC(after)));
}

static void delete(void *bp){
    if (GET(SUCC(bp)) != NULL){
        PUT(PRED(GET(SUCC(bp))), GET(PRED(bp)));
    }
    PUT(SUCC(GET(PRED(bp))), GET(SUCC(bp)));
    PUT(PRED(bp), 0);
    PUT(SUCC(bp), 0);
}

static void info(void *bp){
    printf("bp: %x    ", (int)bp);
    printf("HDRP: %x    ", (int)HDRP(bp));
    printf("FTRP: %x\n", (int)FTRP(bp));
    printf("alloc: %x    ", (int)GET_ALLOC(HDRP(bp)));
    printf("size: %x    ", (int)GET_SIZE(HDRP(bp)));
    printf("prev_blkp: %x    ",(int)PREV_BLKP(bp));
    printf("next_blkp: %x\n",(int)NEXT_BLKP(bp));
    printf("GET_PRED: %x    ", (int)GET(PRED(bp)));
    printf("GET_SUCC: %x    \n", (int)GET(SUCC(bp)));
}