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
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/imscp.js"></script>
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
				<h1 class="purchasing">{TR_MENU_ORDERS}</h1>
			</div>
			<ul class="location-menu">
				<!-- <li><a class="help" href="#">Help</a></li> -->
				<!-- BDP: logged_from -->
				<li><a class="backadmin" href="change_user_interface.php?action=go_back">{YOU_ARE_LOGGED_AS}</a></li>
				<!-- EDP: logged_from -->
				<li><a class="logout" href="../index.php?logout">{TR_MENU_LOGOUT}</a></li>
			</ul>
			<ul class="path">
				<li><a href="orders.php">{TR_MENU_ORDERS}</a></li>
				<li><a href="order_settings.php">{TR_MENU_ORDER_SETTINGS}</a></li>
			</ul>
		</div>

		<div class="left_menu">
			{MENU}
		</div>


		<div class="body">
			<h2 class="tools"><span>{TR_MENU_ORDER_SETTINGS}</span></h2>

			<!-- BDP: page_message -->
   				<div class="{MESSAGE_CLS}">{MESSAGE}</div>
	   		<!-- EDP: page_message -->

			 <form name="edit_hfp" method="post" action="order_settings.php">
			 		<p><span style="font-weight: bold;">{TR_IMPLEMENT_INFO}</span>: {TR_IMPLEMENT_URL}</p>
			 		<label for="header" style="display: block;font-weight: bolder;margin:10px;">{TR_HEADER}</label>
			 		<textarea name="header" cols="80" rows="15" id="header"><!-- BDP: purchase_header --><!-- EDP: purchase_header --></textarea>
			 		<label for="footer" style="display: block;font-weight: bolder;margin:10px;">{TR_FOOTER}</label>
			 		<textarea name="footer" cols="80" rows="15" id="footer"><!-- BDP: purchase_footer --><!-- EDP: purchase_footer --></textarea>
			 	<div class="buttons">
			 		<input name="Submit" type="submit" value="{TR_APPLY_CHANGES}" />
			 		<input name="Button" type="button" onclick="window.open('/orderpanel/', 'preview', 'width=770,height=480')" value="{TR_PREVIEW}" />
			 	</div>
			 </form>
            <br />
		</div>
		<div class="footer">
			i-MSCP {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
		</div>

	</body>
</html>
