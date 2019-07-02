<h1 class="mb-3 pt-3">Riwayat Pesanan</h1>
<div class="row">
	<div class="card card-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<th>Id pesanan</th>
					<th>Tanggal</th>
					<th>Pasien</th>
					<th>Status</th>
				</thead>
				<tbody>
				<?php foreach($list as $data){ ?>
					<tr>
						<td><?php echo $data['id_pesanan'] ?></td>
						<td><?php echo $data['created_at'] ?></td>
						<td><?php echo $data['pasien'] ?></td>
						<td><?php
						if( $data['status'] == 'waiting' ){
							echo '<span class="badge badge-secondary">Menunggu Konfirmasi</span>';
						}else if( $data['status'] == 'confirm' ){
							echo '<span class="badge badge-success">Sudah dikonfirmasi</span>';
						}else{
							echo '<span class="badge badge-danger">Dibatalkan</span>';
						}
						?></td>
					</tr>
				<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>