# NAME

Amon2::Plugin::ShareDir - (EXPERIMENTAL) share directory

# SYNOPSIS

    # MyApp.pm
    __PACKAGE__->load_plugin('ShareDir');

    # in your app
    my $tmpl_path = catdir(MyApp->share_dir(), 'tmpl');

# DESCRIPTION

Put assets to share/ directory. Please look [Ukigumo::Agent](http://search.cpan.org/perldoc?Ukigumo::Agent) for example.

__THIS IS A DEVELOPMENT RELEASE. API MAY CHANGE WITHOUT NOTICE__.

# STRATEGY

- use catdir($c->base\_dir, 'share') if not installed to system
- use dist\_dir($dist\_naem) if installed to system

# AUTHOR

Tokuhiro Matsuno <tokuhirom AAJKLFJEF@ GMAIL COM>

# SEE ALSO

[Amon2](http://search.cpan.org/perldoc?Amon2), [File::ShareDir](http://search.cpan.org/perldoc?File::ShareDir)

# LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
