<?
if(!defined("B_PROLOG_INCLUDED")||B_PROLOG_INCLUDED!==true)die();
/**
 * Bitrix vars
 *
 * @var array $arParams
 * @var array $arResult
 * @var CBitrixComponentTemplate $this
 * @global CMain $APPLICATION
 * @global CUser $USER
 */
?>
<div class="mfeedback">
<?if(!empty($arResult["ERROR_MESSAGE"]))
{
	foreach($arResult["ERROR_MESSAGE"] as $v)
		ShowError($v);
}
if($arResult["OK_MESSAGE"] <> '')
{
	?><div class="mf-ok-text"><?=$arResult["OK_MESSAGE"]?></div><?
}
?>

    <div class="call__section__right">
        <div class="call__section__form">
            <form class="form js_form" action="<?= POST_FORM_ACTION_URI ?>" method="POST">
                <?= bitrix_sessid_post() ?>
                <div class="form__fields__wrap">
                    <div class="form__field form__required">
                        <input type="text" class="form__control" placeholder="Имя" data-required="true"
                               data-rule="name" name="user_name">
                    </div>
                    <div class="form__field form__required">
                        <input type="text" class="form__control phone-mask " placeholder="Телефон" data-required="true"
                               data-rule="phone" name="user_phone">
                    </div>
                    <span class="error__text">Заполните все поля</span>
                </div>
                <div class="form__fields__wrap">
                    <div class="form__field call__text">
                        Введите Ваши данные, и мы перезвоним Вам в ближайшее время
                    </div>
                <div class="form__field">
                    <input type="hidden" name="PARAMS_HASH" value="<?= $arResult["PARAMS_HASH"] ?>">
                    <button class="button button__call__form" type="submit" name="submit">Заказать замер</button>
                </div>
                </div>
            </form>
        </div>
    </div>
</div>