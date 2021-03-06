=head1 NAME

iMSCP::Packages::Webstats::Awstats::Installer - i-MSCP AWStats package installer

=cut

# i-MSCP - internet Multi Server Control Panel
# Copyright (C) 2010-2018 Laurent Declercq <l.declercq@nuxwin.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

package iMSCP::Packages::Webstats::Awstats::Installer;

use strict;
use warnings;
use iMSCP::Debug qw/ error /;
use iMSCP::Dir;
use iMSCP::File;
use iMSCP::File::Attributes qw/ :immutable /;
use iMSCP::Servers::Cron;
use iMSCP::Servers::Httpd;
use version;
use parent 'iMSCP::Common::Singleton';

=head1 DESCRIPTION

 AWStats package installer.

 See iMSCP::Packages::Webstats::Awstats::Awstats for more information.

=head1 PUBLIC METHODS

=over 4

=item install( )

 Process install tasks

 Return void, die on failure

=cut

sub install
{
    my ( $self ) = @_;

    $self->_disableDefaultConfig();
    $self->_createCacheDir();
    $self->_setupApache();
    $self->_cleanup();
}

=item postinstall( )

 Process post install tasks

 Return void, die on failure

=cut

sub postinstall
{
    my ( $self ) = @_;

    $self->_addAwstatsCronTask();
}

=back

=head1 PRIVATE METHODS

=over 4

=item _init( )

 Initialize instance

 Return iMSCP::Packages::Webstats::Awstats::Installer

=cut

sub _init
{
    my ( $self ) = @_;

    $self->{'httpd'} = iMSCP::Servers::Httpd->factory();
    $self;
}

=item _disableDefaultConfig( )

 Disable default configuration

 Return void, die on failure

=cut

sub _disableDefaultConfig
{
    return unless $::imscpConfig{'DISTRO_FAMILY'} eq 'Debian';

    if ( -f "$::imscpConfig{'AWSTATS_CONFIG_DIR'}/awstats.conf" ) {
        iMSCP::File->new( filename => "$::imscpConfig{'AWSTATS_CONFIG_DIR'}/awstats.conf" )->move(
            "$::imscpConfig{'AWSTATS_CONFIG_DIR'}/awstats.conf.disabled"
        );
    }

    if ( -f '/etc/cron.d/awstats.disable' ) {
        # Transitional -- Will be removed in a later release
        iMSCP::File->new( filename => '/etc/cron.d/awstats.disable' )->move( '/etc/cron.d/awstats' );
    }

    iMSCP::Servers::Cron->factory()->disableSystemTask( 'awstats', 'cron.d' );
}

=item _createCacheDir( )

 Create cache directory

 Return void, die on failure

=cut

sub _createCacheDir
{
    my ( $self ) = @_;

    iMSCP::Dir->new( dirname => $::imscpConfig{'AWSTATS_CACHE_DIR'} )->make( {
        user  => $::imscpConfig{'ROOT_USER'},
        group => $self->{'httpd'}->getRunningGroup(),
        mode  => 02750
    } );
}

=item _setupApache( )

 Setup Apache for AWStats

 Return void, die on failure

=cut

sub _setupApache
{
    my ( $self ) = @_;

    # Create Basic authentication file
    iMSCP::File
        ->new( filename => "$self->{'httpd'}->{'config'}->{'HTTPD_CONF_DIR'}/.imscp_awstats" )
        ->set( '' ) # Make sure to start with an empty file on update/reconfiguration
        ->save()
        ->owner( $::imscpConfig{'ROOT_USER'}, $self->{'httpd'}->getRunningGroup())
        ->mode( 0640 );

    $self->{'httpd'}->enableModules( 'authn_socache' );
    $self->{'httpd'}->buildConfFile(
        "$::imscpConfig{'ENGINE_ROOT_DIR'}/PerlLib/iMSCP/Packages/Webstats/Awstats/Config/01_awstats.conf",
        "$self->{'httpd'}->{'config'}->{'HTTPD_SITES_AVAILABLE_DIR'}/01_awstats.conf",
        undef,
        {
            AWSTATS_AUTH_USER_FILE_PATH => "$self->{'httpd'}->{'config'}->{'HTTPD_CONF_DIR'}/.imscp_awstats",
            AWSTATS_ENGINE_DIR          => $::imscpConfig{'AWSTATS_ENGINE_DIR'},
            AWSTATS_WEB_DIR             => $::imscpConfig{'AWSTATS_WEB_DIR'}
        }
    );
    $self->{'httpd'}->enableSites( '01_awstats.conf' );
}

=item _addAwstatsCronTask( )

 Add AWStats cron task for dynamic mode

 Return void, die on failure

=cut

sub _addAwstatsCronTask
{
    iMSCP::Servers::Cron->factory()->addTask( {
        TASKID  => 'iMSCP::Packages::Webstats::Awstats',
        MINUTE  => '15',
        HOUR    => '3-21/6',
        DAY     => '*',
        MONTH   => '*',
        DWEEK   => '*',
        USER    => $::imscpConfig{'ROOT_USER'},
        COMMAND => 'nice -n 10 ionice -c2 -n5 ' .
            "perl $::imscpConfig{'ENGINE_ROOT_DIR'}/PerlLib/iMSCP/Packages/Webstats/Awstats/Scripts/awstats_updateall.pl now " .
            "-awstatsprog=$::imscpConfig{'AWSTATS_ENGINE_DIR'}/awstats.pl > /dev/null 2>&1"
    } );
}

=item _cleanup()

 Process cleanup tasks

 Return void, die on failure

=cut

sub _cleanup
{
    my ( $self ) = @_;

    for my $dir ( iMSCP::Dir->new( dirname => $::imscpConfig{'USER_WEB_DIR'} )->getDirs() ) {
        next unless -d "$::imscpConfig{'USER_WEB_DIR'}/$dir/statistics";
        clearImmutable( "$::imscpConfig{'USER_WEB_DIR'}/$dir" );
        iMSCP::Dir->new( dirname => "/var/www/virtual/$dir/statistics" )->remove();
    }
}

=back

=head1 AUTHOR

 Laurent Declercq <l.declercq@nuxwin.com>

=cut

1;
__END__
