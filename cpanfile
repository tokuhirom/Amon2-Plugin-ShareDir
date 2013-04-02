requires 'parent'                        => '0';
requires 'File::ShareDir';
requires 'if';
requires 'MRO::Compat';
requires 'Amon2' => '3.76';

on 'test' => sub {
    requires 'Test::More' => '0.98';
    requires 'Test::Requires' => 0;
};

on 'devel' => sub {
    # Dependencies for developers
};
