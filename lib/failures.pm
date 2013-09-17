use v5.10;
use strict;
use warnings;

package failures;
# ABSTRACT: No abstract given for failures
# VERSION

sub import {
    my ( $class, @failures ) = @_;
    for my $f (@failures) {
        my $fragment = 'failure';
        for my $p ( split /::/, $f ) {
            no strict 'refs';
            @{"$fragment\::$p\::ISA"} = $fragment;
            $fragment .= "::$p";
        }
    }
}

package failure;

sub throw {
    my ($invocant) = @_;
    die( ref $invocant ? $invocant : bless( {}, $invocant ) );
}

1;

=for Pod::Coverage BUILD

=head1 SYNOPSIS

    use failures;

=head1 DESCRIPTION

This module might be cool, but you'd never know it from the lack
of documentation.

=head1 USAGE

Good luck!

=head1 SEE ALSO

=for :list
* Maybe other modules do related things.

=cut

# vim: ts=4 sts=4 sw=4 et:
