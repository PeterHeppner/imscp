i-MSCP ChangeLog

------------------------------------------------------------------------------------------------------------------------
1.5.1
------------------------------------------------------------------------------------------------------------------------

2017-09-08: Laurent Declercq
    RELEASE i-MSCP 1.5.1

BACKEND
    Fixed: Can't call method "isEmpty" on an undefined value when a listener self un-register (iMSCP::EventManager)

FRONTEND
    Added: `onMoveCustomer' event -- Event triggered when a customer is moved to another reseller
    Added: `onMoveReseller' event -- Event triggered when a reseller is moved to another administrator
    Enhancement: Adjust target reseller limits/permissions instead of throwing error (Customer assignments feature)
    Enhancement: Allows to synchronize PHP permissions of specific client (iMSCP_PHPini)
    Fixed: Several inconsistencies in displaying of statistics data (domain edit interface -- reseller UI level)
    Fixed: Several layout issues regarding statistics (all UI levels)
    Fixed: Statistics badly calculated due to mixing between assigned and consumed values (admin UI level)
    Fixed: Exception raised due to wrong SQL query (Customer assignments)
    Rewritten: Customer and reseller assignments features (admin UI level)

------------------------------------------------------------------------------------------------------------------------
1.5.0
------------------------------------------------------------------------------------------------------------------------

2017-09-05: Laurent Declercq
    RELEASE i-MSCP 1.5.0

BACKEND
    Added: `apcu', `apc', `gmp' and `Zend Opcache' PHP modules to the list of required PHP module (iMSCP::Requirements)
    Added: Flag allowing to ignore mount operation failures (iMSCP::Mount)
    Added: iMSCP::EventManager::hasListener method -- Allow to check whether or not a listener is registered for an event
    Added: Support for multiple <character-string>s in TXT/SPF DNS resource records (Modules::CustomDNS)
    Deprecated: iMSCP::Database::mysql::doQuery() method -- Will be removed in a later version
    Deprecated: iMSCP::Database::mysql::endTransaction() method -- Will be removed in a later version
    Deprecated: iMSCP::Database::mysql::startTransaction() method -- Will be removed in a later version
    Fixed: Can't use an undefined value as a HASH reference (iMSCP::EventManager)
    Fixed: Couldn't remove IP address: Unknown action requested for server IP (Modules::ServerIP)
    Fixed: Don't set permissions on parent directories as this can lead to several permission issues (iMSCP::Dir::make)
    Fixed: Permissions on files are always preverved when copying directory recursively
    Fixed: Routines for Perl/PHP modules requirements checking are broken (iMSCP::Requirements)
    Fixed: Sets the SQL `group_concat_max_len' variable on a per session basis
    Fixed: Sets the SQL modes on a per session basis to `NO_AUTO_CREATE_USER' (backward compatibility with plugins)
    Removed: `FETCH_MODE' option from iMSCP::Database::mysql

CONFIG
    Added: `APPLICATION_ENV' environment variable (Nginx)
    Removed: `.htgroup' and `.htpasswd' files from the skeleton directory; These files are now created only when needed

CONTRIB
    Fixed: 10_backup_storage_outsourcing.pl: Couldn't move XXX directory to XXX -- filesystem boundaries
    Fixed: 10_backup_storage_outsourcing.pl: Outsourced backup directory not created on new customer account creation

DISTRIBUTIONS
    Added: Support for Percona DB 5.7 -- Debian 9/Stretch (amd64 architecture only)
    Added: ca-certificates package in list of pre-required packages
    Fixed: Install openssl and libssl-dev packages from Debian/Ubuntu repositories, not from Ondřej Surý repository
    Fixed: MariaDB client library from MariaDB 10.2 repository isn't compatible with the DBD::mysql Perl module (Debian 9/Stretch)

FRONTEND
    Added: `onPageMessages event' --  Event that is triggered when page messages are being generated
    Added: Button to force refresh of service statuses as they are now cached for 20 minutes
    Added: iMSCP_Database::inTransaction() method
    Added: Routing for languages without territory information: eg. `de' will be routed to `de_DE' (autodetection)
    Added: Setting that allows administrator to protect/unprotect default mail accounts against both edition and deletion
    Added: Support for multiple <character-string>s in TXT/SPF DNS resource records (Custom DNS interface)
    Added: Translaltion resources for Zend validators
    Cosmetics: Make use of the mathematical infinity symbol (∞) in place of the `Unlimited' translation string
    Deprecated: iMSCP_Database::getRawInstance() method -- will be removed in a later release
    Deprecated: Usage of customer ID field -- will be removed in a later release
    Enhancement: Make use of application cache for caching of configuration data (lifetime: indefinitely till change)
    Enhancement: Make use of application cache for caching of rootkit logs (lifetime: 24 hours)
    Enhancement: Make use of application cache for caching of service statuses (lifetime: 20 minutes)
    Enhancement: Make use of Zend APC cache backend; fallback to Zend File backend if APC extension isn't available
    Enhancement: Make customers able to delete their subdomains without first having to delete FTP and mail accounts
    Enhancement: Make customers able to edit mail autoresponder message even if the autoresponder is not activated yet
    Enhancement: Make customers able to select more than one catch-all address in catch-all addresses drop-down list
    Enhancement: Make customers able to show/hide default mail accounts
    Enhancement: Protect default mail accounts against change and deletion (default)
    Enhancement: Show a warning when the DEBUG mode is enabled (administrators only)
    Enhancement: Show Catch-all accounts in client mail accounts overview interface
    Fixed: Action links for FTP accounts must be hidden when they have a status other than 'ok'
    Fixed: All SQL queries must be compatible with the `ONLY_FULL_GROUP_BY' SQL mode
    Fixed: A user must not be able to clear his email address
    Fixed: Couldn't edit mailbox quota due to integer type casting (i386 arch)
    Fixed: Couldn't set value bigger than 2GB for mailbox quota due to integer type casting (i386 arch)
    Fixed: Couldn't generate self-signed SSL certificate (string passed as serial number while integer is expected)
    Fixed: Customers must stay able to login when their password or their main domain are being modified
    Fixed: Don't decode ACE names in list of DNS resource records (Client UI level)
    Fixed: Erroneous ftp_group.members field (Subsequent FTP accounts members are never added)
    Fixed: Login check must be done prior triggering starting script event
    Fixed: Missing creation of default `webmaster' mail account for subdomains
    Fixed: PHP ini entries that belong to subdomains of an alias being removed are not removed
    Fixed: Sets the SQL `group_concat_max_len' variable on a per session basis
    Fixed: Sets the SQL modes on a per session basis to 'NO_AUTO_CREATE_USER' (backward compatibility with plugins)
    Fixed: Several integer type casting issues
    Fixed: Uncaught SyntaxError: missing ) after argument list (user_add2.tpl, hosting_plan_edit.tpl -- reseller UI level)
    Fixed: When an user personal email is being modified, the user identity must be updated as well (session)
    Fixed: Wrong default mail accounts accounting (missing hostmaster email, wrong SQL queries...)
    Merged: Server statistics interfaces (admin UI)
    Removed: Administrator database update interface; Database update are executed by installer
    Removed: Cached versions of navigation files; Make use of application cache instead
    Removed: iMSCP_Initializer class (replaced by iMSCP\Application class)
    Removed: Information about total items/limits assigned - People don't understand their meaning (statistics)
    Removed: Output compression, including related parameters -- Compression is done at Nginx Web server level
    Review: abuse, hostmaster and postmaster default mail accounts are now forwarded to customer email
    Review: Always show fully-qualified names in list of DNS resource records (client UI level)
    Review: Catchall mail accounts are now counted in mail accounts limit
    Review: Default mail accounts are not longer counted for the mail accounts limit (default)
    Review: Default mail accounts are now hidden in the client mail accounts overview interface (default)
    Review: Extend Zend_Registry class instead of reinventing the wheel
    Review: Hide PHP E_STRICT, E_NOTICE, ~E_USER_NOTICE, E_DEPRECATED and E_USER_DEPRECATED on production
    Review: Hide the i-MSCP update interface when Git version is in use (admin UI level)
    Review: Make use of short syntax for arrays
    Review: Make use of Zend_Controller_Action_Helper_FlashMessenger for page messages
    Review: Show an explicite warning when the legacy and unsecure telnet server is running (service statuses)
    Review: Skip the intermediate edit page when mail autoresponder is being enabled and that the message is already set
    Rewritten: Add administrator interface (admin level)
    Rewritten: Edit user and personal data interfaces (all UI levels)
    Rewritten: Password update interface (all UI levels)
    Security: Input for personal user data not filtered nor validated (all UI levels)

INSTALLER
    Enhancement: Support for APT pinning: per section and per package APT pinning (Debian adapter)
    Fixed: Don't remove unused PHP variants configuration directories; PHP packages install INI files for all variants
    Fixed: Hide notice about user/group changes (Courier)
    Fixed: Missing LOGROTATE(8) configuration file for RSYSLOGD(8) (Debian 9/Stretch; Ubuntu 16.04/Xenial)
    Fixed: Removal of obsolete files must be done before saving the persistent data, else some files won't be deleted
    Review: Raise GNU Wget timeout for slow DNS resolvers (Debian apdater)
    Securiry: Permissions hardening - Files and folders are now copied with UMASK(2) 027 instead of 022

PACKAGES
    Fixed: Can't locate Package/FileManager/Net2FTP/Net2FTP.pm when upgrading from some older versions (Package::FileManager)
    Fixed: Missing configuration snippet for AWStats in Apache2 vhosts: Event listener badly registered

PLUGINS
    Updated: Plugin API to version 1.5.0

SCRIPTS
    Removed: Explicite unlocking of locked files -- Files are automatically unlocked
    Fixed: logresolvemerge.pl: Script is broken

SERVERS
    Changed: Mount courier-authdaemon rundir on var/run/courier/authdaemon instead of private/authdaemon (Postfix/Cyrus-SASL)
    Changed: The `postfix' user is now added in the `mail' group instead of the `daemon' group (Postfix/Cyrus-SASL)
    Changed: The ownership for the /var/run/courier/authdaemon directory is now `daemon:mail' (courier-authdaemon)
    Fixed: `.htgroup' and `.htpasswd' files are reseted when the main domain is being changed (Httpd servers)
    Fixed: Couldn't connect to FTP server through IPv6 (vsftpd)
    Fixed: Couldn't generate /etc/courier/dhparams.pem file: Unknown security parameter string: 2048 (Courier)
    Fixed: Postfix parameters are not removed when using Regexp (Servers::mta::postfix::postconf -- Regression fix)
    Fixed: SASL authentication failure: cannot connect to courier-authdaemon: No such file or directory (Postfix/Cyrus-SASL)
    Fixed: Several warnings raised by POSTFIX(1) when files located inside its directories are not owned by the `postfix' user (Postfix)
    Fixed: Unwanted leading character in server alias names - Alternative URLs feature (Httpd servers)
    Removed: sql_mode parameter from the mysql/imscp.cnf configuration file; it is now set on a per session basis) (SQL servers)
    Review: Disallow recursive directory listing (ProFTPD)

SERVICES
    Fixed: MOUNT(2) operation failures are ignored (imscp_mountall)
    Review: Rotate log files on a daily basis instead of a weekly basis for faster processing (Mail service log files)

TRANSLATIONS
    Review: Make use of fuzzy entries in machine object files

VENDOR
    Updated: Zend Framework libraries to version 1.12.20
    
YOUTRACK
    IP-0749 Protected areas under a mount point of a domain alias or subdomain that is being deleted are not removed
    IP-1729 Couldn't generate self-signed SSL certificates with OpenSSL 1.1.x
    IP-1730 Couldn't delete support tickets that are closed
    IP-1733 Default mail accounts in client mail accounts overview should be hidden by default
    IP-1737 Circular feature - A circular must not be send twice to the same email address
    IP-1740 Empty body content when trying to create new SQL user and when SQL users limit has been reached

------------------------------------------------------------------------------------------------------------------------
Older release series
------------------------------------------------------------------------------------------------------------------------

See ./docs/Changelog-x.x.x files
