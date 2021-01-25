<?if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
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

if (empty($arResult["ALL_ITEMS"]))
	return;
?>

<div class="page__menu__fixed">
    <nav class="page__menu">
        <div class="container">
            <ul class="menu__list">

                <?foreach($arResult["ALL_ITEMS"] as $arItem):?>
                    <li class="menu__item">
                        <a href="<?=$arItem['LINK']?>"><?=$arItem['TEXT']?></a>
                    </li>
                <?endforeach;?>
            </ul>
        </div>
    </nav>
</div>