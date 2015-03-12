Malcom Beattie's perl compiler ("perlcc") updated to 5.10 - 5.21.3,
with most bugs fixed (also for 5.6. and 5.8) and new features added.
It compiles to C or platform-compatible Bytecode.

Releases are at http://search.cpan.org/dist/B-C/

Development is in the master branch at https://github.com/rurban/perl-compiler, the stable branch is called 'release'

Known issues: See https://code.google.com/p/perl-compiler/issues/

  * run-time attributes (e.g. use open attributes, Attribute::Handlers, ...), but ok at compile-time.

  * compile-time perlio layers are not restored

  * some compile-time side-effects can not be reproduced when running a compiled binary, such as BEGIN { chdir $dir }, i.e. most system and IO calls. use INIT {} instead.

  * Certain XS module using compile-time pointers need special workarounds:
    1. DBI patched by the compiler (#359)
    1. Encode > 2.58 (#71, #305, RT 94221), patched by the compiler
    1. Net::DNS > 0.67 (#305, RT 94069)
    1. IO::Socket::SSL > 1.995 (#317, RT 95452)
    1. DBD::mysql > 4.027 (RT 97625)
    1. Todo: FCGI, Coro, Moose with meta->make\_immutable

Mailinglist:

> http://groups.google.com/group/perl-compiler
> perl-compiler@googlegroups.com

> [irc://irc.perl.org/#compiler](irc://irc.perl.org/#compiler)

See also the https://github.com/rurban/perl-compiler mirror, which is usually a few days advanced.