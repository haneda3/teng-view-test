use strict;
use warnings;
use utf8;
use Teng;
use Teng::Schema::Loader;
use Teng::Schema::Dumper;
use DDP;

my $dsn    = 'dbi:mysql:view_test';
my $user   = 'root';
my $passwd = '';

my $dbh = DBI->connect($dsn, $user, $passwd, {
        'mysql_enable_utf8' => 1,
    });

print Teng::Schema::Dumper->dump(
        dbh       => $dbh,
        namespace => 'App::DB',
    );
