package Bot::IRC::X::ManagementSpeak;
# ABSTRACT: Bot::IRC plugin for rendering management-speak

use 5.012;
use strict;
use warnings;

use Lingua::ManagementSpeak;

# VERSION

sub init {
    my ($bot) = @_;

    my $ms = Lingua::ManagementSpeak->new;

    $bot->hook(
        {
            to_me => 1,
            text  => qr/^mspeak/i,
        },
        sub {
            my ( $bot, $in, $m ) = @_;
            $bot->reply( $ms->paragraph(4) );
        },
    );

    $bot->helps( mspeak => 'Return managerial-sounding text. Usage: <bot> mspeak.' );
}

1;
__END__
=pod

=begin :badges

=for markdown
[![Build Status](https://travis-ci.org/gryphonshafer/Bot-IRC-X-ManagementSpeak.svg)](https://travis-ci.org/gryphonshafer/Bot-IRC-X-ManagementSpeak)
[![Coverage Status](https://coveralls.io/repos/gryphonshafer/Bot-IRC-X-ManagementSpeak/badge.png)](https://coveralls.io/r/gryphonshafer/Bot-IRC-X-ManagementSpeak)

=end :badges

=head1 SYNOPSIS

    use Bot::IRC;

    Bot::IRC->new(
        connect => { server => 'irc.perl.org' },
        plugins => ['ManagementSpeak'],
    )->run;

=head1 DESCRIPTION

This L<Bot::IRC> plugin is for rendering management-speak.

    <bot> mspeak

=head1 SEE ALSO

You can look for additional information at:

=for :list
* L<Bot::IRC>
* L<GitHub|https://github.com/gryphonshafer/Bot-IRC-X-ManagementSpeak>
* L<CPAN|http://search.cpan.org/dist/Bot-IRC-X-ManagementSpeak>
* L<MetaCPAN|https://metacpan.org/pod/Bot::IRC::X::ManagementSpeak>
* L<AnnoCPAN|http://annocpan.org/dist/Bot-IRC-X-ManagementSpeak>
* L<Travis CI|https://travis-ci.org/gryphonshafer/Bot-IRC-X-ManagementSpeak>
* L<Coveralls|https://coveralls.io/r/gryphonshafer/Bot-IRC-X-ManagementSpeak>
* L<CPANTS|http://cpants.cpanauthors.org/dist/Bot-IRC-X-ManagementSpeak>
* L<CPAN Testers|http://www.cpantesters.org/distro/T/Bot-IRC-X-ManagementSpeak.html>

=for Pod::Coverage init

=cut
