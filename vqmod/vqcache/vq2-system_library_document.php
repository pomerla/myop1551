<?php
class Document {
	private $title;
	private $description;
	private $keywords;	
	private $links = array();		
	private $styles = array();
	private $scripts = array();
	private $og_image;

	public function setTitle($title) {
		$this->title = $title;
	}
	
 
						public function title2uri($sValue,$db) {

							//require_once(VQMod::modCheck('config.php'));
							//require_once(VQMod::modCheck(DIR_SYSTEM . 'library/db.php'));
							/*$suggested_alias =  str_replace(
								array('&', '/', '\\', '"', '+',' '), 
								array('-', '-', '-', '-', '-','-'),  
								trim($sValue)
							);*/

							$converter = array(
								'а' => 'a',   'б' => 'b',   'в' => 'v',
								'г' => 'g',   'д' => 'd',   'е' => 'e',
								'ё' => 'e',   'ж' => 'zh',  'з' => 'z',
								'и' => 'i',   'й' => 'y',   'к' => 'k',
								'л' => 'l',   'м' => 'm',   'н' => 'n',
								'о' => 'o',   'п' => 'p',   'р' => 'r',
								'с' => 's',   'т' => 't',   'у' => 'u',
								'ф' => 'f',   'х' => 'h',   'ц' => 'c',
								'ч' => 'ch',  'ш' => 'sh',  'щ' => 'sch',
								'ь' => '\'',  'ы' => 'y',   'ъ' => '\'',
								'э' => 'e',   'ю' => 'yu',  'я' => 'ya',

								'А' => 'A',   'Б' => 'B',   'В' => 'V',
								'Г' => 'G',   'Д' => 'D',   'Е' => 'E',
								'Ё' => 'E',   'Ж' => 'Zh',  'З' => 'Z',
								'И' => 'I',   'Й' => 'Y',   'К' => 'K',
								'Л' => 'L',   'М' => 'M',   'Н' => 'N',
								'О' => 'O',   'П' => 'P',   'Р' => 'R',
								'С' => 'S',   'Т' => 'T',   'У' => 'U',
								'Ф' => 'F',   'Х' => 'H',   'Ц' => 'C',
								'Ч' => 'Ch',  'Ш' => 'Sh',  'Щ' => 'Sch',
								'Ь' => '\'',  'Ы' => 'Y',   'Ъ' => '\'',
								'Э' => 'E',   'Ю' => 'Yu',  'Я' => 'Ya',
							);

							$sValue = strtr($sValue, $converter); // в транслит 
							$sValue = strtolower($sValue); // в нижний регистр
							$sValue = preg_replace('~[^-a-z0-9_]+~u', '-', $sValue);	// заменям все ненужное нам на "-"
							$suggested_alias = trim($sValue, "-");  // удаляем начальные и конечные '-'
					//echo $suggested_alias;
							//$db2 = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
							//$registry = new Registry();
							$query_alias = $db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `keyword` = '$suggested_alias'");
					//print_r ($query_alias);
							if ($query_alias->num_rows) {
								$suggested_id = $query_alias->row['url_alias_id'];
								$suggested_alias .= "-$suggested_id";
							}	
							return $suggested_alias;
						}
							
							
	public function getTitle() {
		return $this->title;
	}
	
	public function setDescription($description) {
		$this->description = $description;
	}
	
	public function getDescription() {
		return $this->description;
	}
	
	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}
	
	public function getKeywords() {
		return $this->keywords;
	}
	
	public function addLink($href, $rel) {
		$this->links[md5($href)] = array(
			'href' => $href,
			'rel'  => $rel
		);			
	}
	
	public function getLinks() {
		return $this->links;
	}	
	
	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[md5($href)] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}
	
	public function getStyles() {
		return $this->styles;
	}	
	
	public function addScript($script) {
		$this->scripts[md5($script)] = $script;			
	}
	
	public function getScripts() {
		return $this->scripts;
	}

	public function setOgImage($image) {
		$this->og_image = $image;
}

	public function getOgImage() {
		return $this->og_image;
	}
}
?>