<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_Pesanan extends CI_Model
{
    protected $table = 'pesanan';
    public function list_data(){
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->order_By("created_at","DESC");
        $query = $this->db->get();
        if ($query->num_rows() == 0) {
            return FALSE;
        } else {
            return $query->result_array();
        }
    }

    public function pesan($data){
        return $this->db->insert($this->table,$data);
    }

    public function detail($id){
        return $this->db->get_where($this->table,["id_darah"=>$id])->result();
    }

    public function update_stok($id,$stok){
        $this->db->set("stok",$stok);
        $this->db->where("id_darah",$id);

        return $this->db->update($this->table);
    }

    public function riwayat_pesan($id_user){
        $this->db->where("id_user",$id_user);
        $this->db->from($this->table);
        $this->db->order_by("created_at","DESC");
        return $this->db->select("*")->get()->result_array();
    }

    public function update($id_pesanan,$data){
        $this->db->set($data);
        $this->db->where("id_pesanan",$id_pesanan);

        return $this->db->update($this->table);
    }
}