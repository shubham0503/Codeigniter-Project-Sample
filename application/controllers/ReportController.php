<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ReportController extends CI_Controller {
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/report
	 *	- or -
	 * 		http://example.com/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
    
    public function __construct() {
    //load database in autoload libraries 
      parent::__construct(); 
      $this->load->model('ReportModel');    
    }
    
    public function index(){
        $data['oemData'] = $this->ReportModel->getOemList();
        $this->load->view('report',$data);
    }
    
    public function getHeadUnitType(){
        try{
            $headUnitType = $this->ReportModel->getHeadUnitTypeCount($this->input->post('oem'));

            $data = array('headUnitType' => $headUnitType, "response" => array("status" => "200", "message" => "Fetched Data Successfully"));
        }catch(Exception $e){    
            log_message("error", $e->getMessage());
            $data = array('headUnitType' => array(), "response" => array("status" => "201", "message" => "Something Went Wrong"));
        }
        echo json_encode($data, true);die;
    }
    
    
    public function getModelWithAvailability(){
        try{
            $availability = $this->ReportModel->getModelWithAvailability($this->input->post('proxy'), $this->input->post('carplay'), $this->input->post('androidAuto'));

            $data = array('availability' => $availability, "response" => array("status" => "200", "message" => "Fetched Data Successfully"));
        }catch(Exception $e){    
            log_message("error", $e->getMessage());
            $data = array('availability' => array(), "response" => array("status" => "201", "message" => "Something Went Wrong"));
        }
        echo json_encode($data, true);die;
    }
}