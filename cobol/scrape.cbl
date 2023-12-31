IDENTIFICATION DIVISION.
PROGRAM-ID. Web-Scrape.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 HTML-Data PIC X(10000).

PROCEDURE DIVISION.
    MOVE "https://www.example.com/" TO URL-STRING.
    CALL 'CURL' USING URL-STRING HTML-Data.

    INSPECT HTML-Data REPLACING ALL '<p>' BY ''.

    DISPLAY "Text inside <p> tags: " HTML-Data.

    STOP RUN.
