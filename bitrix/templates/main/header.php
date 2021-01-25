<!doctype html>
<html class="no-js" lang="">
<head>
    <title><?$APPLICATION->ShowTitle();?> </title>
    <?$APPLICATION->ShowHead();?>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Place favicon.ico in the root directory -->

    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/css/normalize.css">
    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/css/font-awesome.min.css">

    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/css/fonts.css">

    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/css/remodal.css">
    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/css/jquery-confirm.css">
    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/slick/slick.css">
    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/fancybox/jquery.fancybox.css">
    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/fancybox/helpers/jquery.fancybox-thumbs.css">

    <link rel="stylesheet" href="<?echo SITE_TEMPLATE_PATH;?>/dist/css/main.css">

    <script src="<?echo SITE_TEMPLATE_PATH;?>/dist/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body class="wrap">

<?$APPLICATION->ShowPanel();?>

<header class="header">
    <div class="header__main__wrap">
        <div class="container header__container">
            <div class="header__logo">
                <div class="header__logo__link">
                    <div class="header__logo__image">
                        <img src="../../../content/logo.png"/>
                    </div>
                </div>
                <div class="header__logo__text">
                    Установка натяжных потолков и осветительных приборов,<br/>поставка и монтаж светодиодного
                    оборудования
                </div>
            </div>

            <div class="header__contacts__wrap clearfix">
                <a href="callto:8(383)000-00-00" class="header__contacts__phone">8 (383) 000-00-00</a>
                <a href="#" data-remodal-target="call" class="button button__small">
                    <span class="button__text">Заказать звонок</span>
                </a>

            </div>
        </div>
    </div>
</header>


<?$APPLICATION->IncludeComponent("bitrix:menu", "main_menu", Array(
	"ALLOW_MULTI_SELECT" => "N",	// Разрешить несколько активных пунктов одновременно
		"CHILD_MENU_TYPE" => "left",	// Тип меню для остальных уровней
		"DELAY" => "N",	// Откладывать выполнение шаблона меню
		"MAX_LEVEL" => "1",	// Уровень вложенности меню
		"MENU_CACHE_GET_VARS" => "",	// Значимые переменные запроса
		"MENU_CACHE_TIME" => "3600",	// Время кеширования (сек.)
		"MENU_CACHE_TYPE" => "N",	// Тип кеширования
		"MENU_CACHE_USE_GROUPS" => "Y",	// Учитывать права доступа
		"ROOT_MENU_TYPE" => "left",	// Тип меню для первого уровня
		"USE_EXT" => "N",	// Подключать файлы с именами вида .тип_меню.menu_ext.php
		"COMPONENT_TEMPLATE" => "catalog_horizontal",
		"MENU_THEME" => "site",	// Тема меню
	),
	false
);?>