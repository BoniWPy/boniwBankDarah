<h1 class="pt-3">Pesan Baru</h1>
<div class="row">
	<div class="col-sm-12 col-lg-12">
		<div class="card card-body">
			<?php echo $this->session->flashdata("alert") ?>
			<form action="" method="post">
				<div class="row">
				    <div class="col">
				    	<label>Bagian</label>
				      	<input type="text" class="form-control" name="bagian" required>
				    </div>
				    <div class="col">
				    	<label>Kamar</label>
				      	<input type="text" class="form-control" name="kamar" required>
				    </div>
				</div>
				<div class="row">
				    <div class="col">
				    	<label>Dokter yang meminta</label>
				      	<input type="text" class="form-control" name="dokter" required>
				    </div>
				    <div class="col">
				    	
				    </div>
				</div>
				<div class="row">
				    <div class="col">
				    	<label>Diagnosa</label>
				      	<input type="text" class="form-control" name="diagnosa" required>
				    </div>
				    <div class="col">
				    	<label>Hb</label>
				      	<input type="text" class="form-control" name="hb" required>
				    </div>
				</div>
				<hr/>
				<div class="row">
				    <div class="col">
				    	<label>Nama Pasien</label>
				      	<input type="text" class="form-control" name="nama_pasien" required>
				    </div>
				    <div class="col">
				    	<label>Nomor Register</label>
				      	<input type="text" class="form-control" name="nomor_register" required>
				    </div>
				</div>
				<div class="row">
				    <div class="col">
				    	<label>Jenis Kelamin (L/P):</label>
				      	<select class="form-control" name="jenis_kelamin" required>
				      		<option value="laki-laki">Laki-laki</option>
				      		<option value="perempuan">Perempuan</option>
				      	</select>
				    </div>
				    <div class="col">
				    	<label>Umur</label>
				      	<input type="text" class="form-control" name="umur" required>
				    </div>
				</div>
				<div class="row">
				    <div class="col">
				    	<label>Alamat</label>
				      	<textarea class="form-control" name="alamat"></textarea>
				    </div>
				</div>
				<hr/>
				<h4>Pesanan Darah</h4>
				<div class="row">
				    <div class="col">
				    	<label>Darah Tersedia</label>
				      	<select class="form-control darah" name="darah" required>
				      		<option>Pilih Darah</option>
				      		<?php foreach($list as $data){ ?>
				      		<option value="<?php echo $data['id_darah'] ?>"><?php echo $data['golongan'] ?></option>
				      		<?php } ?>
				      	</select>
				    </div>
				</div>
				<br/>
				<div class="row">
				    <div class="col detail">
				    	
				    </div>
				</div>
				<div class="row">
				    <div class="col">
				    	<label>Jumlah diminta</label>
				      	<input type="text" class="form-control" name="jumlah" required>
				    </div>
				</div>
				<br/><br/>
				<div class="text-center">
					<button class="btn btn-md btn-success">Pesan</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>

	var base_url = '<?php echo base_url("/") ?>'

	$(document).ready(function(){
		$('.darah').change(function(){
			var id_darah = $(this).val();

			var ajax_link = base_url + 'pesanan/detail/' + id_darah

			$.get(ajax_link).fail(function(xhr,code,err){
				alert(err)
			}).done(function(res){
				$('.detail').html(res)
			});
		});
	});
</script>