require 5.008;
use Config;
use ExtUtils::MakeMaker;

if (!$Config{useperlio}) {
    warn <<WHOA
*** WHOA THERE!!! ***
This is not a perlio-enabled perl !
WHOA
}

WriteMakefile(
    NAME	    => 'IOLayer::StripHTML',
    VERSION_FROM    => 'lib/IOLayer/StripHTML.pm',
    PREREQ_PM	    => {
	'HTML::Parser' => 3.00,
    },
);
