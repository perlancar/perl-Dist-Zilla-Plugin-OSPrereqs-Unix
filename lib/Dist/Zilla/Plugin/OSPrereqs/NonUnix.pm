package Dist::Zilla::Plugin::OSPrereqs::NonUnix;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Perl::osnames;

use Moose;
extends 'Dist::Zilla::Plugin::OSPrereqs';

use namespace::autoclean;

sub BUILD {
    my $self = shift;

    my @os;
    {
        use experimental 'smartmatch';
        @os = sort(map {$_->[0]} grep {!("unix"~~@{$_->[1]})}
                       @$Perl::osnames::data);
    }

    $self->{prereq_os} = '~^('.join('|', map {quotemeta} @os).')$';
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: List prereqs for non-Unix OSes

=for Pod::Coverage .+

=head1 SYNOPSIS

In dist.ini:

 [OSPrereqs::NonUnix]
 Some::Module::That::Doesnt::Run::On::Unix=0
 Another::Module=1.23


=head1 DESCRIPTION

This module is a subclass of L<Dist::Zilla::Plugin::OSPrereqs>. It is a shortcut
for doing:

 [OSPrereqs / ~^(MacOS|MSWin32|...)$]
 ...

The list of non-Unix operating systems is retrieved from L<Perl::osnames>.


=head1 SEE ALSO

L<Dist::Zilla::Plugin::OSPrereqs>

L<Perl::osnames>
