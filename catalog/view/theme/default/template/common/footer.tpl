<div id="footer">
<div class="column_2">
    <h3><?php if (isset($text_footer_link)) { ?><?php echo $text_footer_link; ?><?php } ?></h3>
        <ul>
            <?php if (isset($footerlinks)) { ?>
            <?php foreach ($footerlinks as $footerlink) { ?>
           	    <li style="margin-left: -40px; margin-top: 2px;"><a href="<?php echo $footerlink['link']; ?>" title="<?php echo $footerlink['title']; ?>"><?php echo $footerlink['title']; ?></a></li>
            <?php } ?>
            <?php } ?>                     
        </ul>
</div>

<div class="column_2">
    <h3><?php if (isset($text_footer_information)) { ?><?php echo $text_footer_information; ?><?php } ?></h3>
    <address class="contact-info contact-info--list">
        <span class="contact-info__item">
            <?php if (isset($store_information)) { ?><?php echo $store_information; ?><?php } ?>
        </span>
    </address>
</div>


<div class="column_2">
    <h3><?php if (isset($text_footer_soclink)) { ?><?php echo $text_footer_soclink; ?><?php } ?></h3>
    <ul>
        <?php if (isset($socials)) { ?>
            <?php foreach ($socials as $social) { ?>
           	    <li class="social__item"><a class="social__link bg-color" href="<?php echo $social['link']; ?>" target="_blank" style="outline: none; cursor: inherit;"><i class="social__icon fa <?php echo $social['icon']; ?>" style="outline: none; cursor: inherit;"></i></a></li>
            <?php } ?>
        <?php } ?>
    </ul>
</div>

</div>



<div id="footer">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered"><?php echo $powered; ?></div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>
</body></html>