#!perl

use strict;
use warnings;

use Test::More tests => 5;

BEGIN {
    use_ok('IOLayer::StripHTML');
}

chdir 't' if -d 't';

undef $/;
open my $fh, '<:Via(IOLayer::StripHTML)', '1.html'
    or die "Can't open 1.html: $!\n";
my $file = <$fh>;
close $fh;

like( $file, qr/Hello world/, 'Got some text' );
like( $file, qr/Normal and bold text/, 'Strips tags' );
unlike( $file, qr/be.ignored/, 'Ignores parts to be ignored' );
like( $file, qr/<\xe9>/, 'Translates entities' );
