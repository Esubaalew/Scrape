#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    strcat((char*)userp, (char*)contents);
    return size * nmemb;
}

int main() {
    CURL *curl;
    CURLcode res;
    char url[] = "https://www.example.com/";
    char html[10000] = "";

    curl_global_init(CURL_GLOBAL_DEFAULT);
    curl = curl_easy_init();

    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, html);

        res = curl_easy_perform(curl);

        if (res != CURLE_OK)
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));

        curl_easy_cleanup(curl);
    }

    curl_global_cleanup();

    printf("Text inside <p> tags: %s\n", html);

    return 0;
}
