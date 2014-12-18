package Dist::Zilla::Plugin::OSPrereqs::Unix;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Perl::osnames;

use Moose;
extends 'Dist::Zilla::Plugin::OSPrereqs';

use namespace::autoclean;

sub BUILDARGS {
    my ($class, @arg) = @_;
    $self->SUPER::BUILDARGS(@arg, _prereq=>"~(linux|bsd)");
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: List prereqs for Unix

=for Pod::Coverage .+

=head1 SYNOPSIS

In dist.ini:

 [OSPrereqs::Unix]


=head1 DESCRIPTION

This module is a subclass of L<Dist::Zilla::Plugin::OSPrereqs>. It is a shortcut
for doing:

 [OSPrereqs / ~^(linux|freebsd|darwin|...)$]

The list of Unix operating systems is retrieved from L<Perl::osnames>.


=head1 SEE ALSO

L<Dist::Zilla::Plugin::OSPrereqs>

L<Perl::osnames>
