#include <stdio.h>
#include "csapp.h"

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

/* You won't lose style points for including this long line in your code */
typedef struct{
    char host[MAXLINE];
    char port[MAXLINE];
    char path[MAXLINE];
}uri_data;

void doit(int fd);
void read_requesthdrs(rio_t *rp);
void build_header(char *server, uri_data *res, rio_t *rio);
void parse_uri(char *uri, uri_data *res);
void serve_static(int fd, char *filename, int filesize);
void get_filetype(char *filename, char *filetype);
void serve_dynamic(int fd, char *filename, char *cgiargs);
void clienterror(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg);
static const char *user_agent_hdr = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";

int main(int argc, char **argv){
    int listenfd, connfd;
    char hostname[MAXLINE], port[MAXLINE];
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;
    printf("%s", user_agent_hdr);

    /* Check command line args */
    if (argc != 2){
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(1);
    }

    listenfd = Open_listenfd(argv[1]);
    while (1){
        clientlen = sizeof(clientaddr);
        connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
        Getnameinfo((SA *)&clientaddr, clientlen, hostname, MAXLINE,
                    port, MAXLINE, 0);
        printf("Accepted connection from (%s, %s)\n", hostname, port);
        doit(connfd);
        Close(connfd);
    }
}

/*
 * doit - handle one HTTP request/response transaction
 */
void doit(int fd){
    char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];
    char server[MAXLINE];
    int clientfd;
    rio_t rio, server_rio;
    uri_data *res = (uri_data*)malloc(sizeof(uri_data));

    /* Read request line and headers */
    Rio_readinitb(&rio, fd);
    if (!Rio_readlineb(&rio, buf, MAXLINE))
        return;
    printf("%s", buf);
    sscanf(buf, "%s %s %s", method, uri, version);
    if (strcasecmp(method, "GET")){
        clienterror(fd, method, "501", "Not Implemented",
                    "Proxy does not implement this method");
        return;
    }                       

    /* Parse URI from GET request */
    parse_uri(uri, res);

    // build request header
    // why should design like this?
    build_header(server, res, &rio);

    // connect to the web server
    clientfd = Open_clientfd(res->host, res->port);
    Rio_readinitb(&server_rio, clientfd);

    size_t n;
    while((n = Rio_readlineb(&server_rio, buf, MAXLINE)) != 0){
        Rio_writen(fd, buf, n);
    }
    Close(clientfd);
}

void parse_uri(char *uri, uri_data *res){
    // uri like: http://localhost:15213/home.html
    // not res->port = 80;

    char *host = strstr(uri, "//");
    if (host == NULL){
        char *path = strstr(uri, "/");
        if (path != NULL){
            strcpy(res->path, path);
        }
        strcpy(res->port, "80");
    }
    else{
        char *port = strstr(host + 2, ":");
        strcpy(res->host, host + 2);
        if (port != NULL){ 
            sscanf(port + 1, "%d%s", res->port, res->path);
            *port = "\0";
        }
        else{
            char *path = strstr(host + 2, "/");
            if (path != NULL){ 
                strcpy(res->path, path);
                strcpy(res->port, "80");
                *path = "\0";
            }
        }
    }
    return;
}

void build_header(char *server, uri_data *res, rio_t *rio){
    
}