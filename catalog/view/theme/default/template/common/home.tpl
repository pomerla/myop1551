<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<?php if(isset($home_banner1) && isset($home_banner2) && isset($home_banner3)) { ?>
<div class="row home_banners">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"><?php echo $home_banner1; ?></div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 div"><?php echo $home_banner2; ?></div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 div"><?php echo $home_banner3; ?></div>
</div>
<?php } ?>

<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>