use strict;
use warnings;
use Data::Dumper;
#use DBIx::QueryLog;

use App::DB;

my $dsn    = 'dbi:mysql:view_test';
my $user   = 'root';
my $passwd = '';

my $dbh = DBI->connect($dsn, $user, $passwd, {
        'mysql_enable_utf8' => 1,
    });
my $teng = App::DB->new(+{dbh => $dbh});

my @rows = $teng->search('article', +{}, +{order_by => 'created_at desc', limit => 10000})->all;
for my $row (@rows) {
    print $row->id . ' ' .  $row->title_hoge . ' ' . $row->created_at . ' ' . $row->blog_name . ' ' . "\n";
}

