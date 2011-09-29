<?xml version="1.0" encoding="{THEME_CHARSET}" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset={THEME_CHARSET}" />
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
        <title>{TR_RESELLER_MAIN_INDEX_PAGE_TITLE}</title>
        <meta name="robots" content="nofollow, noindex" />
        <link href="{THEME_COLOR_PATH}/css/imscp.css" rel="stylesheet" type="text/css" />
        <!--[if IE 6]>
        <script type="text/javascript" src="{THEME_COLOR_PATH}/js/DD_belatedPNG_0.0.8a-min.js"></script>
        <script type="text/javascript">
            DD_belatedPNG.fix('*');
        </script>
        <![endif]-->
    </head>
    <body>
        <div class="header">
            {MAIN_MENU}
            <div class="logo">
                <img src="{ISP_LOGO}" alt="i-MSCP logo" />
            </div>
        </div>
        <div class="location">
            <div class="location-area">
                <h1 class="general">{GENERAL_INFO}</h1>
            </div>
            <ul class="location-menu">
                <!-- <li><a class="help" href="#">Help</a></li> -->
                <!-- BDP: logged_from -->
                <li>
                    <a class="backadmin" href="change_user_interface.php?action=go_back">{YOU_ARE_LOGGED_AS}</a>
                </li>
                <!-- EDP: logged_from -->
                <li><a class="logout" href="../index.php?logout">{TR_MENU_LOGOUT}</a>
                </li>
            </ul>
            <ul class="path">
                <li><a href="index.php">{GENERAL_INFO}</a></li>
            </ul>
        </div>
        <div class="left_menu">
            {MENU}
        </div>
        <div class="body">
            <h2 class="general"><span>{GENERAL_INFO}</span></h2>

            <!-- BDP: page_message -->
            <div class="{MESSAGE_CLS}">{MESSAGE}</div>
            <!-- EDP: page_message -->

            <table>
                <tr>
                    <th>{TR_PROPERTIES}</th>
                    <th>{TR_VALUES}</th>
                </tr>
                <tr>
                    <td style="width:300px;">{ACCOUNT_NAME}</td>
                    <td>{RESELLER_NAME}</td>
                </tr>
                <tr>
                    <td>{DOMAINS}</td>
                    <td>{DMN_MSG}</td>
                </tr>
                <tr>
                    <td>{SUBDOMAINS}</td>
                    <td>{SUB_MSG}</td>
                </tr>
                <tr>
                    <td>{ALIASES}</td>
                    <td>{ALS_MSG}</td>
                </tr>
                <tr>
                    <td>{MAIL_ACCOUNTS}</td>
                    <td>{MAIL_MSG}</td>
                </tr>
                <tr>
                    <td>{TR_FTP_ACCOUNTS}</td>
                    <td>{FTP_MSG}</td>
                </tr>
                <tr>
                    <td>{SQL_DATABASES}</td>
                    <td>{SQL_DB_MSG}</td>
                </tr>
                <tr>
                    <td>{MAIL_ACCOUNTS}</td>
                    <td>{MAIL_MSG}</td>
                </tr>
                <tr>
                    <td>{TR_FTP_ACCOUNTS}</td>
                    <td>{FTP_MSG}</td>
                </tr>
                <tr>
                    <td>{SQL_DATABASES}</td>
                    <td>{SQL_DB_MSG}</td>
                </tr>
                <tr>
                    <td>{SQL_USERS}</td>
                    <td>{SQL_USER_MSG}</td>
                </tr>
                <!-- BDP: t_software_support -->
                <tr>
                    <td>{SW_ALLOWED}</td>
                    <td>{SW_MSG}</td>
                </tr>
                <!-- EDP: t_software_support -->
            </table>

            <h2 class="traffic"><span>{TR_TRAFFIC_USAGE}</span></h2>

            <!-- BDP: traffic_warning_message -->
            <div class="warning">{TR_TRAFFIC_WARNING}</div>
            <!-- EDP: traffic_warning_message -->

            <p>{TRAFFIC_USAGE_DATA}</p>

            <div class="graph">
                <span style="width:{TRAFFIC_PERCENT}%">&nbsp;</span>
            </div>

            <h2 class="diskusage"><span>{TR_DISK_USAGE}</span></h2>

            <!-- BDP: disk_warning_message -->
            <div class="warning">{TR_DISK_WARNING}</div>
            <!-- EDP: disk_warning_message -->

            <p>{DISK_USAGE_DATA}</p>
            <div class="graph">
                <span style="width:{DISK_PERCENT}%">&nbsp;</span>
            </div>
        </div>

        <div class="footer">
            i-MSCP {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
        </div>
    </body>
</html>
