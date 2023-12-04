use LWP::Simple;
use HTML::TreeBuilder;

my $url = 'https://www.example.com/';
my $response = get($url);

if (defined $response) {
    my $html = $response;

    my $tree = HTML::TreeBuilder->new;
    $tree->parse($html);

    my @p_tags = $tree->look_down(_tag => 'p');
    my $p_tag_text = join(' ', map { $_->as_text } @p_tags);

    print "Text inside <p> tags: $p_tag_text\n";
} else {
    print "Failed to retrieve the webpage.\n";
}
