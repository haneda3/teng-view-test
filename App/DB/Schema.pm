package App::DB::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;

table {
    name 'article';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'blog_id', type => 4},
        {name => 'title', type => 12},
        {name => 'content', type => 12},
        {name => 'created_at', type => 4},
    );
};

table {
    name 'blog';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'name', type => 12},
    );
};

table {
    name 'articles';
    columns (
        {name => 'id', type => 4},
        {name => 'title', type => 12},
        {name => 'content', type => 12},
        {name => 'created_at', type => 4},
        {name => 'blog_id', type => 4},
        {name => 'blog_name', type => 12},
    );
};


1;
