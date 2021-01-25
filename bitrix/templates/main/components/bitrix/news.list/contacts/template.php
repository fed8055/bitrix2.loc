<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @global CDatabase $DB */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var CBitrixComponent $component */
$this->setFrameMode(true);
?>
<section class="contacts__section section6">
    <div class="container">
        <div class="section__title section__title__large text__center">
            <span class="orange">Контактная</span> информация
        </div>
        <div class="contacts__list">
            <?foreach($arResult["ITEMS"] as $arItem):?>
                <div class="contacts__item">
                    <div class="contacts__image">
                        <img src="<?=$arItem['PREVIEW_PICTURE']['SRC']?>">
                    </div>
                    <div class="contacts__text">
                        <?= $arItem['PREVIEW_TEXT']?>
                    </div>
                </div>
            <?endforeach;?>
        </div>
    </div>
</section>