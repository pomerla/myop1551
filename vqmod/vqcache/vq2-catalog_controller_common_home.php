<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
            

		$this->data['heading_title'] = $this->config->get('config_title');

			$settings = $this->config->get('opencart_settings');
			$settings = $settings[$this->config->get('config_store_id')][$this->config->get('config_language_id')];
			
			if (isset($settings['home_banner1'])) {$this->data['home_banner1'] = html_entity_decode($settings['home_banner1']);}
			if (isset($settings['home_banner2'])) {$this->data['home_banner2'] = html_entity_decode($settings['home_banner2']);}
			if (isset($settings['home_banner3'])) {$this->data['home_banner3'] = html_entity_decode($settings['home_banner3']);}
			
			
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>