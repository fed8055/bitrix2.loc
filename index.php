<?
require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php");
$APPLICATION->SetTitle("1С-Битрикс: Управление сайтом");
?>
    <div class="page_wrap">
        <section class="first__section">
            <h1 class="hidden">Установка натяжных потолков и осветительных приборов</h1>
            <div class="first__slider__wrap">
                <div class="first__slider__inner js_slider">
                    <div class="first__slide">
                        <div class="first__slide__image" style="background-image: url('content/slide.jpg')">
                        </div>
                        <div class="first__slide__content">
                            <div class="container">
                                <div class="first__title">
                                    <span class="orange">Установка</span> натяжных потолков<br>
                                    и осветительных приборов
                                </div>
                                <div class="first__slide__delimer">
                                </div>
                                <div class="first__slide__text">
                                    Стабильно и качественно<br>
                                    выполняем свою работу на протяжении 8 лет
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="first__slide">
                        <div class="first__slide__image" style="background-image: url('content/slide.jpg')">
                        </div>
                        <div class="first__slide__content">
                            <div class="container">
                                <div class="first__title">
                                    <span class="orange">Установка</span> натяжных потолков<br>
                                    и осветительных приборов
                                </div>
                                <div class="first__slide__delimer">
                                </div>
                                <div class="first__slide__text">
                                    Стабильно и качественно<br>
                                    выполняем свою работу на протяжении 8 лет
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="first__slide">
                        <div class="first__slide__image" style="background-image: url('content/slide.jpg')">
                        </div>
                        <div class="first__slide__content">
                            <div class="container">
                                <div class="first__title">
                                    <span class="orange">Установка</span> натяжных потолков<br>
                                    и осветительных приборов
                                </div>
                                <div class="first__slide__delimer">
                                </div>
                                <div class="first__slide__text">
                                    Стабильно и качественно<br>
                                    выполняем свою работу на протяжении 8 лет
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <?$APPLICATION->IncludeComponent("bitrix:main.feedback", "call_price", Array(
            "EMAIL_TO" => "fed8055@yandex.ru",	// E-mail, на который будет отправлено письмо
                "EVENT_MESSAGE_ID" => array(	// Почтовые шаблоны для отправки письма
                    0 => "7",
                ),
                "OK_TEXT" => "Спасибо, ваша заявка принята.",	// Сообщение, выводимое пользователю после отправки
                "REQUIRED_FIELDS" => "",	// Обязательные поля для заполнения
                "USE_CAPTCHA" => "Y",	// Использовать защиту от автоматических сообщений (CAPTCHA) для неавторизованных пользователей
            ),
            false
            );?>

        </section>
        <section class="projects__section section1">
            <div class="container">
                <div class="section__title section__title__large text__center">
                    <span class="orange">Наши</span> проекты
                </div>
                <div class="project__list">
                    <div class="project__item">
                        <a href="#" class="project__link js_view_gallery" data-id="0">
                            <div class="project__image" style="background-image: url('content/project1.jpg')">
                            </div>
                            <div class="project__text">
                                Глянцевые фактуры
                            </div>
                        </a>
                    </div>
                    <div class="project__item">
                        <a href="#" class="project__link js_view_gallery" data-id="1">
                            <div class="project__image" style="background-image: url('content/project2.jpg')">
                            </div>
                            <div class="project__text">
                                Матовые фактуры
                            </div>
                        </a>
                    </div>
                    <div class="project__item">
                        <a href="#" class="project__link js_view_gallery" data-id="2">
                            <div class="project__image" style="background-image: url('content/project3.jpg')">
                            </div>
                            <div class="project__text">
                                Многоуровневые потолки
                            </div>
                        </a>
                    </div>
                    <div class="project__item">
                        <a href="#" class="project__link js_view_gallery" data-id="3">
                            <div class="project__image" style="background-image: url('content/project4.jpg')">
                            </div>
                            <div class="project__text">
                                Скрытая подсветка
                            </div>
                        </a>
                    </div>
                    <div class="project__item">
                        <a href="#" class="project__link js_view_gallery" data-id="4">
                            <div class="project__image" style="background-image: url('content/project5.jpg')">
                            </div>
                            <div class="project__text">
                                Тканевые потолки
                            </div>
                        </a>
                    </div>
                    <div class="project__item">
                        <a href="#" class="project__link js_view_gallery" data-id="5">
                            <div class="project__image" style="background-image: url('content/project6.jpg')">
                            </div>
                            <div class="project__text">
                                Фотопечать
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <section class="about__section section2">
        <div class="container clearfix">
            <div class="about__section__left">
                <div class="section__title section__middle">
                    <span class="orange">Наши</span> проекты
                </div>
                <div class="section__delimer">
                </div>
                <div class="section__text">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin
                        gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.
                        Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam
                        fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc
                        eget.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin
                        gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.
                        Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam
                        fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc
                        eget.
                    </p>
                </div>
            </div>
            <div class="about__section__right">
                <div class="about__image">
                    <img src="../../../content/about.jpg">
                </div>
            </div>
        </div>
    </section>

<? $APPLICATION->IncludeComponent(
    "bitrix:news.list",
    "WhyUs",
    Array(
        "ACTIVE_DATE_FORMAT" => "d.m.Y",
        "ADD_SECTIONS_CHAIN" => "Y",
        "AJAX_MODE" => "N",
        "AJAX_OPTION_ADDITIONAL" => "",
        "AJAX_OPTION_HISTORY" => "N",
        "AJAX_OPTION_JUMP" => "N",
        "AJAX_OPTION_STYLE" => "Y",
        "CACHE_FILTER" => "N",
        "CACHE_GROUPS" => "Y",
        "CACHE_TIME" => "36000000",
        "CACHE_TYPE" => "A",
        "CHECK_DATES" => "Y",
        "DETAIL_URL" => "",
        "DISPLAY_BOTTOM_PAGER" => "Y",
        "DISPLAY_DATE" => "Y",
        "DISPLAY_NAME" => "Y",
        "DISPLAY_PICTURE" => "Y",
        "DISPLAY_PREVIEW_TEXT" => "Y",
        "DISPLAY_TOP_PAGER" => "N",
        "FIELD_CODE" => array(0 => "", 1 => "",),
        "FILTER_NAME" => "",
        "HIDE_LINK_WHEN_NO_DETAIL" => "N",
        "IBLOCK_ID" => "4",
        "IBLOCK_TYPE" => "why_us",
        "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",
        "INCLUDE_SUBSECTIONS" => "Y",
        "MESSAGE_404" => "",
        "NEWS_COUNT" => "5",
        "PAGER_BASE_LINK_ENABLE" => "N",
        "PAGER_DESC_NUMBERING" => "N",
        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
        "PAGER_SHOW_ALL" => "N",
        "PAGER_SHOW_ALWAYS" => "N",
        "PAGER_TEMPLATE" => ".default",
        "PAGER_TITLE" => "Новости",
        "PARENT_SECTION" => "",
        "PARENT_SECTION_CODE" => "",
        "PREVIEW_TRUNCATE_LEN" => "",
        "PROPERTY_CODE" => array(0 => "", 1 => "",),
        "SET_BROWSER_TITLE" => "Y",
        "SET_LAST_MODIFIED" => "N",
        "SET_META_DESCRIPTION" => "Y",
        "SET_META_KEYWORDS" => "Y",
        "SET_STATUS_404" => "N",
        "SET_TITLE" => "Y",
        "SHOW_404" => "N",
        "SORT_BY1" => "ACTIVE_FROM",
        "SORT_BY2" => "SORT",
        "SORT_ORDER1" => "DESC",
        "SORT_ORDER2" => "ASC",
        "STRICT_SECTION_CHECK" => "N"
    )
); ?>

    <section class="call__section section4">
        <div class="container clearfix">
            <div class="call__section__left">
                <div class="section__title section__middle">
                    Закажите замер бесплатно
                </div>
                <div class="section__delimer">
                </div>
                <div class="section__text">
                    Получите бесплатный расчет стоимости своего потолка прямо сейчас!
                </div>
            </div>
            <?$APPLICATION->IncludeComponent("bitrix:main.feedback", "free_measure", Array(
                "EMAIL_TO" => "fed8055@yandex.ru",	// E-mail, на который будет отправлено письмо
                    "EVENT_MESSAGE_ID" => "",	// Почтовые шаблоны для отправки письма
                    "OK_TEXT" => "Спасибо, ваше сообщение принято.",	// Сообщение, выводимое пользователю после отправки
                    "REQUIRED_FIELDS" => "",	// Обязательные поля для заполнения
                    "USE_CAPTCHA" => "N",	// Использовать защиту от автоматических сообщений (CAPTCHA) для неавторизованных пользователей
                ),
                false
            );?>

        </div>
    </section>
    <section class="reviews__section section5">
        <div class="container">
            <div class="section__title section__title__large text__center">
                <span class="orange">Отзывы</span> и благодарности
            </div>
            <div class="clearfix">
                <div class="flamp__block">
                    <a class="flamp-widget"
                       href="https://novosibirsk.flamp.ru/firm/ampir_novosibirsk_ooo-141266769810424"
                       data-flamp-widget-type="responsive-new" data-flamp-widget-count="1"
                       data-flamp-widget-id="141266769810424" data-flamp-widget-width="100%">Отзывы о нас на Флампе</a>
                    <script>!function (d, s) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            js = d.createElement(s);
                            js.async = 1;
                            js.src = "//widget.flamp.ru/loader.js";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, "script");</script>
                </div>

                <? $APPLICATION->IncludeComponent(
                    "bitrix:news.list",
                    "reviews",
                    Array(
                        "ACTIVE_DATE_FORMAT" => "d.m.Y",
                        "ADD_SECTIONS_CHAIN" => "Y",
                        "AJAX_MODE" => "N",
                        "AJAX_OPTION_ADDITIONAL" => "",
                        "AJAX_OPTION_HISTORY" => "N",
                        "AJAX_OPTION_JUMP" => "N",
                        "AJAX_OPTION_STYLE" => "Y",
                        "CACHE_FILTER" => "N",
                        "CACHE_GROUPS" => "Y",
                        "CACHE_TIME" => "36000000",
                        "CACHE_TYPE" => "A",
                        "CHECK_DATES" => "Y",
                        "DETAIL_URL" => "",
                        "DISPLAY_BOTTOM_PAGER" => "Y",
                        "DISPLAY_DATE" => "Y",
                        "DISPLAY_NAME" => "Y",
                        "DISPLAY_PICTURE" => "Y",
                        "DISPLAY_PREVIEW_TEXT" => "Y",
                        "DISPLAY_TOP_PAGER" => "N",
                        "FIELD_CODE" => array(0 => "", 1 => "",),
                        "FILTER_NAME" => "",
                        "HIDE_LINK_WHEN_NO_DETAIL" => "N",
                        "IBLOCK_ID" => "5",
                        "IBLOCK_TYPE" => "reviews",
                        "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",
                        "INCLUDE_SUBSECTIONS" => "Y",
                        "MESSAGE_404" => "",
                        "NEWS_COUNT" => "10",
                        "PAGER_BASE_LINK_ENABLE" => "N",
                        "PAGER_DESC_NUMBERING" => "N",
                        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
                        "PAGER_SHOW_ALL" => "N",
                        "PAGER_SHOW_ALWAYS" => "N",
                        "PAGER_TEMPLATE" => ".default",
                        "PAGER_TITLE" => "Новости",
                        "PARENT_SECTION" => "",
                        "PARENT_SECTION_CODE" => "",
                        "PREVIEW_TRUNCATE_LEN" => "",
                        "PROPERTY_CODE" => array(0 => "", 1 => "",),
                        "SET_BROWSER_TITLE" => "Y",
                        "SET_LAST_MODIFIED" => "N",
                        "SET_META_DESCRIPTION" => "Y",
                        "SET_META_KEYWORDS" => "Y",
                        "SET_STATUS_404" => "N",
                        "SET_TITLE" => "Y",
                        "SHOW_404" => "N",
                        "SORT_BY1" => "ACTIVE_FROM",
                        "SORT_BY2" => "SORT",
                        "SORT_ORDER1" => "DESC",
                        "SORT_ORDER2" => "ASC",
                        "STRICT_SECTION_CHECK" => "N"
                    )
                ); ?>
            </div>
        </div>
    </section>


<? $APPLICATION->IncludeComponent(
    "bitrix:news.list",
    "contacts",
    array(
        "ACTIVE_DATE_FORMAT" => "d.m.Y",
        "ADD_SECTIONS_CHAIN" => "Y",
        "AJAX_MODE" => "N",
        "AJAX_OPTION_ADDITIONAL" => "",
        "AJAX_OPTION_HISTORY" => "N",
        "AJAX_OPTION_JUMP" => "N",
        "AJAX_OPTION_STYLE" => "Y",
        "CACHE_FILTER" => "N",
        "CACHE_GROUPS" => "Y",
        "CACHE_TIME" => "36000000",
        "CACHE_TYPE" => "A",
        "CHECK_DATES" => "Y",
        "DETAIL_URL" => "",
        "DISPLAY_BOTTOM_PAGER" => "Y",
        "DISPLAY_DATE" => "Y",
        "DISPLAY_NAME" => "Y",
        "DISPLAY_PICTURE" => "Y",
        "DISPLAY_PREVIEW_TEXT" => "Y",
        "DISPLAY_TOP_PAGER" => "N",
        "FIELD_CODE" => array(
            0 => "",
            1 => "",
        ),
        "FILTER_NAME" => "",
        "HIDE_LINK_WHEN_NO_DETAIL" => "N",
        "IBLOCK_ID" => "6",
        "IBLOCK_TYPE" => "contacts",
        "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",
        "INCLUDE_SUBSECTIONS" => "Y",
        "MESSAGE_404" => "",
        "NEWS_COUNT" => "4",
        "PAGER_BASE_LINK_ENABLE" => "N",
        "PAGER_DESC_NUMBERING" => "N",
        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
        "PAGER_SHOW_ALL" => "N",
        "PAGER_SHOW_ALWAYS" => "N",
        "PAGER_TEMPLATE" => ".default",
        "PAGER_TITLE" => "Новости",
        "PARENT_SECTION" => "",
        "PARENT_SECTION_CODE" => "",
        "PREVIEW_TRUNCATE_LEN" => "",
        "PROPERTY_CODE" => array(
            0 => "",
            1 => "",
        ),
        "SET_BROWSER_TITLE" => "Y",
        "SET_LAST_MODIFIED" => "N",
        "SET_META_DESCRIPTION" => "Y",
        "SET_META_KEYWORDS" => "Y",
        "SET_STATUS_404" => "N",
        "SET_TITLE" => "Y",
        "SHOW_404" => "N",
        "SORT_BY1" => "ID",
        "SORT_BY2" => "SORT",
        "SORT_ORDER1" => "ASC",
        "SORT_ORDER2" => "ASC",
        "STRICT_SECTION_CHECK" => "N",
        "COMPONENT_TEMPLATE" => "contacts",
        "TEMPLATE_THEME" => "blue",
        "MEDIA_PROPERTY" => "",
        "SLIDER_PROPERTY" => "",
        "SEARCH_PAGE" => "/search/",
        "USE_RATING" => "N",
        "USE_SHARE" => "N"
    ),
    false
); ?>
    <section class="map__section">
        <div class="map__2gis" id="map">
        </div>
    </section> <a href="#" class="to__top"></a><? require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>