<?php
class ControllerModuleOpencartSettings extends Controller {
	private $error = array(); 
	
	public function index() {
	
		$this->load->language('module/opencart_settings');
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->validate();
		}
		
		$this->data['lang'] = array_merge($this->data, $this->language->load('module/opencart_settings'));
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token='.$this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token='.$this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title_1'),
			'href'      => $this->url->link('module/opencart_settings', 'token='.$this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/opencart_settings', 'token='.$this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token='.$this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 50, 50);
		
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		
		$this->load->model('setting/store');
		
		$results = $this->model_setting_store->getStores();
		
		$this->data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name') . $this->language->get('text_default'),
		);
 
    	foreach ($results as $result) {		
			$this->data['stores'][] = array(
				'store_id' => $result['store_id'],
				'name'     => $result['name'],
			);
		}
		
		if (isset($this->request->post['opencart_settings'])) {
			$this->data['opencart_settings'] = $this->request->post['opencart_settings'];
		} elseif ($this->config->get('opencart_settings')) {
			$this->data['opencart_settings'] = $this->config->get('opencart_settings');
		} else {
			$this->data['opencart_settings'] = array();
		}
			
		$this->template = 'module/opencart_set.tpl';
		
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/opencart_settings')) {
			$this->error['warning'] = 'У вас недостаточно прав для управления настройками шаблона!';
		} else {
		  
           
			$this->saveSettings($this->request->post);
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	private function saveSettings($data) {
		$url = $this->url->link('module/opencart_settings', 'token='.$this->session->data['token'], 'SSL');
		$this->model_setting_setting->editSetting('opencart_settings', $data);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->redirect($url);
	}
}
?>