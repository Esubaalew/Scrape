:- use_module(library(http/http_client)).
:- use_module(library(sgml)).

fetch_p_text(URL, PText) :-
    http_open(URL, In, []),
    load_html(In, DOM, []),
    xpath(DOM, //p(text), PText).

main :-
    URL = 'https://www.example.com/',
    fetch_p_text(URL, PText),
    writeln(PText).
