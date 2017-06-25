<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $repair; ?>" class="button"><?php echo $button_repair; ?></a><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($categories) { ?>
            <?php foreach ($categories as $category) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($category['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $category['name']; ?></td>
              <?php if ($this->user->hasPermission('modify', 'catalog/category')) { ?>
				<td class="left">
					  <nobr>
					  <input type="text" size="1" name="sort" value="<?php echo $category['sort_order']; ?>" id="sort<?php echo $category['category_id']; ?>" style="color:#818181; background-color: transparent; border-style: solid; border-width: 0px; border-color: grey; border-radius: 4px;" onfocus="$(this).css('background-color','white'); $(this).css('border-style','inset');" onblur="updateSort(<?php echo $category['category_id']; ?>); $(this).css('background-color','transparent'); $(this).css('border-style','solid');" />
			  
					 </nobr>
				</td>	 
				<?php } else { ?>
					<td class="right"><?php echo $category['sort_order']; ?></td>
				<?php } ?>
              <td class="right"><?php foreach ($category['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php if ($this->user->hasPermission('modify', 'catalog/category')) { ?>
					
					<script type="text/javascript"><!--
						
						function updateSort(category_id) {
							var sort = $('#sort' + category_id).val();
							$.post('index.php?route=catalog/category/sort&token=<?php echo $this->session->data['token']; ?>', 'sort=' + sort + '&category_id=' + category_id);setTimeout(function() {location.reload();}, 300);
						}
						
						
										
					//--></script>
					
				<?php } ?>
<?php echo $footer; ?>