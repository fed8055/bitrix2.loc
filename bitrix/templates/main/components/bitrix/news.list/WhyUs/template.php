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
<section class="why__section section3">
    <div class="container">
        <div class="section__title section__title__large text__center">
            <span class="orange">Почему</span> выбирают нас
        </div>
        <div class="why__list">
            <?foreach($arResult["ITEMS"] as $arItem):?>
                <div class="why__item">
                    <div class="why__item__image">
                        <img src="<?=$arItem['PREVIEW_PICTURE']['SRC']?>">
                    </div>
                    <div class="why__item__title">
                        <?= $arItem['NAME']?>
                    </div>
                    <div class="why__item__text">
                        <?= $arItem['PREVIEW_TEXT']?>
                    </div>
                </div>
            <?endforeach;?>
        </div>
    </div>
</section>


