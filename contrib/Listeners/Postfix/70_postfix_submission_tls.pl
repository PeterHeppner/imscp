# i-MSCP iMSCP::Listener::Postfix::Submission::TLS listener file
# Copyright (C) 2017-2018 Laurent Declercq <l.declercq@nuxwin.com>
# Copyright (C) 2015-2017 Rene Schuster <mail@reneschuster.de>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA

#
## Enforces TLS connection on Postfix submission.
#

package iMSCP::Listener::Postfix::Submission::TLS;

our $VERSION = '1.0.2';

use strict;
use warnings;
use iMSCP::EventManager;
use iMSCP::Servers::Mta;
use version;

#
## Please, don't edit anything below this line
#

version->parse( "$::imscpConfig{'PluginApi'}" ) >= version->parse( '1.5.1' ) or die(
    sprintf( "The 70_postfix_submission_tls.pl listener file version %s requires i-MSCP >= 1.6.0", $VERSION )
);

if ( index( $::imscpConfig{'iMSCP::Servers::Mta'}, '::Postfix::' ) != -1 ) {
    iMSCP::EventManager->getInstance()->register(
        'afterPostfixBuildConfFile',
        sub {
            my ($cfgTpl, $cfgTplName) = @_;

            return unless $cfgTplName eq 'master.cf';

            # Redefine submission service
            # According MASTER(5)), when multiple lines specify the same service
            # name and type, only the last one is remembered.
            ${$cfgTpl} .= <<'EOF';
# Redefines submission service to enforce TLS
submission inet n       -       y       -       -       smtpd
 -o smtpd_tls_security_level=encrypt
 -o smtpd_sasl_auth_enable=yes
 -o smtpd_client_restrictions=permit_sasl_authenticated,reject
EOF
        }
    )->register(
        'afterPostfixConfigure',
        sub {
            # smtpd_tls_security_level=encrypt means mandatory.
            # Make sure to disable vulnerable SSL versions
            iMSCP::Servers::Mta->factory()->postconf(
                smtpd_tls_mandatory_protocols => { values => [ '!SSLv2', '!SSLv3' ] }
            );
        },
        -99
    );
}

1;
__END__
