=head1 NAME

 iMSCP::Packages::Setup::AntiRootkits::Chkrootkit::Uninstaller - i-MSCP Chkrootkit package uninstaller

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

package iMSCP::Packages::Setup::AntiRootkits::Chkrootkit::Uninstaller;

use strict;
use warnings;
use iMSCP::File;
use iMSCP::Servers::Cron;
use parent 'iMSCP::Common::Singleton';

=head1 DESCRIPTION

 Chkrootkit package uninstaller.

=head1 PUBLIC METHODS

=over 4

=item uninstall( )

 Process uninstall tasks

 Return void, die on failure

=cut

sub uninstall
{
    $_[0]->_restoreDebianConfig();
}

=back

=head1 PRIVATE METHODS

=over 4

=item _restoreDebianConfig( )

 Restore default configuration

 Return void, die on failure

=cut

sub _restoreDebianConfig
{
    iMSCP::Servers::Cron->factory()->enableSystemTask( 'chkrootkit', 'cron.daily' );
}

=back

=head1 AUTHOR

 Laurent Declercq <l.declercq@nuxwin.com>

=cut

1;
__END__
