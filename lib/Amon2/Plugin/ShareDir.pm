package Amon2::Plugin::ShareDir;
use strict;
use warnings;
use 5.008005;
use version; our $VERSION = version->declare("v0.0.7");

use File::Spec;
use File::ShareDir;
use if $] < 5.009_005, 'MRO::Compat';
use List::Util qw(first);
use Amon2::Util;

sub init {
    my ($class, $c, $conf) = @_;
    Amon2::Util::add_method($c, 'share_dir', \&_share_dir);
}

our %SHARE_DIR_CACHE;
sub _share_dir {
    my $c = shift;
    my $klass = ref $c || $c;

    $SHARE_DIR_CACHE{$klass} ||= sub {
        my $d1 = File::Spec->catfile($c->base_dir, 'share');
        return $d1 if -d $d1;

        my $dist = first { $_ ne 'Amon2' && $_ ne 'Amon2::Web' && $_->isa('Amon2') } reverse @{mro::get_linear_isa(ref $c || $c)};
           $dist =~ s!::!-!g;
        my $d2 = File::ShareDir::dist_dir($dist);
        return $d2 if -d $d2;

        Carp::croak "Cannot find assets path($d1, $d2).";
    }->();
}

1;
__END__

=encoding utf8

=head1 NAME

Amon2::Plugin::ShareDir - (EXPERIMENTAL) share directory

=head1 SYNOPSIS

    # MyApp.pm
    __PACKAGE__->load_plugin('ShareDir');

    # in your app
    my $tmpl_path = catdir(MyApp->share_dir(), 'tmpl');

=head1 DESCRIPTION

Put assets to share/ directory. Please look L<Ukigumo::Agent> for example.

B<THIS IS A DEVELOPMENT RELEASE. API MAY CHANGE WITHOUT NOTICE>.

=head1 STRATEGY

=over 4

=item C<< use catdir($c->base_dir, 'share') >> if not installed to system

=item use C<< dist_dir($dist_name) >> if installed to system

=back

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF@ GMAIL COME<gt>

=head1 SEE ALSO

L<Amon2>, L<File::ShareDir>

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
