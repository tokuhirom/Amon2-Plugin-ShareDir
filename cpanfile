requires 'parent'                        => '0';
requires 'File::ShareDir';
requires 'if';
requires 'MRO::Compat';
requires 'Amon2' => '3.76';

on 'configure' => sub {
    requires 'Module::Build' => '0.40';
    requires 'Module::Build::Pluggable';
    requires 'Module::Build::Pluggable::CPANfile';
    requires 'Module::Build::Pluggable::GithubMeta';
};

on 'test' => sub {
    requires 'Test::More' => '0.98';
    requires 'Test::Requires' => 0;
};

on 'devel' => sub {
    # Dependencies for developers
};
