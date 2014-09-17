use strict;
use warnings;
use Data::Dumper;
use String::Random;

use App::DB;

my $dsn    = 'dbi:mysql:view_test';
my $user   = 'root';
my $passwd = '';

my $dbh = DBI->connect($dsn, $user, $passwd, {
        'mysql_enable_utf8' => 1,
    });

my $teng = App::DB->new(+{dbh => $dbh});

$teng->delete('blog');
$teng->delete('article');

my @blogs;
for my $i (1..256) {
    push(@blogs, +{id => $i, name => "name$i"});
}

$teng->bulk_insert('blog', \@blogs);

for my $m (0 .. 255) {
    my @articles;
    for my $i (1 .. 256) {
        my $title   = String::Random->new->randregex('[A-Za-z0-9]{16}');
        my $content = String::Random->new->randregex('[A-Za-z0-9]{32}');
        push(
            @articles,
            +{  id      => $m * 256 + $i,
                blog_id => $i,
                title   => $title,
                content => $content,
                created_at => int(rand(10000000)),
            }
        );
    }
    $teng->bulk_insert('article', \@articles);
}

