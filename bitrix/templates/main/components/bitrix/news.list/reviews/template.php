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


<div class="reviews__slider__block">
    <div class="reviews__slider js__reviews">
    <?
    $i = 0;
    foreach($arResult["ITEMS"] as $arItem):
        $i++;
        $class = 'left_top';
        if($i == 2)
            $class = 'right_bottom';?>
        <? if($i == 1):?>
            <div class="review__slide">
                <div class="review__item">
        <?endif;?>

                <div class="review__image review__image_<?=$class?>">
                    <a href="<?= $arItem['PREVIEW_PICTURE']['SRC']?>" class="fancybox" rel="reviews">
                        <img src="<?=$arItem['PREVIEW_PICTURE']['SRC']?>"/>
                    </a>
                </div>

        <? if($i == 2):?>
                </div>
            </div>
        <? $i = 0;endif;?>

    <?endforeach;?>

    </div>
</div>

<!--<div class="reviews__slider__block">-->
<!--    <div class="reviews__slider js__reviews">-->
<!--        <div class="review__slide">-->
<!--            <div class="review__item">-->
<!--                <div class="review__image review__image_left_top">-->
<!--                    <a href="content/r1.jpg" class="fancybox" rel="reviews">-->
<!--                        <img src="content/r1.jpg"/>-->
<!--                    </a>-->
<!--                </div>-->
<!--                <div class="review__image review__image_right_bottom">-->
<!--                    <a href="content/r2.jpg" class="fancybox" rel="reviews">-->
<!--                        <img src="content/r2.jpg"/>-->
<!--                    </a>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--        <div class="review__slide">-->
<!--            <div class="review__item">-->
<!--                <div class="review__image review__image_left_top">-->
<!--                    <a href="content/r1.jpg" class="fancybox" rel="reviews">-->
<!--                        <img src="content/r1.jpg"/>-->
<!--                    </a>-->
<!--                </div>-->
<!--                <div class="review__image review__image_right_bottom">-->
<!--                    <a href="content/r2.jpg" class="fancybox" rel="reviews">-->
<!--                        <img src="content/r2.jpg"/>-->
<!--                    </a>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--        <div class="review__slide">-->
<!--            <div class="review__item">-->
<!--                <div class="review__image review__image_left_top">-->
<!--                    <a href="content/r1.jpg" class="fancybox" rel="reviews">-->
<!--                        <img src="content/r1.jpg"/>-->
<!--                    </a>-->
<!--                </div>-->
<!--                <div class="review__image review__image_right_bottom">-->
<!--                    <a href="content/r2.jpg" class="fancybox" rel="reviews">-->
<!--                        <img src="content/r2.jpg"/>-->
<!--                    </a>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--    </div>-->
<!--</div>-->
