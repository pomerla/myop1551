<?php echo $header; ?>

<div id="content">
<div class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
<?php } ?>
</div>
<?php if ($success) { ?><div class="success"><?php echo $success; ?></div><?php } ?>
<?php if ($error_warning) { ?><div class="warning"><?php echo $error_warning; ?></div><?php } ?>
<div class="box">
<div class="heading">
<h1><img src="view/image/module.png" alt="" /> <?php echo $lang['heading_title_1']; ?></h1>
<div class="buttons">
<a onclick="$('.opencart_settings').submit();" class="button"><?php echo $lang['button_save']; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $lang['button_cancel']; ?></a>
</div>
</div>
<style>
#module > * {box-sizing:border-box;}
#module .tabrow {overflow:auto;margin:0 0 3px 0;}
#module .tabrow span {display:block;float:left;margin:2px 0 0 3px;padding:3px;font-size:11px;font-weight:700;color:#f00;cursor:pointer;}
#module .button {cursor:pointer}
#module tr td {padding:7px 10px 4px}
#module tr td:first-child {width:250px;max-width:250px;padding:7px 10px 6px}
#module tr td b {font-size:1.2em;}
#module tr td span {font-size:0.9em;color:#888}
#module tr td select {display:block;float:left;height:22px;margin:0 3px 0 0;}
#module tr td input[type='text'], #module tr td textarea {display:block;float:left;width:190px !important; padding:2px 5px}
#module tr td input[type='text'] + input[type='text'] {margin:0 0 0 3px !important;}
#module tr td textarea + img{margin:0 0 0 3px}
#module tr td textarea {padding:2px 6px;width:200px !important; height:70px;}
#module img {display:block;float:left;border:solid 1px #aaa;border-right:none;background:#ddd;padding:4px 4px 5px;border-radius: 2px 0 0 2px}
#module .header {background: linear-gradient(to bottom, #eeeeee 0%,#dddddd 100%);color:#336699;text-shadow:0 1px 0 #f5f5f5;padding:6px 10px !important;border-bottom:solid 1px #ccc !important;}
.content input[type='button'] {height:22px;}
#copyright {clear:both;text-align:left;}
#box {position: fixed;left: 0;top: 0;width: 100%;height: 100%;z-index: 999;display: none;}
#box-inner {position: absolute;left: 0px;right: 0px;top: 0px;bottom: 0px;background: blue;opacity: 0.3;display: none;}
#box #container {position: absolute;top: 0; bottom: 0; right: 0; left: 0;margin: auto;height: 25em;width: 51em;border: 1px solid black;background: white;padding: 1%;}
iframe {width: 100%;height: 100%;border: none;}
</style>
<div class="content">
<div id="tabs" class="htabs">
<?php foreach ($stores as $store) { ?>
	<a href="#tab-<?php echo $store['store_id']; ?>" onclick="$('#tab-<?php echo $store['store_id']; ?> .htabs a').first().trigger('click');"><?php echo $store['name']; ?></a>
<?php } ?>
</div>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="opencart_settings">
<?php foreach ($stores as $store) { ?>
<div id="tab-<?php echo $store['store_id']; ?>" class="tab-content">
<?php $store_id = $store['store_id']; ?>
<div id="tabs1" class="htabs">
	<a href="#tab-header-<?php echo $store['store_id']; ?>">Шапка</a>
	<a href="#tab-footer-<?php echo $store['store_id']; ?>">Подвал</a>
	<a href="#tab-home-<?php echo $store['store_id']; ?>">Главная</a>
	<a href="#tab-contact-<?php echo $store['store_id']; ?>">Контакты</a>
	<a href="#tab-other-<?php echo $store['store_id']; ?>">Консультант и прочее</a>
    <a href="#tab-help-<?php echo $store['store_id']; ?>">Помощь</a>
</div>
<div id="tab-header-<?php echo $store['store_id']; ?>" class="tab-content">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки хедера</b></td></tr>
	
	<tr>
		<td>Ссылки в самом верхнем меню:<br /><span>Это то, которое над меню с категориями :)</span></td>
		<td style="padding:7px 10px 0;">
		<?php foreach ($languages as $key => $language) { ?>
		<?php $headerlinks_num = 1; ?>
		<div class="headerlinks_<?php echo $language['language_id']; ?>">
		<?php if (isset($opencart_settings[$store_id][$language['language_id']]['headerlinks'])) { ?>
        <?php foreach ($opencart_settings[$store_id][$language['language_id']]['headerlinks'] as $headerlinks) { ?>
		<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][headerlinks][<?php echo $headerlinks_num; ?>][title]" value="<?php if(isset($headerlinks['title'])) { ?><?php echo $headerlinks['title']; ?><?php } ?>" placeholder="Тут заголовок #<?php echo $headerlinks_num; ?>" />
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][headerlinks][<?php echo $headerlinks_num; ?>][link]" value="<?php if(isset($headerlinks['link'])) { ?><?php echo $headerlinks['link']; ?><?php } ?>" placeholder="А тут ссылка #<?php echo $headerlinks_num; ?>" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $headerlinks_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="max-width:436px;text-align:right;margin:0 0 3px"><input type="button" value="Добавить" onclick="addHeaderLinks('<?php echo $store_id; ?>', '<?php echo $language['language_id']; ?>', '<?php echo $language['image']; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		<?php } ?>		
		</td>
	<tr>
	
    		
	<tr>
		<td>Дополнительные телефоны:<br /><span>Показываются в блоке, появляющемся при наведении на основной телефон</span></td>
		<td>
		<?php $phones_num = 1; ?>
		<div class="phones">
		<?php if (isset($opencart_settings[$store_id]['phones'])) { ?>
        <?php foreach ($opencart_settings[$store_id]['phones'] as $phones) { ?>
		<div class="tabrow">
			<select name="opencart_settings[<?php echo $store_id; ?>][phones][<?php echo $phones_num; ?>][icon]">
				<option value="fa-phone" <?php if($phones['icon'] == 'fa-phone') { echo 'selected="selected"'; } ?>>Стационарный</option>
				<option value="fa-mobile" <?php if($phones['icon'] == 'fa-mobile') { echo 'selected="selected"'; } ?>>Сотовый</option>
				<option value="fa-skype" <?php if($phones['icon'] == 'fa-skype') { echo 'selected="selected"'; } ?>>Скайп</option>
				<option value="fa-whatsapp" <?php if($phones['icon'] == 'fa-whatsapp') { echo 'selected="selected"'; } ?>>Ватсапп</option>
				<option value="fa-fax" <?php if($phones['icon'] == 'fa-fax') { echo 'selected="selected"'; } ?>>Факс</option>
			</select>
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][phones][<?php echo $phones_num; ?>][number]" value="<?php if(isset($phones['number'])) { ?><?php echo $phones['number']; ?><?php } ?>" placeholder="Телефон #<?php echo $phones_num; ?>" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $phones_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="max-width:322px;text-align:right;margin:0 0 3px"><input type="button" value="Добавить" onclick="addPhones('<?php echo $store_id; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_email']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<div class="tabrow">
				<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][email_header]" value="<?php if(isset($opencart_settings[$store_id][$language['language_id']]['email_header'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['email_header']; ?><?php } else { ?>admin@domian.com<?php } ?>" size="40" />
			</div>
		<?php } ?>
<!-- coding email -->        
        <div style="float:right; margin-top: -35px;">

 <a id="formLink" href="javascript:void(0)"><?php echo $lang['entry_email_1']; ?></a><br />
 <?php echo $lang['entry_email_desk']; ?>
<div id="box">
    <div id="box-inner">
    </div>
    <div id="container">
        <iframe src="../catalog/view/theme/default/template/common/mail_dekoder.html"></iframe>
    </div>
</div> 
 <script type="text/javascript">
document.getElementById("formLink").onclick = function()
{
    document.getElementById("box").style.display = "block";
    document.getElementById("box-inner").style.display = "block";
}
document.getElementById("box").onclick = function(e)
{
    if(e.toElement == document.getElementById("box-inner"))
    {
        document.getElementById("box").style.display = "none";
        document.getElementById("box-inner").style.display = "none";
    }
}
 </script> 
        </div>
<!-- coding email -->           	
		</td>
    </tr>
	
	
</table>
</div>
<div id="tab-footer-<?php echo $store['store_id']; ?>" class="tab-content">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки футера</b></td></tr>
    <tr>
		<td><?php echo $lang['entry_text_footer_link']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][text_footer_link]" value="<?php if(isset($opencart_settings[$store_id][$language['language_id']]['text_footer_link'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['text_footer_link']; ?><?php } else { ?>Дополнительно<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
    <tr>
		<td>Ссылки в футере:<br /></td>
		<td style="padding:7px 10px 0;">
		<?php foreach ($languages as $key => $language) { ?>
		<?php $footerlinks_num = 1; ?>
		<div class="footerlinks_<?php echo $language['language_id']; ?>">
		<?php if (isset($opencart_settings[$store_id][$language['language_id']]['footerlinks'])) { ?>
        <?php foreach ($opencart_settings[$store_id][$language['language_id']]['footerlinks'] as $footerlinks) { ?>
		<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][footerlinks][<?php echo $footerlinks_num; ?>][title]" value="<?php if(isset($footerlinks['title'])) { ?><?php echo $footerlinks['title']; ?><?php } ?>" placeholder="Тут заголовок #<?php echo $footerlinks_num; ?>" />
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][footerlinks][<?php echo $footerlinks_num; ?>][link]" value="<?php if(isset($footerlinks['link'])) { ?><?php echo $footerlinks['link']; ?><?php } ?>" placeholder="А тут ссылка #<?php echo $footerlinks_num; ?>" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $footerlinks_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="max-width:436px;text-align:right;margin:0 0 3px"><input type="button" value="Добавить" onclick="addFooterLinks('<?php echo $store_id; ?>', '<?php echo $language['language_id']; ?>', '<?php echo $language['image']; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		<?php } ?>
		</td>
	</tr>
	
    <tr>
		<td><?php echo $lang['entry_text_footer_information']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][text_footer_information]" value="<?php if(isset($opencart_settings[$store_id][$language['language_id']]['text_footer_information'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['text_footer_information']; ?><?php } else { ?>О магазине<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
    <tr>
		<td><?php echo $lang['entry_store_information']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][store_information]" ><?php if(isset($opencart_settings[$store_id][$language['language_id']]['store_information'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['store_information']; ?><?php } else { ?>Супермаркет для животных предлагает зоотовары для собак, кошек, птиц, грызунов, рыб, рептилий и лошадей. У нас в ассортименте повседневный и лечебный корм для животных, лакомства, витамины и добавки, посуда, средства гигиены.<?php } ?></textarea>
            </div>
		<?php } ?>	
		</td>
    </tr>
	
    <tr>
		<td><?php echo $lang['entry_text_footer_soclink']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][text_footer_soclink]" value="<?php if(isset($opencart_settings[$store_id][$language['language_id']]['text_footer_soclink'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['text_footer_soclink']; ?><?php } else { ?>Мы в сети<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
    <tr>
		<td><?php echo $lang['entry_footer_socials']; ?></td>
		<td>
		<?php $socials_num = 1; ?>
		<div class="socials">
		<?php if (isset($opencart_settings[$store_id]['socials'])) { ?>
        <?php foreach ($opencart_settings[$store_id]['socials'] as $socials) { ?>
		<div class="tabrow">
			<select name="opencart_settings[<?php echo $store_id; ?>][socials][<?php echo $socials_num; ?>][icon]">
				<option value="fa-odnoklassniki" <?php if($socials['icon'] == 'fa-odnoklassniki') { echo 'selected="selected"'; } ?>>Одноклассники</option>
                <option value="fa-vk" <?php if($socials['icon'] == 'fa-vk') { echo 'selected="selected"'; } ?>>ВКонтакте</option>
                <option value="fa-facebook" <?php if($socials['icon'] == 'fa-facebook') { echo 'selected="selected"'; } ?>>Фейсбук</option>
                <option value="fa-twitter" <?php if($socials['icon'] == 'fa-twitter') { echo 'selected="selected"'; } ?>>Твиттер</option>
                <option value="fa-google-plus" <?php if($socials['icon'] == 'fa-google-plus') { echo 'selected="selected"'; } ?>>Гугл+</option>
                <option value="fa-instagram" <?php if($socials['icon'] == 'fa-instagram') { echo 'selected="selected"'; } ?>>Инстаграм</option>
                <option value="fa-youtube" <?php if($socials['icon'] == 'fa-youtube') { echo 'selected="selected"'; } ?>>Ютуб</option>
                <option value="fa-pinterest" <?php if($socials['icon'] == 'fa-pinterest') { echo 'selected="selected"'; } ?>>Пинтерест</option>
                <option value="fa-tumblr" <?php if($socials['icon'] == 'fa-tumblr') { echo 'selected="selected"'; } ?>>Тамблер</option>
                <option value="fa-linkedin" <?php if($socials['icon'] == 'fa-linkedin') { echo 'selected="selected"'; } ?>>LinkedIn</option>
                <option value="fa-github-alt" <?php if($socials['icon'] == 'fa-github-alt') { echo 'selected="selected"'; } ?>>GitHub</option>
                <option value="fa-flickr" <?php if($socials['icon'] == 'fa-flickr') { echo 'selected="selected"'; } ?>>Flickr</option>
                <option value="fa-vimeo-square" <?php if($socials['icon'] == 'fa-vimeo-square') { echo 'selected="selected"'; } ?>>Vimeo</option>
                <option value="fa-dribbble" <?php if($socials['icon'] == 'fa-dribbble') { echo 'selected="selected"'; } ?>>Dribbble</option>
                <option value="fa-stumbleupon" <?php if($socials['icon'] == 'fa-stumbleupon') { echo 'selected="selected"'; } ?>>StumbleUpon</option>
                <option value="fa-soundcloud" <?php if($socials['icon'] == 'fa-soundcloud') { echo 'selected="selected"'; } ?>>SoundCloud</option>
                <option value="fa-behance" <?php if($socials['icon'] == 'fa-behance') { echo 'selected="selected"'; } ?>>Behance</option>
			</select>
			<input type="text" name="opencart_settings[<?php echo $store_id; ?>][socials][<?php echo $socials_num; ?>][link]" value="<?php if(isset($socials['link'])) { ?><?php echo $socials['link']; ?><?php } ?>" placeholder="Ссылка" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $socials_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="max-width:322px;text-align:right;margin:0 0 3px"><input type="button" value="Добавить" onclick="addSocials('<?php echo $store_id; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		</td>
	</tr>
    
    
    
    
    
    
    
</table>
</div>
<div id="tab-home-<?php echo $store['store_id']; ?>" class="tab-content">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки главной страницы</b></td></tr>

	<tr>
		<td><?php echo $lang['entry_home_banner']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][home_banner1]" ><?php if(isset($opencart_settings[$store_id][$language['language_id']]['home_banner1'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['home_banner1']; ?><?php } else { ?><i class="fa fa-gift"></i><strong>ИМЕНИННИКАМ СКИДКА 15%</strong><p>За 3 дня до и после дня рождения.</p><?php } ?></textarea>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][home_banner2]" ><?php if(isset($opencart_settings[$store_id][$language['language_id']]['home_banner2'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['home_banner2']; ?><?php } else { ?><i class="fa fa-clock-o"></i><strong>СКИДКА 10% НА ОБЕДЫ В ОФИС</strong><p>По будням, с 10:00 до 16:00</p><?php } ?></textarea>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="opencart_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][home_banner3]" ><?php if(isset($opencart_settings[$store_id][$language['language_id']]['home_banner3'])) { ?><?php echo $opencart_settings[$store_id][$language['language_id']]['home_banner3']; ?><?php } else { ?><i class="fa fa-coffee"></i><strong>КОФЕ БЕСПЛАТНО</strong><p>При заказе на сумму от 1000руб</p><?php } ?></textarea>
			</div>
		<?php } ?>
		</td>
	</tr>
</table>
</div>




<div id="tab-contact-<?php echo $store['store_id']; ?>" class="tab-content">
<table id="module" class="list">
	<tr>
		<td colspan="2" class="header"><b>Карта на странице контактов</b></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_maps']; ?></td>
		<td><textarea type="text" name="opencart_settings[<?php echo $store_id; ?>][map]" cols="50" rows="6"><?php if(isset($opencart_settings[$store_id]['map'])) { ?><?php echo $opencart_settings[$store_id]['map']; ?><?php } else { ?><script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=0-UEqyhQjzOUNY4v2mkEt21fwIDcbzO3&width=600&height=450"></script><?php } ?></textarea></td>
	</tr>
</table>
</div>
<div id="tab-other-<?php echo $store['store_id']; ?>" class="tab-content">
<table id="module" class="list">
	<tr>
		<td colspan="2" class="header"><b>Прочие настройки</b></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_enable_jquery_ui']; ?></td>
		<td><input type="checkbox" name="opencart_settings[<?php echo $store_id; ?>][enable_konsult]" value="1" <?php if (isset($opencart_settings[$store_id]['enable_konsult'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_custom_style']; ?></td>
		<td><input type="text" name="opencart_settings[<?php echo $store_id; ?>][custom_style]" value="<?php if(isset($opencart_settings[$store_id]['custom_style'])) { ?><?php echo $opencart_settings[$store_id]['custom_style']; ?><?php } ?>" placeholder="Пример: my_mega_style.css"/></td>
	</tr>
	
	
	
	
	
</table>
</div>

<div id="tab-help-<?php echo $store['store_id']; ?>" class="tab-content">
<table id="module" class="list">
	<tr>
		<td colspan="2" class="header"><b>Помощь для внедрения в другой шаблон</b></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_enable_jquery_ui_h']; ?></td>
		<td>
        <pre><code>
&lt;?php if (isset($enable_konsult)) { ?&gt;
   &lt;script type="text/javascript" src="/livechat/php/app.php?widget-init.js"&gt;&lt;/script&gt;
&lt;?php } ?&gt;
        </code><pre>
        </td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_custom_style_h']; ?></td>
		<td>
        <pre><code>
&lt;?php if (isset($custom_style)) { ?&gt;
   &lt;script type="text/javascript" src="catalog/view/theme/default/stylesheet/&lt;?php echo $custom_style; ?&gt;"&gt;&lt;/script&gt;
&lt;?php } ?&gt;
        </code><pre>
        </td>
	</tr>
	
	<tr>
		<td><?php echo $lang['entry_maps_h']; ?></td>
		<td>
        <pre><code>
&lt;?php if (isset($contact_map)) { ?&gt;
   &lt;div style="margin-top:15px; margin-bottom:15px;"&gt;&lt;?php echo $contact_map; ?&gt;&lt;/div&gt;
&lt;?php } ?&gt;
        </code><pre>
        </td>
	</tr>
	
	
	
</table>
</div>

</div>
<?php } ?>
<input type="hidden" name="apply" value="0" />
</form>
<div id="copyright"><?php echo $lang['text_copyright']; ?></div>
</div>
</div>



<script>
	function addHeaderLinks(store_id, lang_id, lang_img) {
		var headerlinks_num = $('#tab-header-'+store_id+' .headerlinks_'+lang_id+' .tabrow').size()+1;
		if (headerlinks_num > 4) {
			if (!confirm('Внимание! Большое количество ссылок может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<img src="view/image/flags/'+lang_img+'" title="" alt=""  />';
		html += '<input type="text" name="opencart_settings['+store_id+']['+lang_id+'][headerlinks]['+headerlinks_num+'][title]" value="" placeholder="Тут заголовок #'+headerlinks_num+'" />';
		html += '<input type="text" name="opencart_settings['+store_id+']['+lang_id+'][headerlinks]['+headerlinks_num+'][link]" value="" placeholder="А тут ссылка #'+headerlinks_num+'" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-header-'+store_id+' .headerlinks_'+lang_id).append(html);
	}

	function addPhones(store_id) {
		var phones_num = $('#tab-header-'+store_id+' .phones .tabrow').size()+1;
		if (phones_num > 8) {
			if (!confirm('Внимание! Большое количество номеров телефонов может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<select name="opencart_settings['+store_id+'][phones]['+phones_num+'][icon]">';
		html += '<option value="fa-phone" selected="selected">Стационарный</option>';
		html += '<option value="fa-mobile">Сотовый</option>';
		html += '<option value="fa-skype">Скайп</option>';
		html += '<option value="fa-whatsapp">Ватсапп</option>';
		html += '<option value="fa-fax">Факс</option>';
		html += '</select>';
		html += '<input type="text" name="opencart_settings['+store_id+'][phones]['+phones_num+'][number]" value="" placeholder="Телефон #'+phones_num+'" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-header-'+store_id+' .phones').append(html);
	}

	function addFooterLinks(store_id, lang_id, lang_img) {
		var footerlinks_num = $('#tab-footer-'+store_id+' .footerlinks_'+lang_id+' .tabrow').size()+1;
		if (footerlinks_num > 10) {
			if (!confirm('Внимание! Большое количество ссылок может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<img src="view/image/flags/'+lang_img+'" title="" alt=""  />';
		html += '<input type="text" name="opencart_settings['+store_id+']['+lang_id+'][footerlinks]['+footerlinks_num+'][title]" value="" placeholder="Тут заголовок #'+footerlinks_num+'" />';
		html += '<input type="text" name="opencart_settings['+store_id+']['+lang_id+'][footerlinks]['+footerlinks_num+'][link]" value="" placeholder="А тут ссылка #'+footerlinks_num+'" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-footer-'+store_id+' .footerlinks_'+lang_id).append(html);
	}

	function addSocials(store_id) {
		var socials_num = $('#tab-footer-'+store_id+' .socials .tabrow').size()+1;
		if (socials_num > 20) {
			if (!confirm('Внимание! Большое количество иконок соцсетей может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<select name="opencart_settings['+store_id+'][socials]['+socials_num+'][icon]">';
		html += '<option value="fa-odnoklassniki" selected="selected">Одноклассники</option>';
		html += '<option value="fa-vk">ВКонтакте</option>';
		html += '<option value="fa-facebook">Фейсбук</option>';
		html += '<option value="fa-twitter">Твиттер</option>';
		html += '<option value="fa-google-plus">Гугл+</option>';
		html += '<option value="fa-instagram">Инстаграм</option>';
		html += '<option value="fa-youtube">Ютуб</option>';
		html += '<option value="fa-pinterest">Пинтерест</option>';
        html += '<option value="fa-tumblr">Тамблер</option>';
        html += '<option value="fa-linkedin">LinkedIn</option>';
        html += '<option value="fa-github-alt">GitHub</option>';
        html += '<option value="fa-flickr">Flickr</option>';
        html += '<option value="fa-vimeo-square">Vimeo</option>';
        html += '<option value="fa-dribbble">Dribbble</option>';
        html += '<option value="fa-stumbleupon">StumbleUpon</option>';
        html += '<option value="fa-soundcloud">SoundCloud</option>';
        html += '<option value="fa-behance">Behance</option>';
		html += '</select>';
		html += '<input type="text" name="opencart_settings['+store_id+'][socials]['+socials_num+'][link]" value="" placeholder="Ссылка" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-footer-'+store_id+' .socials').append(html);
	}
</script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#tabs1 a').tabs();

function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $lang['text_image_manager']; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<?php echo $footer; ?>