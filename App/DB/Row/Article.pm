package App::DB::Row::Article;
use strict;
use warnings;
use parent 'Teng::Row';

sub title_hoge {
    my ($self) = @_;

    return $self->title . ' is hage';
}

sub blog {
    my ($self) = @_;

    return $self->{_blog} ||= $self->{teng}->single('blog', {id => $self->blog_id});
}

sub blog_name {
    my ($self) = @_;

    return $self->blog->name;
}

1;

