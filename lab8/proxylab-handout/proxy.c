#include <stdio.h>
#include "csapp.h"
#include "sbuf.h"

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

/* client request */
#define MAX_METHOD_LEN 8
#define MAX_HOST_LEN 2048
#define MAX_PORT_LEN 8
#define MAX_PATH_LEN 2048
#define MAX_VERSION_LEN 16
#define MAX_NAME_LEN 32
#define MAX_VALUE_LEN 256
#define MAX_HEADER_NUM 16

/* concurrency */
#define NTHREADS 4
#define SBUFSIZE 16

sbuf_t sbuf;

typedef struct{
    char method[MAX_METHOD_LEN];
    char host[MAX_HOST_LEN];
    char port[MAX_PORT_LEN];
    char path[MAX_PATH_LEN];
    char version[MAX_VERSION_LEN];
}RequestLine;
// like GET http://localhost:15213/home.html HTTP/1.0
// or GET http://www.cmu.edu/hub/index.html HTTP/1.1

typedef struct{
    char name[MAX_NAME_LEN];
    char value[MAX_VALUE_LEN];
}RequestHeader;
// Host: example.com
// User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36
// Content-Type: application/json
// Authorization: Bearer token12345

typedef struct{
    // one request line, many request headers
    RequestLine request_line;
    RequestHeader request_header[MAX_HEADER_NUM];
    int request_header_num;
}Request;

typedef struct{
    int valid;
    char request[MAXLINE];
    char response[MAXLINE];
    int time_stamp;
}CachePair;

typedef struct{
    sem_t mutex;
    CachePair *cache_set;
    int cache_num; 
}Cache;

/* You won't lose style points for including this long line in your code */
void doit(int fd);
void read_request(int fd, Request *request);
void read_request_line(rio_t *rio, char *buf, RequestLine *request_line);
void parse_uri(char *uri, RequestLine *request_line);
void read_request_header(rio_t *rio, char *buf, RequestHeader *request_header);
int send_request(Request *request);
void forward_response(int fd, int clientfd);
void sigpipe_handler(int sig);
void *thread(void *vargp);
static const char *user_agent_hdr = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";

int main(int argc, char **argv){
    int listenfd, connfd;
    char hostname[MAXLINE], port[MAXLINE];
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;
    pthread_t tid;

    /* Check command line args */
    if (argc != 2){
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(1);
    }
    Signal(SIGPIPE, sigpipe_handler);

    sbuf_init(&sbuf, SBUFSIZE);
    for (int i = 0; i < NTHREADS; i++){
        Pthread_create(&tid, NULL, thread, NULL);
    }

    listenfd = Open_listenfd(argv[1]);
    while (1){
        clientlen = sizeof(clientaddr);
        connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
        sbuf_insert(&sbuf, connfd);
        Getnameinfo((SA *)&clientaddr, clientlen, hostname, MAXLINE,
                    port, MAXLINE, 0);
        printf("Accepted connection from (%s, %s)\n", hostname, port);
        // doit(connfd);
        // Close(connfd);
    }
    exit(0);
}

void *thread(void *vargp){
    Pthread_detach(pthread_self());
    while(1){
        int connfd = sbuf_remove(&sbuf);
        doit(connfd);
        Close(connfd);
    }
}

/*
 * doit - handle one HTTP request/response transaction
 */
void doit(int fd){
    Request request;
    read_request(fd, &request);
    int clientfd = send_request(&request);
    forward_response(fd, clientfd);
    Close(clientfd);
}

void read_request(int fd, Request *request){
    char buf[MAXLINE];
    rio_t rio;
    /* Read request line and headers */
    Rio_readinitb(&rio, fd);
    read_request_line(&rio, buf, &request->request_line);
    if (!Rio_readlineb(&rio, buf, MAXLINE))
        return;
    RequestHeader *header = request->request_header;
    request->request_header_num = 0;
    while(strcmp(buf, "\r\n")){
        read_request_header(&rio, buf, header++);
        request->request_header_num++;
        Rio_readlineb(&rio, buf, MAXLINE);// not Rio_readlineb(&rio, buf, strlen(buf));
    }
}

void read_request_line(rio_t *rio, char *buf, RequestLine *request_line){
    char uri[MAXLINE];
    Rio_readlineb(rio, buf, MAXLINE);
    printf("request line: %s", buf);
    if (sscanf(buf, "%s %s %s", request_line->method, uri, request_line->version) < 3){
        fprintf(stderr, "Error: invalid request line!\n");
        exit(1);
    }
    if (strcasecmp(request_line->method, "GET")) {                  
        fprintf(stderr, "Method not implemented!\n");
        exit(1);
    }
    /* Parse URI from GET request */
    parse_uri(uri, request_line);
}

void parse_uri(char *uri, RequestLine *request_line){
    // uri like: http://localhost:15213/home.html
    // not res->port = 80;
    char *port_start, *path_start;
    if (strcmp(strstr(uri, "http://"), uri)){
        fprintf(stderr, "Error: invalid uri!\n");
    }
    uri += strlen("http://");// maybe: localhost:15213/home.html
    // IF port is NULL, default 80, like this: localhost/home.html
    if ((port_start = strstr(uri, ":")) == NULL){
        strcpy(request_line->port, "80");
    }
    else{
        *port_start = '\0';// cut uri and port_start, uri may be: localhost, port_start may be: '\0'15213/home.html 
        strcpy(request_line->host, uri);
        uri = port_start + 1;// uri may be: 15213/home.html
    }

    if ((path_start = strstr(uri, "/")) == NULL){
        strcpy(request_line->path, "/");
    }
    else{
        strcpy(request_line->path, path_start);// pathstart: /home.html
        *path_start = '\0';// uri: 15213
    }

    if (port_start){
        strcpy(request_line->port, uri);
    }
    else{
        strcpy(request_line->host, uri);
    }
    return;
}

// header like these:
// Host: example.com
// User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36
// Content-Type: application/json
// Authorization: Bearer token12345
void read_request_header(rio_t *rio, char *buf, RequestHeader *request_header){
    Rio_readlineb(rio, buf, MAXLINE);
    char *t = strstr(buf, ": ");
    if (!t) {                     
        fprintf(stderr, "Error: invalid header: %s", buf);
        exit(1);
    }
    *t = '\0';
    strcpy(request_header->name, buf);
    strcpy(request_header->value, t + 2);
}

int send_request(Request *request){
    int clientfd;
    char content[MAXLINE];
    rio_t server_rio;
    RequestLine *request_line = &request->request_line;

    // connect to the web server
    clientfd = Open_clientfd(request_line->host, request_line->port);
    Rio_readinitb(&server_rio, clientfd);

    // build request header
    // first line, eg: GET /hub/index.html HTTP/1.0
    sprintf(content, "%s %s HTTP/1.0\r\n", request_line->method, request_line->path);
    Rio_writen(clientfd, content, strlen(content));
    // second line, eg: Host: www.cmu.edu
    sprintf(content, "Host: %s%s\r\n", request_line->host, request_line->port);
    Rio_writen(clientfd, content, strlen(content));    
    // third line, eg: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36
    sprintf(content, "User-Agent: %s\r\n", user_agent_hdr);
    Rio_writen(clientfd, content, strlen(content));    
    // fourth line: Connection: close
    sprintf(content, "Connection: close\r\n");
    Rio_writen(clientfd, content, strlen(content));   
    // fifth line: Proxy-Connection: close  
    sprintf(content, "Proxy-Connection: close\r\n");
    Rio_writen(clientfd, content, strlen(content));
    // other infomation that need not to change
    for (int i = 0; i < request->request_header_num; i++){
        char *name = request->request_header[i].name;
        char *value = request->request_header[i].value;
        if (!strcasecmp(name, "Host") || !strcasecmp(name, "User-Agent")
        || !strcasecmp(name, "Connection") || !strcasecmp(name, "Proxy-Connection")){
            continue;
        }
        else{
            sprintf(content, "%s%s: %s\r\n", content, name, value);
            Rio_writen(clientfd, content, strlen(content));            
        }
    }
    // terminal line
    sprintf(content, "\r\n");
    Rio_writen(clientfd, content, strlen(content));
    return clientfd;
}

void forward_response(int fd, int clientfd){
    size_t n;
    char buf[MAXLINE];
    rio_t rio;
    Rio_readinitb(&rio, clientfd);
    while ((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0){
        Rio_writen(fd, buf, n);
    }
}

void sigpipe_handler(int sig){
    fprintf(stderr, "Error: Connection reset by other hosts!");
}