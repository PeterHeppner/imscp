<?xml version="1.0" encoding="{THEME_CHARSET}" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset={THEME_CHARSET}" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />
		<title>{TR_ADMIN_ADD_RESELLER_PAGE_TITLE}</title>
		<meta name="robots" content="nofollow, noindex" />
		<link href="{THEME_COLOR_PATH}/css/imscp.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/imscp.js"></script>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/jquery.js"></script>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/jquery.imscpTooltips.js"></script>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/jquery.ui.core.js"></script>

		<!--[if IE 6]>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/DD_belatedPNG_0.0.8a-min.js"></script>
		<script type="text/javascript">
			DD_belatedPNG.fix('*');
		</script>
		<![endif]-->

		<script language="JavaScript" type="text/JavaScript">
			/*<![CDATA[*/
			$(document).ready(function() {
				if($('#phpini_system_no').is(':checked')) {
					$("#phpinidetail").hide();
				}

				$('#phpini_system_yes').click( function() {
					$("#phpinidetail").show();
				});

				$('#phpini_system_no').click( function() {
					$("#phpinidetail").hide();
				});
			});
			/*]]>*/
		</script>

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
				<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
			</div>
			<ul class="location-menu">
				<!-- <li><a class="help" href="#">Help</a></li> -->
				<li><a class="logout" href="../index.php?logout">{TR_MENU_LOGOUT}</a>
				</li>
			</ul>
			<ul class="path">
				<li><a href="manage_users.php">{TR_MENU_MANAGE_USERS}</a></li>
				<li><a href="reseller_add.php">{TR_ADD_RESELLER}</a></li>
			</ul>
		</div>

		<div class="left_menu">
			{MENU}
		</div>

		<div class="body">
			<h2 class="user"><span>{TR_ADD_RESELLER}</span></h2>

			<!-- BDP: page_message -->
			<div class="{MESSAGE_CLS}">{MESSAGE}</div>
			<!-- EDP: page_message -->

			<form name="admin_add_reseller" method="post" action="reseller_add.php">
				<fieldset>
					<legend>{TR_CORE_DATA}</legend>
					<table>
						<tr>
							<td style="width:300px;">
								<label for="username">{TR_USERNAME}</label>
							</td>
							<td>
								<input type="text" name="username" id="username" value="{USERNAME}" />
							</td>
						</tr>
						<tr>
							<td><label for="pass">{TR_PASSWORD}</label></td>
							<td>
								<input type="password" name="pass" id="pass" value="{GENPAS}" />
							</td>
						</tr>
						<tr>
							<td><label for="pass_rep">{TR_PASSWORD_REPEAT}</label>
							</td>
							<td>
								<input type="password" name="pass_rep" id="pass_rep" value="{GENPAS}" />
							</td>
						</tr>

						<tr>
							<td><label for="email">{TR_EMAIL}</label></td>
							<td>
								<input type="text" name="email" id="email" value="{EMAIL}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_domain_cnt">{TR_MAX_DOMAIN_COUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_domain_cnt" id="nreseller_max_domain_cnt" value="{MAX_DOMAIN_COUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_subdomain_cnt">{TR_MAX_SUBDOMAIN_COUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_subdomain_cnt" id="nreseller_max_subdomain_cnt" value="{MAX_SUBDOMAIN_COUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_alias_cnt">{TR_MAX_ALIASES_COUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_alias_cnt" id="nreseller_max_alias_cnt" value="{MAX_ALIASES_COUNT}" />
							</td>
						</tr>

						<tr>
							<td>
								<label for="nreseller_max_mail_cnt">{TR_MAX_MAIL_USERS_COUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_mail_cnt" id="nreseller_max_mail_cnt" value="{MAX_MAIL_USERS_COUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_ftp_cnt">{TR_MAX_FTP_USERS_COUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_ftp_cnt" id="nreseller_max_ftp_cnt" value="{MAX_FTP_USERS_COUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_sql_db_cnt">{TR_MAX_SQLDB_COUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_sql_db_cnt" id="nreseller_max_sql_db_cnt" value="{MAX_SQLDB_COUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_sql_user_cnt">{TR_MAX_SQL_USERS_COUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_sql_user_cnt" id="nreseller_max_sql_user_cnt" value="{MAX_SQL_USERS_COUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_traffic">{TR_MAX_TRAFFIC_AMOUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_traffic" id="nreseller_max_traffic" value="{MAX_TRAFFIC_AMOUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="nreseller_max_disk">{TR_MAX_DISK_AMOUNT}</label>
							</td>
							<td>
								<input type="text" name="nreseller_max_disk" id="nreseller_max_disk" value="{MAX_DISK_AMOUNT}" />
							</td>
						</tr>
						<tr>
							<td>{TR_SOFTWARE_ALLOWED}</td>
							<td>
								<input type="radio" name="nreseller_software_allowed" id="nreseller_software_allowed_yes" value="yes" {VL_SOFTWAREY} />
								<label for="nreseller_software_allowed_yes">{TR_YES}</label>
								<input type="radio" name="nreseller_software_allowed" id="nreseller_software_allowed_no" value="no" {VL_SOFTWAREN} />
								<label for="nreseller_software_allowed_no">{TR_NO}</label>
							</td>
						</tr>
						<tr>
							<td>{TR_SOFTWAREDEPOT_ALLOWED}</td>
							<td>
								<input type="radio" name="nreseller_softwaredepot_allowed" id="softwaredepot_allowed_yes" value="yes" {VL_SOFTWAREDEPOTY} />
								<label for="softwaredepot_allowed_yes">{TR_YES}</label>
								<input type="radio" name="nreseller_softwaredepot_allowed" id="softwaredepot_allowed_no" value="no" {VL_SOFTWAREDEPOTN} />
								<label for="softwaredepot_allowed_no">{TR_NO}</label>
							</td>
						</tr>
						<tr>
							<td>{TR_WEBSOFTWAREDEPOT_ALLOWED}</td>
							<td>
								<input type="radio" name="nreseller_websoftwaredepot_allowed" id="websoftwaredepot_allowed_yes" value="yes" {VL_WEBSOFTWAREDEPOTY} />
								<label for="websoftwaredepot_allowed_yes">{TR_YES}</label>
								<input type="radio" name="nreseller_websoftwaredepot_allowed" id="websoftwaredepot_allowed_no" value="no" {VL_WEBSOFTWAREDEPOTN} />
								<label for="websoftwaredepot_allowed_no">{TR_NO}</label>
							</td>
						</tr>
						<tr>
							<td>{TR_SUPPORT_SYSTEM}</td>
							<td>
								<input type="radio" name="support_system" id="support_system_yes" value="yes" {SUPPORT_SYSTEM_YES} />
								<label for="support_system_yes">{TR_YES}</label>
								<input type="radio" name="support_system" id="support_system_no" value="no" {SUPPORT_SYSTEM_NO} />
								<label for="support_system_no">{TR_NO}</label>
							</td>
						</tr>
						<tr>
							<td>{TR_PHPINI_SYSTEM}</td>
							<td>
								<input type="radio" name="phpini_system" id="phpini_system_yes" value="yes" {PHPINI_SYSTEM_YES} />
								<label for="phpini_system_yes">{TR_YES}</label>
								<input type="radio" name="phpini_system" id="phpini_system_no" value="no" {PHPINI_SYSTEM_NO} />
								<label for="phpini_system_no">{TR_NO}</label>
							</td>
						</tr>
						<tbody id='phpinidetail'>
							<tr>
								<td>{TR_PHPINI_AL_REGISTER_GLOBALS}</td>
								<td>
									<input type="radio" name="phpini_al_register_globals" id="phpini_al_register_globals_yes" value="yes" {PHPINI_AL_REGISTER_GLOBALS_YES} />
									<label for="phpini_al_register_globals_yes">{TR_YES}</label>
									<input type="radio" name="phpini_al_register_globals" id="phpini_al_register_globals_no" value="no" {PHPINI_AL_REGISTER_GLOBALS_NO} />
									<label for="phpini_al_register_globals_no">{TR_NO}</label>
								</td>
							</tr>
							<tr id='php_ini_block_allow_url_fopen'>
								<td>{TR_PHPINI_AL_ALLOW_URL_FOPEN}</td>
								<td>
									<input type="radio" name="phpini_al_allow_url_fopen" id="phpini_al_allow_url_fopen_yes" value="yes" {PHPINI_AL_ALLOW_URL_FOPEN_YES} />
									<label for="phpini_al_allow_url_fopen_yes">{TR_YES}</label>
									<input type="radio" name="phpini_al_allow_url_fopen" id="phpini_al_allow_url_fopen_no" value="no" {PHPINI_AL_ALLOW_URL_FOPEN_NO} />
									<label for="phpini_al_allow_url_fopen_no">{TR_NO}</label>
								</td>
							</tr>
							<tr id='php_ini_block_display_errors'>
								<td>{TR_PHPINI_AL_DISPLAY_ERRORS}</td>
								<td>
									<input type="radio" name="phpini_al_display_errors" id="phpini_al_display_errors_yes" value="yes" {PHPINI_AL_DISPLAY_ERRORS_YES} />
									<label for="phpini_al_display_errors_yes">{TR_YES}</label>
									<input type="radio" name="phpini_al_display_errors" id="phpini_al_display_errors_no" value="no" {PHPINI_AL_DISPLAY_ERRORS_NO} />
									<label for="phpini_al_display_errors_no">{TR_NO}</label>
								</td>
							</tr>
							<tr id='php_ini_block_disable_functions'>
								<td>{TR_PHPINI_AL_DISABLE_FUNCTIONS}</td>
								<td>
									<input type="radio" name="phpini_al_disable_functions" id="phpini_al_disable_functions_yes" value="yes" {PHPINI_AL_DISABLE_FUNCTIONS_YES} />
									<label for="phpini_al_disable_functions_yes">{TR_YES}</label>
									<input type="radio" name="phpini_al_disable_functions" id="disable_functions_no" value="no" {PHPINI_AL_DISABLE_FUNCTIONS_NO} />
									<label for="disable_functions_no">{TR_NO}</label>
								</td>
							</tr>
							<tr id='php_ini_block_memory_limit'>
								<td>
									<label for="phpini_max_memory_limit">{TR_PHPINI_MAX_MEMORY_LIMIT}</label>
								</td>
								<td>
									<input type="text" name="phpini_max_memory_limit" id="phpini_max_memory_limit" value="{PHPINI_MAX_MEMORY_LIMIT_VAL}" />
								</td>
							</tr>
							<tr id='php_ini_block_upload_max_filesize'>
								<td>
									<label for="phpini_max_upload_max_filesize">{TR_PHPINI_MAX_UPLOAD_MAX_FILESIZE}</label>
								</td>
								<td>
									<input type="text" name="phpini_max_upload_max_filesize" id="phpini_max_upload_max_filesize" value="{PHPINI_MAX_UPLOAD_MAX_FILESIZE_VAL}" />
								</td>
							</tr>
							<tr id='php_ini_block_post_max_size'>
								<td>
									<label for="phpini_max_post_max_size">{TR_PHPINI_MAX_POST_MAX_SIZE}</label>
								</td>
								<td>
									<input type="text" name="phpini_max_post_max_size" id="phpini_max_post_max_size" value="{PHPINI_MAX_POST_MAX_SIZE_VAL}" />
								</td>
							</tr>
							<tr id='php_ini_block_max_execution_time'>
								<td>
									<label for="phpini_max_max_execution_time">{TR_PHPINI_MAX_MAX_EXECUTION_TIME}</label>
								</td>
								<td>
									<input type="text" name="phpini_max_max_execution_time" id="phpini_max_max_execution_time" value="{PHPINI_MAX_MAX_EXECUTION_TIME_VAL}" />
								</td>
							</tr>
							<tr id='php_ini_block_max_input_time'>
								<td>
									<label for="phpini_max_max_input_time">{TR_PHPINI_MAX_MAX_INPUT_TIME}</label>
								</td>
								<td>
									<input type="text" name="phpini_max_max_input_time" id="phpini_max_max_input_time" value="{PHPINI_MAX_MAX_INPUT_TIME_VAL}" />
								</td>
							</tr>
						</tbody>
					</table>
				</fieldset>

				<fieldset>
					<legend>{TR_RESELLER_IPS}</legend>

					<!-- BDP: rsl_ip_message -->
					<div class="warning">{RSL_IP_MESSAGE}</div>
					<!-- EDP: rsl_ip_message -->

					<!-- BDP: rsl_ip_list -->
					<table>
						<tr>
							<th style="width:300px;">{TR_RSL_IP_NUMBER}</th>
							<th>{TR_RSL_IP_ASSIGN}</th>
							<th>{TR_RSL_IP_LABEL}</th>
							<th>{TR_RSL_IP_IP}</th>
						</tr>
						<!-- BDP: rsl_ip_item -->
						<tr>
							<td>{RSL_IP_NUMBER}</td>
							<td>
								<input type="checkbox" id="{RSL_IP_CKB_NAME}" name="{RSL_IP_CKB_NAME}" value="{RSL_IP_CKB_VALUE}" {RSL_IP_ITEM_ASSIGNED} />
							</td>
							<td><label for="{RSL_IP_CKB_NAME}">{RSL_IP_LABEL}</label>
							</td>
							<td>{RSL_IP_IP}</td>
						</tr>
						<!-- EDP: rsl_ip_item -->
					</table>
					<!-- EDP: rsl_ip_list -->
				</fieldset>

				<fieldset>
					<legend>{TR_ADDITIONAL_DATA}</legend>
					<table>
						<tr>
							<td style="width:300px;">
								<label for="customer_id">{TR_CUSTOMER_ID}</label>
							</td>
							<td>
								<input type="text" name="customer_id" id="customer_id" value="{CUSTOMER_ID}" />
							</td>
						</tr>
						<tr>
							<td><label for="first_name">{TR_FIRST_NAME}</label></td>
							<td>
								<input type="text" name="fname" id="first_name" value="{FIRST_NAME}" />
							</td>
						</tr>
						<tr>
							<td><label for="last_name">{TR_LAST_NAME}</label></td>
							<td>
								<input type="text" name="lname" id="last_name" value="{LAST_NAME}" />
							</td>
						</tr>
						<tr>
							<td><label for="gender">{TR_GENDER}</label></td>
							<td><select id="gender" name="gender">
								<option value="M" {VL_MALE}>{TR_MALE}</option>
								<option value="F" {VL_FEMALE}>{TR_FEMALE}</option>
								<option value="U" {VL_UNKNOWN}>{TR_UNKNOWN}</option>
							</select>
							</td>
						<tr>
							<td><label for="firm">{TR_COMPANY}</label></td>
							<td>
								<input type="text" name="firm" id="firm" value="{FIRM}" />
							</td>
						</tr>
						<tr>
							<td><label for="street1">{TR_STREET_1}</label></td>
							<td>
								<input type="text" name="street1" id="street1" value="{STREET_1}" />
							</td>
						</tr>
						<tr>
							<td><label for="street2">{TR_STREET_2}</label></td>
							<td>
								<input type="text" name="street2" id="street2" value="{STREET_2}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="zip_postal_code">{TR_ZIP_POSTAL_CODE}</label>
							</td>
							<td>
								<input type="text" name="zip" id="zip_postal_code" value="{ZIP}" />
							</td>
						</tr>
						<tr>
							<td><label for="city">{TR_CITY}</label></td>
							<td>
								<input type="text" name="city" id="city" value="{CITY}" />
							</td>
						</tr>
						<tr>
							<td><label for="state">{TR_STATE}</label></td>
							<td>
								<input type="text" name="state" id="state" value="{STATE}" />
							</td>
						</tr>
						<tr>
							<td><label for="country">{TR_COUNTRY}</label></td>
							<td>
								<input type="text" name="country" id="country" value="{COUNTRY}" />
							</td>
						</tr>
						<tr>
							<td><label for="phone">{TR_PHONE}</label></td>
							<td>
								<input type="text" name="phone" id="phone" value="{PHONE}" />
							</td>
						</tr>
						<tr>
							<td><label for="fax">{TR_FAX}</label></td>
							<td>
								<input type="text" name="fax" id="fax" value="{FAX}" />
							</td>
						</tr>
					</table>
				</fieldset>

				<div class="buttons">
					<input name="Submit" type="submit" class="button" value="{TR_ADD}" />
					<input type="hidden" name="uaction" value="add_reseller" />
				</div>
			</form>
		</div>

		<div class="footer">
			i-MSCP {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
		</div>
	</body>
</html>
