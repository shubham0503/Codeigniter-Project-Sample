<?php
class ReportModel extends CI_Model{
    public function getHeadUnitTypeCount($oemId){
        $query = $this->db->query("SELECT OVD.id, OVD.oem_model_id, OVD.head_unit_type, count(OVD.head_unit_type) as tot_head_unit_type FROM oem_variant_deails OVD INNER JOIN (SELECT Distinct OM.id FROM oem_model OM where OM.oem_id='".$oemId."') OMR ON OMR.id = OVD.oem_model_id GROUP BY OVD.head_unit_type");
        
        return $query->result_array();
    }
    
    public function getOem($oemId){
        $query = $this->db->query("SELECT oem.* FROM oem WHERE id='".$oemId."'");
        return $query->result();
        
    }
    
    public function getOemList(){
        $res = $this->db->select(array('id','name'))
         ->from('oem')
         ->group_by('name')
         ->get();
        
        return($res->result());
    }
    
    public function getModelWithAvailability($proxy = 0, $carplay = 0, $android_auto = 0){
        $query = $this->db->query("SELECT OM.name, OM.segment_name, OVDR.variant, OVDR.standard, OVDR.stand_alone, OVDR.pack FROM oem_model OM INNER JOIN (SELECT OVD.* from oem_variant_deails OVD where (ovd.proxy = '".$proxy."') AND (ovd.carplay = '".$carplay."') AND (ovd.android_auto = '".$android_auto."')) OVDR where OM.id = OVDR.oem_model_id");
        
        return $query->result_array();exit;
    }
}