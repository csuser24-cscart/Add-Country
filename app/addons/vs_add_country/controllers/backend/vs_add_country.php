<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

use Tygh\Registry;
if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($mode == 'update') {
    	if(!empty($_REQUEST['country_data']))
    	{
    		$check_exist = db_get_field('SELECT code FROM ?:countries WHERE code = ?s',$_REQUEST['country_data']['country_code']);
    		if(empty($check_exist) && !empty($_REQUEST['country_data']['country_code']))
    		{
					$data = array(
					    'code' => $_REQUEST['country_data']['country_code'],
					    'code_A3' => $_REQUEST['country_data']['country_a3_code'],
					    'code_N3' => $_REQUEST['country_data']['country_n3_code'],
					    'region' => $_REQUEST['country_data']['country_region'],
					    'lat' => $_REQUEST['country_data']['country_latitute'],
					    'lon' => $_REQUEST['country_data']['country_longitute'],
					    'status' => $_REQUEST['country_data']['status'],
					    'country' => $_REQUEST['country_data']['country_name'],
					    'lang_code' => DESCR_SL,
					);
					try {
						db_query('INSERT INTO ?:countries ?e', $data);
						db_query('INSERT INTO ?:country_descriptions ?e', $data);
					} catch(Exception $e) {
						fn_set_notification('E',__('error'),$e->getmessage());
					}
					
					fn_set_notification('N',__('notify'),__('country_added_successfully'));

    		}else {
    			fn_set_notification('W',__('warning'),__('country_code_already_exist'));
    		}
    	}        
    }
    return array(CONTROLLER_STATUS_OK, 'countries.manage');

}
if ($mode == 'update') {
       
    }