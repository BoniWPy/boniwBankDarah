	</main>
  </div>
</div>
	<script src="<?php echo base_url('/assets/js/bootstrap.bundle.min.js') ?>"></script>
	<script src="<?php echo base_url('/assets/js/feather.min.js') ?>"></script>
	<script src="<?php echo base_url('/assets/js/Chart.min.js') ?>"></script>
	<script src="<?php echo base_url('/assets/js/dashboard.js') ?>"></script>

	<?php if( $this->session->userdata('role') == 'admin' ): ?>
	<script>

		var base_url = '<?php echo base_url("/") ?>'
		var limit = 3
		$(document).ready(function(){

			alert_limit();
			realtime_order();

		});

		var alert_limit = function(){

			var ajax_link = base_url + 'dashboard/cekstok/' + limit

			$.get(ajax_link).fail(function(xhr,code,err){
				alert(err)
			}).done(function(res){
				if( res != '' ) alert(res)
			})

			setTimeout("alert_limit()", 500000);
		}

		var realtime_order = function(){

			var ajax_link = base_url + 'dashboard/pesanan'

			$.get(ajax_link).fail(function(xhr,code,err){
				alert(err)
			}).done(function(res){
				if( res != '' ) alert(res)
			})

			setTimeout("realtime_order()", 100000);
		}
	</script>
	<?php endif; ?>
</body>
</html>
