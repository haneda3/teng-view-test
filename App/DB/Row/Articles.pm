package App::DB::Row::Articles;
use strict;
use warnings;
use parent 'Teng::Row';

sub title_hoge {
    my ($self) = @_;

    return $self->title . ' is hage';
}

1;

